import type { Player } from "../lib/types";

export function Scorebar({ players, buzzedId, roundLabel }: {
  players: Player[];
  buzzedId: string | null;
  roundLabel: string;
}) {
  return (
    <div className="flex items-stretch gap-2 w-full">
      <div className="hidden md:flex flex-col justify-center px-4 py-2 rounded-xl bg-black/40 border border-[#d7a94b55]">
        <div className="font-value text-[#ffcc57] tracking-widest text-sm">JEOPARDY!</div>
        <div className="text-[11px] uppercase tracking-widest text-white/60">{roundLabel}</div>
      </div>
      <div className="grid flex-1 gap-2" style={{ gridTemplateColumns: `repeat(${players.length}, minmax(0,1fr))` }}>
        {players.map((p) => {
          const active = buzzedId === p.id;
          return (
            <div
              key={p.id}
              className={`rounded-xl px-3 py-2 border bg-black/40 backdrop-blur transition-all ${active ? "buzz-pulse border-[#ffcc57]" : "border-white/15"}`}
              style={{ boxShadow: active ? `0 0 24px ${p.color}66` : undefined }}
            >
              <div className="flex items-center gap-2">
                <span className="w-3 h-3 rounded-full" style={{ background: p.color }} />
                <span className="font-semibold truncate text-sm">{p.name}</span>
                <kbd className="ml-auto text-[11px] px-1.5 py-0.5 rounded bg-white/10 border border-white/20 font-mono">
                  {p.keyLabel}
                </kbd>
              </div>
              <div className={`font-value text-2xl tabular-nums ${p.score < 0 ? "text-red-400" : "text-white"}`}>
                ${p.score.toLocaleString()}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
