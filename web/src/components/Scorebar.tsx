import type { Player } from "../lib/types";

export function Scorebar({ players, buzzedId }: {
  players: Player[];
  buzzedId: string | null;
}) {
  const top = Math.max(...players.map((p) => p.score));
  return (
    <div className="grid gap-2 w-full" style={{ gridTemplateColumns: `repeat(${players.length}, minmax(0,1fr))` }}>
      {players.map((p) => {
        const active = buzzedId === p.id;
        const leader = p.score === top && top !== 0;
        return (
          <div
            key={p.id}
            className={`rounded-xl px-4 py-2.5 border bg-black/40 transition-all ${active ? "buzz-pulse border-[#ffcc57]" : "border-white/15"}`}
            style={{ boxShadow: active ? `0 0 24px ${p.color}66` : undefined }}
          >
            <div className="flex items-center gap-2">
              <span className="w-3 h-3 rounded-full shrink-0" style={{ background: p.color }} />
              <span className="font-semibold truncate text-sm md:text-base">{p.name}</span>
              {leader && (
                <span className="text-[10px] font-bold tracking-widest text-[#ffcc57] border border-[#ffcc5766] rounded px-1.5 py-px">
                  LEADER
                </span>
              )}
              <kbd className="ml-auto text-xs md:text-sm px-2 py-0.5 rounded-md bg-white/10 border border-white/20 font-mono font-bold">
                {p.keyLabel}
              </kbd>
            </div>
            <div className={`font-value text-3xl md:text-4xl tabular-nums leading-tight ${p.score < 0 ? "text-red-400" : "text-white"}`}>
              ${p.score.toLocaleString()}
            </div>
          </div>
        );
      })}
    </div>
  );
}
