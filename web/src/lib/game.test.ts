import { describe, it, expect } from "vitest";
import { applyScore, clampWager, roundValues } from "./game";

describe("scoring", () => {
  it("adds on correct", () => expect(applyScore(200, 400, true)).toBe(600));
  it("subtracts on wrong", () => expect(applyScore(200, 400, false)).toBe(-200));
});

describe("wagers", () => {
  it("clamps to min 5", () => expect(clampWager(0, 0)).toBe(5));
  it("allows all-in when leading", () => expect(clampWager(5000, 5000)).toBe(5000));
  it("caps at max clue when broke", () => expect(clampWager(99999, 0)).toBe(2000));
});

describe("rounds", () => {
  it("jeopardy values", () => expect(roundValues("jeopardy")).toEqual([200, 400, 600, 800, 1000]));
  it("double values", () => expect(roundValues("double")).toEqual([400, 800, 1200, 1600, 2000]));
});
