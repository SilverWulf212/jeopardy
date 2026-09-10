import { Pool } from "pg";

const connectionString =
  process.env.DATABASE_URL ??
  "postgres://jeopardy:jeopardy@localhost:5432/jeopardy";

export const pool = new Pool({ connectionString, max: 10 });

pool.on("error", (e) => console.error("[db] pool error", e));

export async function query<T = any>(text: string, params?: any[]): Promise<T[]> {
  const client = await pool.connect();
  try {
    const res = await client.query(text, params);
    return res.rows as T[];
  } finally {
    client.release();
  }
}
