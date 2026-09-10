import type { BoardFull, Category, Clue } from "./types";

const BASE = import.meta.env.VITE_API_URL ?? "";

async function j<T>(res: Response): Promise<T> {
  if (!res.ok) throw new Error(`API ${res.status}: ${await res.text()}`);
  return res.json() as Promise<T>;
}

export const adminToken = {
  get: () => { try { return sessionStorage.getItem("j-admin-token") ?? ""; } catch { return ""; } },
  set: (t: string) => { try { sessionStorage.setItem("j-admin-token", t); } catch {} },
};

function headers(): Record<string, string> {
  const h: Record<string, string> = { "Content-Type": "application/json" };
  const t = adminToken.get();
  if (t) h["x-admin-token"] = t;
  return h;
}

export const api = {
  health: () => fetch(`${BASE}/api/health`).then((r) => j<any>(r)),
  tags: (): Promise<string[]> => fetch(`${BASE}/api/tags`).then((r) => j<string[]>(r)),
  categories: (tag?: string, q?: string): Promise<Category[]> => {
    const p = new URLSearchParams();
    if (tag) p.set("tag", tag);
    if (q) p.set("q", q);
    const s = p.toString();
    return fetch(`${BASE}/api/categories${s ? `?${s}` : ""}`).then((r) => j<Category[]>(r));
  },
  createCategory: (title: string, description = "", tags: string[] = []) =>
    fetch(`${BASE}/api/categories`, {
      method: "POST", headers: headers(),
      body: JSON.stringify({ title, description, tags }),
    }).then((r) => j<Category>(r)),
  updateCategory: (id: string, title: string, description = "", tags: string[] = []) =>
    fetch(`${BASE}/api/categories/${id}`, {
      method: "PUT", headers: headers(),
      body: JSON.stringify({ title, description, tags }),
    }).then((r) => j<Category>(r)),
  deleteCategory: (id: string) => fetch(`${BASE}/api/categories/${id}`, { method: "DELETE" }).then((r) => j<any>(r)),

  clues: (category_id?: string): Promise<Clue[]> =>
    fetch(`${BASE}/api/clues${category_id ? `?category_id=${category_id}` : ""}`).then((r) => j<Clue[]>(r)),
  createClue: (c: Omit<Clue, "id">) =>
    fetch(`${BASE}/api/clues`, {
      method: "POST", headers: headers(),
      body: JSON.stringify(c),
    }).then((r) => j<Clue>(r)),
  updateClue: (id: string, c: Omit<Clue, "id">) =>
    fetch(`${BASE}/api/clues/${id}`, {
      method: "PUT", headers: headers(),
      body: JSON.stringify(c),
    }).then((r) => j<Clue>(r)),
  deleteClue: (id: string) => fetch(`${BASE}/api/clues/${id}`, { method: "DELETE" }).then((r) => j<any>(r)),

  boards: (tag?: string) => fetch(`${BASE}/api/boards${tag ? `?tag=${encodeURIComponent(tag)}` : ""}`).then((r) => j<{ id: string; name: string; description: string; tags: string[]; categories: number; clues: number }[]>(r)),
  board: (id: string): Promise<BoardFull> => fetch(`${BASE}/api/boards/${id}`).then((r) => j<BoardFull>(r)),
  createBoard: (b: { name: string; description?: string; tags?: string[]; jeopardy?: string[]; double?: string[]; final?: string }) =>
    fetch(`${BASE}/api/boards`, {
      method: "POST", headers: headers(),
      body: JSON.stringify(b),
    }).then((r) => j<{ id: string; name: string }>(r)),
  deleteBoard: (id: string) => fetch(`${BASE}/api/boards/${id}`, { method: "DELETE" }).then((r) => j<any>(r)),
};
