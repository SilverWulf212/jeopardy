import { useState } from "react";
import type { Player } from "../lib/types";
import { captureNextKey } from "../lib/buzzer";

const COLORS = ["#ff5470", "#3ddad7", "#ffcc57", "#7cf29c", "#b28bff"];

export function SetupScreen({ players, setPlayers, boards, boardId, setBoardId, onStart }: {
  players: Player[];
  setPlayers: (p: Player[]) => void;
  boards: { id: string; name: string }[];
  boardId: string | null;
  setBoardId: (id: string) => void;
  onStart: () => void;
}) {
  const [capturing, setCapturing] = useState<string | null>(null);
  const [error, setError] = useState("");

  const setKey = async (id: string) => {
    setCapturing(id);
    const k = await captureNextKey();
    setCapturing(null);
    const clash = players.find((p) => p.id !== id && p.key === k.code);
    if (clash) { setError(`Key "${k.label}" is already used by ${clash.name}`); return; }
    setError("");
    setPlayers(players.map((p) => (p.id === id ? { ...p, key: k.code, keyLabel: k.label } : p)));
  };

  return (
    <div className="max-w-4xl mx-auto">
      <div className="text-center py-8">
        <div className="font-value tracking-[0.4em] text-[#ffcc57] text-sm">THIS IS</div>
        <h1 className="font-display font-extrabold text-5xl md:text-7xl j-gold-text tracking-wide">JEOPARDY!</h1>
        <p className="text-white/60 mt-2">Self-hosted • {players.length} players • first-press buzzer</p>
      </div>

      <div className="grid md:grid-cols-2 gap-4">
        <div className="rounded-2xl bg-white/5 border border-white/10 p-5">
          <h2 className="font-value tracking-widest text-[#ffcc57]">PLAYERS & BUZZERS</h2>
          <div className="flex flex-col gap-3 mt-3">
            {players.map((p, i) => (
              <div key={p.id} className="flex items-center gap-2 bg-black/30 rounded-xl p-2 border border-white/10">
                <input
                  type="color" value={p.color}
                  onChange={(e) => setPlayers(players.map((x) => (x.id === p.id ? { ...x, color: e.target.value } : x)))}
                  className="w-8 h-8 rounded cursor-pointer bg-transparent"
                />
                <input
                  value={p.name}
                  onChange={(e) => setPlayers(players.map((x) => (x.id === p.id ? { ...x, name: e.target.value } : x)))}
                  className="flex-1 bg-white/10 rounded-lg px-2 py-1.5 text-sm"
                />
                <button
                  onClick={() => setKey(p.id)}
                  className="px-3 py-1.5 rounded-lg bg-[#ffcc57] text-black font-mono font-bold text-sm min-w-[64px]"
                  data-testid={`set-key-${i}`}
                >
                  {capturing === p.id ? "…" : p.keyLabel}
                </button>
                {players.length > 2 && (
                  <button
                    onClick={() => setPlayers(players.filter((x) => x.id !== p.id))}
                    className="text-white/40 hover:text-white px-1">✕</button>
                )}
              </div>
            ))}
          </div>
          {error && <div className="text-red-400 text-sm mt-2">{error}</div>}
          {capturing && <div className="text-[#ffcc57] text-sm mt-2 animate-pulse">Press any key for {players.find((p) => p.id === capturing)?.name}…</div>}
          <div className="flex gap-2 mt-3">
            {players.length < 4 && (
              <button
                onClick={() => {
                  const n = players.length + 1;
                  const used = new Set(players.map((p) => p.key));
                  const fallback = ["KeyA", "KeyF", "KeyL", "Enter"].find((k) => !used.has(k)) ?? `Digit${n}`;
                  setPlayers([...players, {
                    id: `p${Date.now()}`, name: `Player ${n}`,
                    color: COLORS[n % COLORS.length], key: fallback,
                    keyLabel: fallback.replace("Key", ""), score: 0,
                  }]);
                }}
                className="px-3 py-1.5 rounded-lg bg-white/10 border border-white/20 text-sm"
              >
                + Add player
              </button>
            )}
            <button onClick={() => setPlayers(players.map((p) => ({ ...p, score: 0 })))} className="px-3 py-1.5 rounded-lg bg-white/10 border border-white/20 text-sm">
              Reset scores
            </button>
          </div>
          <p className="text-white/40 text-xs mt-3">Tip: pick far-apart keys (A / F / L). Keys are saved automatically.</p>
        </div>

        <div className="rounded-2xl bg-white/5 border border-white/10 p-5">
          <h2 className="font-value tracking-widest text-[#ffcc57]">GAME BOARD</h2>
          <div className="flex flex-col gap-2 mt-3">
            {boards.map((b) => (
              <button
                key={b.id}
                onClick={() => setBoardId(b.id)}
                className={`text-left px-4 py-3 rounded-xl border font-display font-bold ${boardId === b.id ? "bg-[#060ce9] border-[#ffcc57]" : "bg-black/30 border-white/10 hover:border-white/30"}`}
              >
                {b.name}
              </button>
            ))}
            {!boards.length && <div className="text-white/50 text-sm">No boards yet — create questions in Manage, or wait for seed data.</div>}
          </div>
          <button
            onClick={onStart}
            disabled={!boardId}
            className="mt-5 w-full py-3 rounded-xl bg-[#ffcc57] text-black font-value font-bold text-xl tracking-widest disabled:opacity-40"
            data-testid="start-game"
          >
            START GAME →
          </button>
        </div>
      </div>
    </div>
  );
}
