import type { Player } from "./types";
import { keyLabelFor } from "./types";

/** Assignable keyboard buzzers: first-press-wins with per-clue lockout. */
export function useBuzzers(opts: {
  enabled: boolean;
  players: Player[];
  lockedOut: Set<string>;
  onBuzz: (playerId: string) => void;
}) {
  const { enabled, players, lockedOut, onBuzz } = opts;

  (window as any).__buzzRef = { enabled, players, lockedOut, onBuzz };

  // install once
  if (!(window as any).__buzzInstalled) {
    (window as any).__buzzInstalled = true;
    window.addEventListener("keydown", (e: KeyboardEvent) => {
      const st = (window as any).__buzzRef;
      if (!st?.enabled) return;
      const t = e.target as HTMLElement;
      if (t?.tagName === "INPUT" || t?.tagName === "TEXTAREA" || t?.tagName === "SELECT") return;
      if (t?.isContentEditable) return;
      const p = st.players.find((x: Player) => x.key === (e as KeyboardEvent).code);
      if (!p) return;
      if (st.lockedOut.has(p.id)) return;
      e.preventDefault();
      st.onBuzz(p.id);
    });
  }
}

export function captureNextKey(): Promise<{ code: string; label: string }> {
  return new Promise((resolve) => {
    const h = (e: KeyboardEvent) => {
      e.preventDefault();
      e.stopPropagation();
      window.removeEventListener("keydown", h, true);
      resolve({ code: e.code, label: keyLabelFor(e.code, e.key) });
    };
    window.addEventListener("keydown", h, true);
  });
}
