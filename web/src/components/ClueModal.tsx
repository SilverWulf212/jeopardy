import { useEffect, useMemo, useState } from "react";
import type { Clue, Player } from "../lib/types";
import { clampWager } from "../lib/game";
import { useBuzzers } from "../lib/buzzer";
import { sfx } from "../lib/sound";

type Phase = "wager" | "read" | "buzz" | "reveal";

export function ClueModal({ clue, categoryTitle, players, onResolve, onCancel }: {
  clue: Clue;
  categoryTitle: string;
  players: Player[];
  onResolve: (winnerId: string | null, correct: boolean, amount: number) => void;
  onCancel: () => void;
}) {
  const needsWager = clue.daily_double;
  const [phase, setPhase] = useState<Phase>(needsWager ? "wager" : "read");
  const [wager, setWager] = useState<number>(() => Math.max(...players.map((p) => p.score), 0) || 1000);
  const [buzzedId, setBuzzedId] = useState<string | null>(null);
  const [locked, setLocked] = useState<Set<string>>(new Set());
  const [showAnswer, setShowAnswer] = useState(false);

  const amount = needsWager ? clampWager(wager, players.find((p) => p.id === buzzedId)?.score ?? Math.max(...players.map((p) => p.score), 0)) : clue.value;
  const buzzedPlayer = players.find((p) => p.id === buzzedId) ?? null;

  useBuzzers({
    enabled: phase === "buzz" && !buzzedId,
    players,
    lockedOut: locked,
    onBuzz: (id) => {
      sfx.buzz();
      setBuzzedId(id);
    },
  });

  // READ phase auto-arms buzzer after short delay (host can skip)
  useEffect(() => {
    if (phase !== "read") return;
    const t = setTimeout(() => setPhase("buzz"), 1200);
    return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [clue.id]);

  useEffect(() => {
    if (clue.daily_double && phase === "wager") sfx.dailyDouble();
    else if (phase === "read") sfx.select();
  }, [clue.id, phase, clue.daily_double]);

  const remaining = useMemo(() => players.filter((p) => !locked.has(p.id)), [players, locked]);

  if (phase === "wager") {
    // Daily Double: pick player first (default highest score), then wager
    const order = [...players].sort((a, b) => b.score - a.score);
    const sel = buzzedId ?? order[0]?.id ?? players[0]?.id;
    const selPlayer = players.find((p) => p.id === sel)!;
    const max = Math.max(selPlayer.score > 1000 ? selPlayer.score : 1000, 5);
    return (
      <Overlay>
        <div className="clue-flip w-full max-w-2xl rounded-2xl bg-gradient-to-b from-[#1010ff] to-[#04048a] border-2 border-[#ffcc57] p-8 text-center shadow-2xl">
          <div className="font-value text-[#ffcc57] tracking-[0.3em] text-sm">DAILY DOUBLE</div>
          <h2 className="font-display text-3xl mt-2">Wager, {selPlayer.name}</h2>
          <div className="flex gap-2 justify-center mt-4 flex-wrap">
            {players.map((p) => (
              <button key={p.id} onClick={() => setBuzzedId(p.id)}
                className={`px-3 py-1.5 rounded-lg border text-sm ${sel === p.id ? "bg-[#ffcc57] text-black border-[#ffcc57]" : "bg-white/10 border-white/20"}`}>
                {p.name} (${p.score})
              </button>
            ))}
          </div>
          <input
            type="number" value={wager} min={5} max={max}
            onChange={(e) => setWager(Number(e.target.value))}
            className="mt-6 w-48 text-center text-3xl font-value text-black rounded-lg px-3 py-2"
            data-testid="wager-input"
          />
          <div className="text-white/60 text-sm mt-2">Range $5 – ${max.toLocaleString()}</div>
          <div className="flex gap-3 justify-center mt-6">
            <button onClick={onCancel} className="px-4 py-2 rounded-lg bg-white/10 border border-white/20">Cancel</button>
            <button
              data-testid="wager-confirm"
              onClick={() => { setWager(clampWager(wager, selPlayer.score, 1000)); setPhase("read"); }}
              className="px-6 py-2 rounded-lg bg-[#ffcc57] text-black font-bold">
              Lock wager
            </button>
          </div>
        </div>
      </Overlay>
    );
  }

  return (
    <Overlay>
      <div className="clue-flip w-full max-w-4xl rounded-2xl bg-gradient-to-b from-[#0d0df7] to-[#03036e] border-2 border-[#ffcc5766] shadow-2xl overflow-hidden">
        <div className="flex items-center gap-3 px-6 py-3 bg-black/40 border-b border-white/10">
          <span className="font-value text-[#ffcc57] tracking-widest text-sm">{categoryTitle}</span>
          <span className="text-white/40">•</span>
          <span className="font-value text-white text-lg">
            {needsWager ? `WAGER $${amount.toLocaleString()}` : `$${clue.value.toLocaleString()}`}
          </span>
          {clue.daily_double && <span className="ml-auto text-xs bg-[#ffcc57] text-black font-bold px-2 py-1 rounded">DAILY DOUBLE</span>}
          <button onClick={onCancel} className="ml-auto text-white/50 hover:text-white px-2">✕</button>
        </div>

        <div className="px-6 md:px-12 py-10 min-h-[220px] flex items-center justify-center text-center">
          <p className="font-display text-2xl md:text-4xl leading-snug">{clue.question}</p>
        </div>

        {phase === "read" && (
          <div className="px-6 pb-6 flex items-center justify-center gap-3">
            <span className="text-white/60 text-sm">Reading… buzzers arming</span>
            <button onClick={() => setPhase("buzz")} className="px-5 py-2 rounded-lg bg-[#ffcc57] text-black font-bold" data-testid="enable-buzzer">
              Enable buzzers
            </button>
          </div>
        )}

        {phase === "buzz" && !buzzedId && (
          <div className="pb-6">
            <div className="buzz-band font-value tracking-[0.25em] text-black text-lg md:text-xl text-center py-3">
              BUZZ IN — {remaining.map((p) => `${p.name} [${p.keyLabel}]`).join(" · ")}
            </div>
            <div className="flex justify-center gap-2 mt-4 flex-wrap px-6">
              {players.map((p) => (
                <button
                  key={p.id}
                  disabled={locked.has(p.id)}
                  onClick={() => setBuzzedId(p.id)}
                  className="px-3 py-1.5 rounded-lg bg-white/10 border border-white/20 text-sm disabled:opacity-30"
                >
                  {p.name} buzz
                </button>
              ))}
            </div>
            <div className="text-center mt-3">
              <button onClick={() => setShowAnswer((s) => !s)} className="text-white/60 underline text-sm">
                {showAnswer ? "Hide answer" : "Host: peek answer"}
              </button>
              {showAnswer && <div className="font-display text-xl mt-1 text-[#ffcc57]">{clue.answer}</div>}
            </div>
          </div>
        )}

        {buzzedId && buzzedPlayer && phase === "buzz" && (
          <div className="px-6 pb-6 text-center">
            <div className="font-value text-2xl" style={{ color: buzzedPlayer.color }}>
              🔔 {buzzedPlayer.name} buzzed!
            </div>
            {showAnswer && <div className="font-display text-xl mt-1 text-[#ffcc57]">{clue.answer}</div>}
            <div className="flex justify-center gap-2 mt-4 flex-wrap">
              <button onClick={() => setShowAnswer((s) => !s)} className="px-4 py-2 rounded-lg bg-white/10 border border-white/20">
                {showAnswer ? "Hide" : "Show"} answer
              </button>
              <button
                data-testid="mark-correct"
                onClick={() => { sfx.correct(); onResolve(buzzedId, true, amount); }}
                className="px-6 py-2 rounded-lg bg-green-500 font-bold">
                ✓ Correct (+${amount.toLocaleString()})
              </button>
              <button
                data-testid="mark-wrong"
                onClick={() => {
                  sfx.wrong();
                  const next = new Set(locked); next.add(buzzedId);
                  setLocked(next); setBuzzedId(null);
                  if (needsWager) { onResolve(buzzedId, false, amount); return; }
                  if (next.size >= players.length) { onResolve(null, false, 0); return; }
                }}
                className="px-6 py-2 rounded-lg bg-red-500 font-bold">
                ✗ Wrong (−${amount.toLocaleString()})
              </button>
            </div>
          </div>
        )}

        {(phase === "reveal" || (!buzzedId && locked.size >= players.length)) && (
          <div className="px-6 pb-6 text-center">
            <div className="font-display text-2xl text-[#ffcc57]">{clue.answer}</div>
          </div>
        )}
      </div>
    </Overlay>
  );
}

function Overlay({ children }: { children: React.ReactNode }) {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/70 backdrop-blur-sm" data-testid="clue-modal">
      {children}
    </div>
  );
}
