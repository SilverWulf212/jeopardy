import "dotenv/config";
import express from "express";
import cors from "cors";
import path from "path";
import fs from "fs";
import { fileURLToPath } from "url";
import { z } from "zod";
import { pool, query } from "./db.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const app = express();
app.disable("x-powered-by");
app.use(cors());
app.use(express.json({ limit: "1mb" }));

// ---------- helpers ----------
const CategorySchema = z.object({
  title: z.string().min(1).max(120),
  description: z.string().max(500).optional().default(""),
  tags: z.array(z.string().min(1).max(40)).max(10).optional().default([]),
});
const ClueSchema = z.object({
  category_id: z.string().uuid(),
  round: z.enum(["jeopardy", "double", "final"]).default("jeopardy"),
  value: z.number().int().min(0).max(10000),
  question: z.string().min(1),
  answer: z.string().min(1),
  daily_double: z.boolean().optional().default(false),
});
const BoardSchema = z.object({
  name: z.string().min(1).max(120),
  description: z.string().max(500).optional().default(""),
  tags: z.array(z.string().min(1).max(40)).max(10).optional().default([]),
  jeopardy: z.array(z.string().uuid()).max(6).optional(),
  double: z.array(z.string().uuid()).max(6).optional(),
  final: z.string().uuid().optional(),
});

function asyncHandler(fn: any) {
  return (req: any, res: any, next: any) => Promise.resolve(fn(req, res, next)).catch(next);
}

function normTags(tags: string[] | undefined): string[] {
  return [...new Set((tags ?? []).map((t) => t.trim().toLowerCase()).filter(Boolean))];
}

// Public can read/play. Writes require ADMIN_TOKEN (empty = open, dev only).
const ADMIN_TOKEN = process.env.ADMIN_TOKEN ?? "";
function requireAdmin(req: any, res: any, next: any) {
  if (!ADMIN_TOKEN) {
    console.warn("[auth] ADMIN_TOKEN unset — write endpoints open (dev only)");
    return next();
  }
  if (req.headers["x-admin-token"] === ADMIN_TOKEN) return next();
  res.status(401).json({ error: "admin token required" });
}

app.get("/api/tags", asyncHandler(async (_req: any, res: any) => {
  const rows = await query<{ tag: string }>(
    `SELECT DISTINCT unnest(tags) AS tag FROM categories WHERE tags <> '{}'
     UNION SELECT DISTINCT unnest(tags) FROM boards WHERE tags <> '{}' ORDER BY 1`
  );
  res.json(rows.map((r) => r.tag));
}));

// ---------- health ----------
app.get("/api/health", asyncHandler(async (_req: any, res: any) => {
  await pool.query("SELECT 1");
  res.json({ ok: true, time: new Date().toISOString() });
}));

// ---------- categories ----------
app.get("/api/categories", asyncHandler(async (req: any, res: any) => {
  const { tag, q } = req.query as Record<string, string>;
  const conds: string[] = [];
  const params: any[] = [];
  if (tag) { params.push(tag.toLowerCase()); conds.push(`$${params.length} = ANY(tags)`); }
  if (q) { params.push(`%${q}%`); conds.push(`title ILIKE $${params.length}`); }
  const where = conds.length ? `WHERE ${conds.join(" AND ")}` : "";
  const rows = await query(`SELECT * FROM categories ${where} ORDER BY title ASC`, params);
  res.json(rows);
}));
app.post("/api/categories", requireAdmin, asyncHandler(async (req: any, res: any) => {
  const body = CategorySchema.parse(req.body);
  const rows = await query(
    "INSERT INTO categories (title, description, tags) VALUES ($1,$2,$3) RETURNING *",
    [body.title, body.description, normTags(body.tags)]
  );
  res.status(201).json(rows[0]);
}));
app.put("/api/categories/:id", requireAdmin, asyncHandler(async (req: any, res: any) => {
  const body = CategorySchema.parse(req.body);
  const rows = await query(
    "UPDATE categories SET title=$1, description=$2, tags=$3 WHERE id=$4 RETURNING *",
    [body.title, body.description, normTags(body.tags), req.params.id]
  );
  if (!rows.length) return res.status(404).json({ error: "not found" });
  res.json(rows[0]);
}));
app.delete("/api/categories/:id", requireAdmin, asyncHandler(async (req: any, res: any) => {
  await query("DELETE FROM categories WHERE id=$1", [req.params.id]);
  res.json({ ok: true });
}));

// ---------- clues ----------
app.get("/api/clues", asyncHandler(async (req: any, res: any) => {
  const { category_id, round } = req.query as Record<string, string>;
  const conds: string[] = [];
  const params: any[] = [];
  if (category_id) { params.push(category_id); conds.push(`category_id=$${params.length}`); }
  if (round) { params.push(round); conds.push(`round=$${params.length}`); }
  const where = conds.length ? `WHERE ${conds.join(" AND ")}` : "";
  const rows = await query(`SELECT * FROM clues ${where} ORDER BY round, value ASC`, params);
  res.json(rows);
}));
app.post("/api/clues", requireAdmin, asyncHandler(async (req: any, res: any) => {
  const b = ClueSchema.parse(req.body);
  const rows = await query(
    "INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES ($1,$2,$3,$4,$5,$6) RETURNING *",
    [b.category_id, b.round, b.value, b.question, b.answer, b.daily_double]
  );
  res.status(201).json(rows[0]);
}));
app.put("/api/clues/:id", requireAdmin, asyncHandler(async (req: any, res: any) => {
  const b = ClueSchema.parse(req.body);
  const rows = await query(
    "UPDATE clues SET category_id=$1, round=$2, value=$3, question=$4, answer=$5, daily_double=$6 WHERE id=$7 RETURNING *",
    [b.category_id, b.round, b.value, b.question, b.answer, b.daily_double, req.params.id]
  );
  if (!rows.length) return res.status(404).json({ error: "not found" });
  res.json(rows[0]);
}));
app.delete("/api/clues/:id", requireAdmin, asyncHandler(async (req: any, res: any) => {
  await query("DELETE FROM clues WHERE id=$1", [req.params.id]);
  res.json({ ok: true });
}));

// ---------- boards ----------
app.get("/api/boards", asyncHandler(async (req: any, res: any) => {
  const { tag } = req.query as Record<string, string>;
  const params: any[] = [];
  const where = tag ? `WHERE $1 = ANY(b.tags)` : "";
  if (tag) params.push(tag.toLowerCase());
  const rows = await query(
    `SELECT b.*,
       (SELECT COUNT(*)::int FROM board_categories bc WHERE bc.board_id=b.id) AS categories,
       (SELECT COUNT(*)::int FROM clues cl WHERE cl.category_id IN
         (SELECT category_id FROM board_categories WHERE board_id=b.id)) AS clues
      FROM boards b ${where} ORDER BY b.created_at DESC`,
    params
  );
  res.json(rows);
}));

app.get("/api/boards/:id", asyncHandler(async (req: any, res: any) => {
  const boards = await query("SELECT * FROM boards WHERE id=$1", [req.params.id]);
  if (!boards.length) return res.status(404).json({ error: "board not found" });
  const board = boards[0] as any;
  const cats = await query(
    `SELECT c.*, bc.round, bc.position FROM board_categories bc
     JOIN categories c ON c.id = bc.category_id
     WHERE bc.board_id=$1 ORDER BY bc.round, bc.position`,
    [board.id]
  );
  const clues = await query(
    `SELECT cl.* FROM clues cl WHERE cl.category_id IN
     (SELECT category_id FROM board_categories WHERE board_id=$1)
     ORDER BY cl.round, cl.value ASC`,
    [board.id]
  );
  res.json({ ...board, categories: cats, clues });
}));

app.post("/api/boards", requireAdmin, asyncHandler(async (req: any, res: any) => {
  const b = BoardSchema.parse(req.body);
  const rows = await query(
    "INSERT INTO boards (name, description, tags) VALUES ($1,$2,$3) RETURNING *",
    [b.name, b.description, normTags(b.tags)]
  );
  const board = rows[0] as any;
  const insertCat = async (ids: string[] | undefined, round: string) => {
    if (!ids) return;
    for (let i = 0; i < ids.length; i++) {
      await query(
        "INSERT INTO board_categories (board_id, category_id, round, position) VALUES ($1,$2,$3,$4) ON CONFLICT DO NOTHING",
        [board.id, ids[i], round, i]
      );
    }
  };
  await insertCat(b.jeopardy, "jeopardy");
  await insertCat(b.double, "double");
  if (b.final) {
    await query(
      "INSERT INTO board_categories (board_id, category_id, round, position) VALUES ($1,$2,$3,0) ON CONFLICT DO NOTHING",
      [board.id, b.final, "final"]
    );
  }
  res.status(201).json(board);
}));

app.delete("/api/boards/:id", requireAdmin, asyncHandler(async (req: any, res: any) => {
  await query("DELETE FROM boards WHERE id=$1", [req.params.id]);
  res.json({ ok: true });
}));

// ---------- static (prod): serve web/dist ----------
// In docker we copy web build to ./public (see Dockerfile note). Also support ../web/dist locally.
const candidates = [
  path.join(__dirname, "../public"),
  path.join(__dirname, "../../web/dist"),
  path.join(process.cwd(), "public"),
];
const staticDir = candidates.find((p) => fs.existsSync(p) && fs.existsSync(path.join(p, "index.html")));
if (staticDir) {
  console.log(`[web] serving ${staticDir}`);
  // Hashed assets are immutable; the HTML shell must never cache (else
  // players run stale game code with old behavior).
  app.use(express.static(staticDir, { maxAge: "1y", immutable: true }));
  app.get("*", (_req, res) => {
    res.set("Cache-Control", "no-store");
    res.sendFile(path.join(staticDir, "index.html"));
  });
} else {
  console.log("[web] no static build found, API-only mode");
}

// ---------- error + boot ----------
app.use((err: any, _req: any, res: any, _next: any) => {
  console.error(err);
  if (err?.name === "ZodError") return res.status(400).json({ error: "validation", details: err.issues });
  if (String(err?.message ?? "").includes("duplicate")) return res.status(409).json({ error: "duplicate" });
  res.status(500).json({ error: "internal", message: String(err?.message ?? err) });
});

const PORT = Number(process.env.PORT ?? 3001);

async function waitForDb(retries = 20) {
  for (let i = 0; i < retries; i++) {
    try {
      await pool.query("SELECT 1");
      console.log("[db] connected");
      return;
    } catch (e) {
      console.log(`[db] waiting… (${i + 1}/${retries})`);
      await new Promise((r) => setTimeout(r, 1500));
    }
  }
  console.error("[db] could not connect — API will still boot, /api/health will fail");
}

await waitForDb();
app.listen(PORT, () => console.log(`[api] listening on :${PORT}`));
