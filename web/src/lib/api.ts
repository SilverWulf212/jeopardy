import type { BoardFull, Category, Clue } from "./types";

const BASE = import.meta.env.VITE_API_URL ?? "";

async function j<T>(res: Response): Promise<T> {
  if (!res.ok) throw new Error(`API ${res.status}: ${await res.text()}`);
  return res.json() as Promise<T>;
}

export const api = {
  health: () => fetch(`${BASE}/api/health`).then((r) => j<any>(r)),
  categories: (): Promise<Category[]> => fetch(`${BASE}/api/categories`).then((r) => j<Category[]>(r)),
  createCategory: (title: string, description = "") =>
    fetch(`${BASE}/api/categories`, {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title, description }),
    }).then((r) => j<Category>(r)),
  updateCategory: (id: string, title: string, description = "") =>
    fetch(`${BASE}/api/categories/${id}`, {
      method: "PUT", headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title, description }),
    }).then((r) => j<Category>(r)),
  deleteCategory: (id: string) => fetch(`${BASE}/api/categories/${id}`, { method: "DELETE" }).then((r) => j<any>(r)),

  clues: (category_id?: string): Promise<Clue[]> =>
    fetch(`${BASE}/api/clues${category_id ? `?category_id=${category_id}` : ""}`).then((r) => j<Clue[]>(r)),
  createClue: (c: Omit<Clue, "id">) =>
    fetch(`${BASE}/api/clues`, {
      method: "POST", headers: { "Content-Type": "application/json" },
      body: JSON.stringify(c),
    }).then((r) => j<Clue>(r)),
  updateClue: (id: string, c: Omit<Clue, "id">) =>
    fetch(`${BASE}/api/clues/${id}`, {
      method: "PUT", headers: { "Content-Type": "application/json" },
      body: JSON.stringify(c),
    }).then((r) => j<Clue>(r)),
  deleteClue: (id: string) => fetch(`${BASE}/api/clues/${id}`, { method: "DELETE" }).then((r) => j<any>(r)),

  boards: () => fetch(`${BASE}/api/boards`).then((r) => j<{ id: string; name: string }[]>(r)),
  board: (id: string): Promise<BoardFull> => fetch(`${BASE}/api/boards/${id}`).then((r) => j<BoardFull>(r)),
};
