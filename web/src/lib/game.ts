import type { BoardFull, Clue, Round } from "./types";

export function categoriesForRound(board: BoardFull, round: Round) {
  return board.categories
    .filter((c) => (c.round ?? "jeopardy") === round)
    .sort((a, b) => (a.position ?? 0) - (b.position ?? 0));
}

export function cluesFor(board: BoardFull, categoryId: string, round: Round): Clue[] {
  return board.clues
    .filter((c) => c.category_id === categoryId && c.round === round)
    .sort((a, b) => a.value - b.value);
}

export function roundValues(round: Round): number[] {
  return round === "double" ? [400, 800, 1200, 1600, 2000] : [200, 400, 600, 800, 1000];
}

export function isBoardClear(board: BoardFull, round: Round, usedIds: Set<string>): boolean {
  return cluesForRound(board, round).every((c) => usedIds.has(c.id));
}

export function cluesForRound(board: BoardFull, round: Round): Clue[] {
  return board.clues.filter((c) => c.round === round);
}

export function applyScore(score: number, value: number, correct: boolean): number {
  return correct ? score + value : score - value;
}

export function clampWager(wager: number, score: number, maxClue = 2000): number {
  const min = 5;
  const max = Math.max(score > maxClue ? score : maxClue, min);
  if (!Number.isFinite(wager)) return Math.min(Math.max(score, min), max);
  return Math.min(Math.max(Math.floor(wager), min), max);
}
