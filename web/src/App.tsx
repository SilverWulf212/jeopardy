import { useCallback, useEffect, useMemo, useState } from "react";
import type { BoardFull, BoardSummary, Clue, Player, Round } from "./lib/types";
import { DEFAULT_PLAYERS } from "./lib/types";
import { api } from "./lib/api";
import { categoriesForRound, isBoardClear, applyScore, clampWager } from "./lib/game";
import { Scorebar } from "./components/Scorebar";
import { Board } from "./components/Board";
import { ClueModal } from "./components/ClueModal";
import { AdminPanel } from "./components/AdminPanel";
import { SetupScreen } from "./screens/SetupScreen";
import { sfx, isMuted, setMuted } from "./lib/sound";

type Tab = "play" | "manage";
type Stage = "setup" | "board" | "final" | "winner";

const store = {
  loadPlayers(): Player[] {
    try {
      const raw = localStorage.getItem("j-players");
      if (raw) return JSON.parse(raw);
    } catch {}
    return DEFAULT_PLAYERS;
  },
  savePlayers(p: Player[]) {
    try { localStorage.setItem("j-players", JSON.stringify(p)); } catch {}
  },
};

export default function App() {
  const [tab, setTab] = useState<Tab>("play");
  const [stage, setStage] = useState<Stage>("setup");
  const [players, setPlayersState] = useState<Player[]>(store.loadPlayers);
  const [boards, setBoards] = useState<BoardSummary[]>([]);
  const [boardId, setBoardId] = useState<string | null>(() => {
    try { return localStorage.getItem("j-board-id"); } catch { return null; }
  });
  const [muted, setMutedState] = useState(() => isMuted());
  const [buildStamp, setBuildStamp] = useState("");
  useEffect(() => {
    fetch("/built-at.txt", { cache: "no-store" }).then((r) => (r.ok ? r.text() : "")).then((t) => setBuildStamp(t.trim())).catch(() => {});
  }, []);
  const [board, setBoard] = useState<BoardFull | null>(null);
  const [round, setRound] = useState<Round>("jeopardy");
  const [usedIds, setUsedIds] = useState<Set<string>>(new Set());
  const [activeClue, setActiveClue] = useState<Clue | null>(null);
  const [apiDown, setApiDown] = useState(false);

  // Final Jeopardy state
  const [wagers, setWagers] = useState<Record<string, number>>({});
  const [finalRevealed, setFinalRevealed] = useState(false);

  const setPlayers = (p: Player[]) => { setPlayersState(p); store.savePlayers(p); };
  const pickBoard = (id: string) => {
    setBoardId(id);
    try { localStorage.setItem("j-board-id", id); } catch {}
  };

  const loadBoards = useCallback(async () => {
    try {
      const b = await api.boards();
      setBoards(b);
      setApiDown(false);
      if (b.length && !b.some((x) => x.id === boardId)) pickBoard(b[0].id);
    } catch { setApiDown(true); }
  }, [boardId]);

  useEffect(() => { void loadBoards(); }, [loadBoards]);

  const startGame = async () => {
    if (!boardId) return;
    try {
      const full = await api.board(boardId);
      setBoard(full);
      setRound("jeopardy");
      setUsedIds(new Set());
      setPlayers(players.map((p) => ({ ...p, score: 0 })));
      setStage("board");
      setFinalRevealed(false);
      setWagers({});
      sfx.final();
      try { window.scrollTo({ top: 0 }); } catch {}
    } catch (e) {
      alert("Could not load board — is the API + DB running?");
    }
  };

  const roundCats = useMemo(
    () => (board ? categoriesForRound(board, round) : []),
    [board, round]
  );

  // auto-advance rounds
  useEffect(() => {
    if (!board || stage !== "board") return;
    if (roundCats.length && isBoardClear(board, round, usedIds)) {
      if (round === "jeopardy") {
        if (categoriesForRound(board, "double").length) {
          setRound("double");
          sfx.dailyDouble();
        } else if (categoriesForRound(board, "final").length) {
          setStage("final"); sfx.final();
        } else setStage("winner");
      } else if (round === "double") {
        if (categoriesForRound(board, "final").length) { setStage("final"); sfx.final(); }
        else setStage("winner");
      }
    }
  }, [usedIds, board, round, roundCats.length, stage]);

  useEffect(() => {
    if (stage === "winner") sfx.win();
  }, [stage]);

  // Parallax arena light: pointer drives --px/--py at rAF throttle.
  // Off for reduced-motion and touch pointers.
  useEffect(() => {
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    if (window.matchMedia("(pointer: coarse)").matches) return;
    let raf = 0;
    const onMove = (e: PointerEvent) => {
      cancelAnimationFrame(raf);
      raf = requestAnimationFrame(() => {
        const root = document.documentElement;
        root.style.setProperty("--px", ((e.clientX / window.innerWidth) * 2 - 1).toFixed(3));
        root.style.setProperty("--py", ((e.clientY / window.innerHeight) * 2 - 1).toFixed(3));
      });
    };
    window.addEventListener("pointermove", onMove, { passive: true });
    return () => { window.removeEventListener("pointermove", onMove); cancelAnimationFrame(raf); };
  }, []);

  const resolveClue = (winnerId: string | null, correct: boolean, amount: number) => {
    if (!activeClue) return;
    if (winnerId && amount > 0) {
      setPlayers(players.map((p) => (p.id === winnerId ? { ...p, score: applyScore(p.score, amount, correct) } : p)));
    }
    setUsedIds((prev) => new Set(prev).add(activeClue.id));
    setActiveClue(null);
  };

  const winner = [...players].sort((a, b) => b.score - a.score)[0];

  return (
    <div className="grain min-h-full">
      <header className="sticky top-0 z-40 backdrop-blur bg-[#01022b]/80 border-b border-white/10">
        <div className="max-w-6xl mx-auto px-4 py-2 flex items-center gap-2">
          <span className="font-value font-bold tracking-widest text-[#ffcc57]">JEOPARDY!</span>
          <span className="text-white/30 text-xs hidden sm:inline">self-hosted{buildStamp ? ` · ${buildStamp}` : ""}</span>
          <nav className="ml-auto flex gap-1">
            {(["play", "manage"] as Tab[]).map((t) => (
              <button
                key={t}
                onClick={() => setTab(t)}
                className={`px-4 py-1.5 rounded-lg text-sm font-semibold capitalize ${tab === t ? "bg-[#ffcc57] text-black" : "bg-white/10 text-white/70"}`}
              >
                {t === "play" ? "▶ Play" : "Manage"}
              </button>
            ))}
          </nav>
          {stage === "board" && (
            <button onClick={() => setStage("setup")} className="px-3 py-1.5 rounded-lg bg-white/10 text-xs">Setup</button>
          )}
          <button
            onClick={() => { const m = !muted; setMuted(m); setMutedState(m); }}
            title={muted ? "Unmute sounds" : "Mute sounds"}
            aria-pressed={muted}
            className="px-3 py-1.5 rounded-lg bg-white/10 text-xs font-semibold"
          >
            {muted ? "Sound off" : "Sound on"}
          </button>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-4 py-4">
        {apiDown && tab === "play" && (
          <div className="mb-3 rounded-xl bg-red-500/15 border border-red-500/40 p-3 text-sm text-red-200">
            API offline — start Postgres + API (<code>docker compose up</code> or <code>bun run dev:api</code>). Board data comes from PostgreSQL.
          </div>
        )}

        {tab === "manage" ? (
          <AdminPanel onChanged={loadBoards} />
        ) : stage === "setup" ? (
          <SetupScreen
            players={players} setPlayers={setPlayers}
            boards={boards} boardId={boardId} setBoardId={pickBoard}
            onStart={startGame}
          />
        ) : stage === "board" && board ? (
          <div className="flex flex-col gap-3 h-[calc(100dvh-5.5rem)] min-h-[540px]">
            <Scorebar players={players} />
            <div className="flex items-center gap-2">
              <h2 className="font-value tracking-[0.25em] text-[#ffcc57]">
                {round === "double" ? "DOUBLE JEOPARDY!" : "JEOPARDY!"}
              </h2>
              <span className="text-white/40 text-sm">
                {usedIds.size}/{board.clues.filter((c) => c.round === round).length} played
              </span>
              <button
                onClick={() => { if (categoriesForRound(board, "final").length) { setStage("final"); sfx.final(); } else setStage("winner"); }}
                className="ml-auto text-xs px-3 py-1.5 rounded-lg bg-white/10 border border-white/20"
              >
                Skip to Final →
              </button>
            </div>
            <div className="board-scroll flex-1 min-h-0">
              <Board board={board} round={round} usedIds={usedIds} onPick={(c) => { setActiveClue(c); }} />
            </div>
          </div>
        ) : stage === "final" ? (
          <FinalScreen
            board={board} players={players} setPlayers={setPlayers}
            wagers={wagers} setWagers={setWagers} revealed={finalRevealed} setRevealed={setFinalRevealed}
            onDone={() => setStage("winner")}
          />
        ) : (
          <div className="text-center py-16">
            <div className="font-value tracking-[0.3em] text-[#ffcc57]">WINNER</div>
            <h2 className="font-display text-5xl mt-2">{winner?.name}</h2>
            <div className="font-value text-4xl mt-2">${winner?.score.toLocaleString()}</div>
            <div className="flex justify-center gap-2 mt-6">
              {players.map((p) => (
                <div key={p.id} className="px-4 py-2 rounded-xl bg-white/5 border border-white/10">
                  <div className="text-sm font-semibold">{p.name}</div>
                  <div className="font-value text-xl">${p.score.toLocaleString()}</div>
                </div>
              ))}
            </div>
            <div className="flex justify-center gap-2 mt-8">
              <button onClick={() => setStage("setup")} className="px-6 py-2.5 rounded-xl bg-[#ffcc57] text-black font-bold">Play again</button>
              <button onClick={startGame} className="px-6 py-2.5 rounded-xl bg-white/10 border border-white/20">Rematch (same board)</button>
            </div>
          </div>
        )}
      </main>

      {activeClue && board && (
        <ClueModal
          clue={activeClue}
          categoryTitle={board.categories.find((c) => c.id === activeClue.category_id)?.title ?? ""}
          players={players}
          onResolve={resolveClue}
          onCancel={() => setActiveClue(null)}
        />
      )}
    </div>
  );
}

function FinalScreen({ board, players, setPlayers, wagers, setWagers, revealed, setRevealed, onDone }: {
  board: BoardFull | null;
  players: Player[];
  setPlayers: (p: Player[]) => void;
  wagers: Record<string, number>;
  setWagers: (w: Record<string, number>) => void;
  revealed: boolean;
  setRevealed: (b: boolean) => void;
  onDone: () => void;
}) {
  const clue = board?.clues.find((c) => c.round === "final");
  const cat = board?.categories.find((c) => c.id === clue?.category_id);
  const [results, setResults] = useState<Record<string, boolean>>({});
  if (!clue) return <div className="p-10 text-center text-white/60">No Final Jeopardy on this board. <button onClick={onDone} className="underline">See winner →</button></div>;

  return (
    <div className="max-w-3xl mx-auto text-center">
      <div className="font-value tracking-[0.35em] text-[#ffcc57]">FINAL JEOPARDY!</div>
      <h2 className="font-display text-3xl mt-1">{cat?.title}</h2>
      {!revealed ? (
        <>
          <div className="mt-4 grid gap-2">
            {players.map((p) => (
              <div key={p.id} className="flex items-center gap-2 bg-white/5 border border-white/10 rounded-xl px-3 py-2">
                <span className="font-semibold text-sm w-32 text-left truncate">{p.name} (${p.score})</span>
                <input
                  type="number" min={0} max={Math.max(p.score, 5)}
                  value={wagers[p.id] ?? ""}
                  onChange={(e) => setWagers({ ...wagers, [p.id]: Number(e.target.value) })}
                  placeholder="Wager"
                  className="flex-1 bg-white/10 rounded-lg px-2 py-1.5 text-center font-value"
                />
              </div>
            ))}
          </div>
          <button
            onClick={() => { sfx.final(); setRevealed(true); }}
            className="mt-4 px-8 py-2.5 rounded-xl bg-[#ffcc57] text-black font-bold"
          >
            Reveal clue
          </button>
        </>
      ) : (
        <>
          <div className="clue-flip mt-4 rounded-2xl bg-gradient-to-b from-[#1010ff] to-[#04048a] border-2 border-[#ffcc57] p-8">
            <p className="font-display text-2xl md:text-3xl">{clue.question}</p>
            <details className="mt-3 text-[#ffcc57]"><summary className="cursor-pointer text-sm text-white/60">Host: show answer</summary>
              <div className="font-display text-xl mt-1">{clue.answer}</div>
            </details>
          </div>
          <div className="mt-4 grid gap-2 text-left">
            {players.map((p) => {
              const w = clampWager(wagers[p.id] ?? 0, p.score);
              const ok = results[p.id];
              return (
                <div key={p.id} className="flex items-center gap-2 bg-white/5 border border-white/10 rounded-xl px-3 py-2">
                  <span className="font-semibold text-sm flex-1">{p.name} — wager ${w.toLocaleString()}</span>
                  <button onClick={() => setResults({ ...results, [p.id]: true })} className={`px-3 py-1 rounded-lg text-sm font-bold ${ok === true ? "bg-green-500" : "bg-white/10"}`}>✓</button>
                  <button onClick={() => setResults({ ...results, [p.id]: false })} className={`px-3 py-1 rounded-lg text-sm font-bold ${ok === false ? "bg-red-500" : "bg-white/10"}`}>✗</button>
                </div>
              );
            })}
          </div>
          <button
            onClick={() => {
              setPlayers(players.map((p) => {
                if (results[p.id] === undefined) return p;
                const w = clampWager(wagers[p.id] ?? 0, p.score);
                return { ...p, score: applyScore(p.score, w, results[p.id]) };
              }));
              onDone();
            }}
            className="mt-4 px-8 py-2.5 rounded-xl bg-[#ffcc57] text-black font-bold"
          >
            Crown winner →
          </button>
        </>
      )}
    </div>
  );
}
