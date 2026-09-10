import type { BoardFull, Clue, Round } from "../lib/types";
import { categoriesForRound, cluesFor } from "../lib/game";

export function Board({ board, round, usedIds, onPick }: {
  board: BoardFull;
  round: Round;
  usedIds: Set<string>;
  onPick: (clue: Clue) => void;
}) {
  const cats = categoriesForRound(board, round);
  if (!cats.length) {
    return <div className="p-10 text-center text-white/60">No categories for this round yet — add them in Manage.</div>;
  }
  return (
    <div className="board-enter grid gap-2" style={{ gridTemplateColumns: `repeat(${cats.length}, minmax(0,1fr))` }}>
      {cats.map((c) => (
        <div key={c.id} className="flex flex-col gap-2">
          <div className="j-cat rounded-lg px-2 py-3 min-h-[76px] flex items-center justify-center text-center">
            <span className="font-display font-bold text-[13px] md:text-[15px] leading-tight tracking-wide uppercase">
              {c.title}
            </span>
          </div>
          {cluesFor(board, c.id, round).map((clue) => {
            const used = usedIds.has(clue.id);
            return (
              <button
                key={clue.id}
                disabled={used}
                onClick={() => onPick(clue)}
                data-testid={`clue-${clue.value}-${c.title}`}
                className="j-tile rounded-lg aspect-[16/10] flex items-center justify-center"
              >
                {used ? (
                  <span className="text-white/20 font-value text-2xl">·</span>
                ) : (
                  <span className="font-value font-bold text-2xl md:text-4xl j-gold-text">
                    ${clue.value.toLocaleString()}
                  </span>
                )}
              </button>
            );
          })}
        </div>
      ))}
    </div>
  );
}
