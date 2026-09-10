export type Round = "jeopardy" | "double" | "final";

export interface Category {
  id: string;
  title: string;
  description: string;
  tags: string[];
  round?: Round;
  position?: number;
}

export interface Clue {
  id: string;
  category_id: string;
  round: Round;
  value: number;
  question: string;
  answer: string;
  daily_double: boolean;
}

export interface BoardFull {
  id: string;
  name: string;
  categories: Category[];
  clues: Clue[];
}

export interface Player {
  id: string;
  name: string;
  color: string;
  key: string; // e.code, e.g. "KeyA"
  keyLabel: string; // human label
  score: number;
}

export const DEFAULT_PLAYERS: Player[] = [
  { id: "p1", name: "Player 1", color: "#ff5470", key: "KeyA", keyLabel: "A", score: 0 },
  { id: "p2", name: "Player 2", color: "#3ddad7", key: "KeyF", keyLabel: "F", score: 0 },
  { id: "p3", name: "Player 3", color: "#ffcc57", key: "KeyL", keyLabel: "L", score: 0 },
];

export function keyLabelFor(code: string, key?: string): string {
  if (key && key.length === 1) return key.toUpperCase();
  if (code.startsWith("Key")) return code.slice(3);
  if (code.startsWith("Digit")) return code.slice(5);
  if (code === "Space") return "Space";
  if (code === "Enter") return "Enter";
  return code;
}
