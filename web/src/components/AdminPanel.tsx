import { useEffect, useMemo, useState } from "react";
import { api, adminToken } from "../lib/api";
import type { BoardSummary, Category, Clue, Round } from "../lib/types";

type Slot = "single" | "double" | "final";

export function AdminPanel({ onChanged }: { onChanged: () => void }) {
  const [cats, setCats] = useState<Category[]>([]);
  const [allClues, setAllClues] = useState<Clue[]>([]);
  const [boards, setBoards] = useState<BoardSummary[]>([]);
  const [tags, setTags] = useState<string[]>([]);
  const [activeTag, setActiveTag] = useState<string | null>(null);
  const [search, setSearch] = useState("");
  const [token, setToken] = useState(() => adminToken.get());
  const [sel, setSel] = useState<string | null>(null);
  const [clues, setClues] = useState<Clue[]>([]);
  const [loading, setLoading] = useState(true);
  const [msg, setMsg] = useState("");

  // category + clue forms
  const [form, setForm] = useState({ title: "", description: "", tags: "" });
  const [catTags, setCatTags] = useState("");
  const [clueForm, setClueForm] = useState({ round: "jeopardy" as Round, value: 400, question: "", answer: "", daily_double: false });
  const [editingClue, setEditingClue] = useState<string | null>(null);

  // board builder
  const [bName, setBName] = useState("");
  const [bDesc, setBDesc] = useState("");
  const [bTags, setBTags] = useState("");
  const [single, setSingle] = useState<string[]>([]);
  const [double, setDouble] = useState<string[]>([]);
  const [final, setFinal] = useState<string | null>(null);
  const [dragId, setDragId] = useState<string | null>(null);

  const refresh = async () => {
    setLoading(true);
    try {
      const [c, t, b] = await Promise.all([api.categories(), api.tags(), api.boards()]);
      setCats(c); setTags(t); setBoards(b);
      setAllClues(await api.clues().catch(() => []));
      if (!sel && c.length) { setSel(c[0].id); setCatTags((c[0].tags ?? []).join(", ")); }
    } catch (e: any) {
      setMsg(`API offline: ${e.message} — run the API + Postgres first.`);
    } finally { setLoading(false); }
  };

  useEffect(() => { void refresh(); // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!sel) return;
    const c = cats.find((x) => x.id === sel);
    if (c) setCatTags((c.tags ?? []).join(", "));
    api.clues(sel).then(setClues).catch(() => {});
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sel]);

  const counts = useMemo(() => {
    const m: Record<string, { jeopardy: number; double: number; final: number }> = {};
    for (const cl of allClues) {
      m[cl.category_id] ??= { jeopardy: 0, double: 0, final: 0 };
      m[cl.category_id][cl.round]++;
    }
    return m;
  }, [allClues]);

  const filtered = cats.filter((c) => {
    if (activeTag && !(c.tags ?? []).includes(activeTag)) return false;
    if (search && !c.title.toLowerCase().includes(search.toLowerCase())) return false;
    return true;
  });

  const parseTags = (s: string) => [...new Set(s.split(",").map((t) => t.trim().toLowerCase()).filter(Boolean))];

  const saveCat = async () => {
    if (!form.title.trim()) return;
    await api.createCategory(form.title.trim(), form.description, parseTags(form.tags));
    setForm({ title: "", description: "", tags: "" });
    await refresh(); onChanged();
  };

  const saveCatTags = async () => {
    if (!sel) return;
    const c = cats.find((x) => x.id === sel);
    if (!c) return;
    await api.updateCategory(sel, c.title, c.description, parseTags(catTags));
    await refresh(); onChanged();
  };

  const saveClue = async () => {
    if (!sel || !clueForm.question.trim() || !clueForm.answer.trim()) return;
    const payload = { category_id: sel, ...clueForm, question: clueForm.question.trim(), answer: clueForm.answer.trim() };
    if (editingClue) await api.updateClue(editingClue, payload);
    else await api.createClue(payload);
    setClueForm({ round: "jeopardy", value: 400, question: "", answer: "", daily_double: false });
    setEditingClue(null);
    setClues(await api.clues(sel));
    setAllClues(await api.clues().catch(() => []));
    onChanged();
  };

  // ---- board builder ----
  const addTo = (slot: Slot, id: string) => {
    if (slot === "single") setSingle((s) => (s.includes(id) || s.length >= 6 ? s : [...s, id]));
    else if (slot === "double") setDouble((s) => (s.includes(id) || s.length >= 6 ? s : [...s, id]));
    else setFinal(id);
  };
  const removeFrom = (slot: Slot, id: string) => {
    if (slot === "single") setSingle((s) => s.filter((x) => x !== id));
    else if (slot === "double") setDouble((s) => s.filter((x) => x !== id));
    else setFinal((f) => (f === id ? null : f));
  };
  const ready = single.length + double.length + (final ? 1 : 0);
  const complete = single.length === 6 && double.length === 6 && final !== null;

  const saveBoard = async () => {
    if (!complete || !bName.trim()) return;
    await api.createBoard({
      name: bName.trim(), description: bDesc.trim(), tags: parseTags(bTags),
      jeopardy: single, double, final: final!,
    });
    setBName(""); setBDesc(""); setBTags("");
    setSingle([]); setDouble([]); setFinal(null);
    setBoards(await api.boards()); setTags(await api.tags().catch(() => []));
    onChanged();
  };

  const loadBoardIntoBuilder = async (id: string) => {
    const full = await api.board(id);
    const byRound = (r: string) => full.categories.filter((c) => (c.round ?? "jeopardy") === r).map((c) => c.id);
    setSingle(byRound("jeopardy").slice(0, 6));
    setDouble(byRound("double").slice(0, 6));
    setFinal(byRound("final")[0] ?? null);
    setBName(full.name + " (copy)");
  };

  if (loading) return <div className="p-8 text-white/60">Loading question bank…</div>;

  const pool = filtered.filter((c) => !single.includes(c.id) || !double.includes(c.id) || c.id !== final);
  const titleOf = (id: string) => cats.find((c) => c.id === id)?.title ?? "?";

  return (
    <div className="flex flex-col gap-4">
      {/* tag levers */}
      <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="font-value tracking-widest text-[#ffcc57] text-sm">GAME SETS</span>
          <button onClick={() => setActiveTag(null)}
            className={`px-3 py-1 rounded-full text-xs font-bold border ${activeTag === null ? "bg-[#ffcc57] text-black border-[#ffcc57]" : "bg-white/10 border-white/20"}`}>
            All ({cats.length})
          </button>
          {tags.map((t) => (
            <button key={t} onClick={() => setActiveTag(activeTag === t ? null : t)}
              className={`px-3 py-1 rounded-full text-xs font-bold border ${activeTag === t ? "bg-[#ffcc57] text-black border-[#ffcc57]" : "bg-white/10 border-white/20"}`}>
              #{t}
            </button>
          ))}
          <input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Search categories…"
            className="bg-white/10 rounded-lg px-2 py-1 text-sm w-44" />
          <input value={token} onChange={(e) => { setToken(e.target.value); adminToken.set(e.target.value); }}
            type="password" placeholder="Admin token (to edit)"
            className="ml-auto bg-white/10 rounded-lg px-2 py-1 text-sm w-44" />
        </div>
        {msg && <div className="text-amber-300 text-xs mt-2">{msg}</div>}
      </div>

      {/* board builder: two columns + final */}
      <div className="rounded-2xl bg-white/5 border border-[#ffcc5755] p-4">
        <div className="flex items-center gap-3 flex-wrap">
          <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">BOARD BUILDER</h3>
          <span className="text-xs text-white/50">{ready}/13 slots {complete ? "· complete set ✓" : "· need 6 single + 6 double + 1 final"}</span>
          <div className="w-full h-2 rounded bg-white/10 overflow-hidden">
            <div className="h-full bg-[#ffcc57] transition-all" style={{ width: `${Math.round((ready / 13) * 100)}%` }} />
          </div>
        </div>
        <div className="grid md:grid-cols-3 gap-3 mt-3">
          <SlotCol title={`SINGLE JEOPARDY (${single.length}/6)`} ids={single} slot="single"
            onDrop={(id) => addTo("single", id)} onRemove={(id) => removeFrom("single", id)}
            dragId={dragId} setDragId={setDragId} titleOf={titleOf} accent="#3ddad7" />
          <SlotCol title={`DOUBLE JEOPARDY (${double.length}/6)`} ids={double} slot="double"
            onDrop={(id) => addTo("double", id)} onRemove={(id) => removeFrom("double", id)}
            dragId={dragId} setDragId={setDragId} titleOf={titleOf} accent="#ff5470" />
          <div>
            <SlotCol title="FINAL (0/1)" ids={final ? [final] : []} slot="final"
              onDrop={(id) => addTo("final", id)} onRemove={(id) => removeFrom("final", id)}
              dragId={dragId} setDragId={setDragId} titleOf={titleOf} accent="#ffcc57" />
            <div className="grid grid-cols-2 gap-2 mt-3">
              <input value={bName} onChange={(e) => setBName(e.target.value)} placeholder="Set name, e.g. Marvel Universe"
                className="bg-white/10 rounded-lg px-2 py-1.5 text-sm col-span-2" />
              <input value={bDesc} onChange={(e) => setBDesc(e.target.value)} placeholder="Description"
                className="bg-white/10 rounded-lg px-2 py-1.5 text-sm col-span-2" />
              <input value={bTags} onChange={(e) => setBTags(e.target.value)} placeholder="Tags, comma separated: marvel, science"
                className="bg-white/10 rounded-lg px-2 py-1.5 text-sm col-span-2" />
              <button onClick={saveBoard} disabled={!complete || !bName.trim()}
                className="col-span-2 py-2 rounded-lg bg-[#ffcc57] text-black font-bold text-sm disabled:opacity-40">
                Save complete game set
              </button>
            </div>
          </div>
        </div>

        <div className="mt-3">
          <div className="text-xs text-white/50 mb-1.5">
            Drag a category into a column, or use S / D / F. {activeTag ? `Filtered by #${activeTag}.` : "Showing all categories."}
          </div>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-1.5 max-h-56 overflow-auto">
            {pool.map((c) => {
              const n = counts[c.id] ?? { jeopardy: 0, double: 0, final: 0 };
              return (
                <div key={c.id} draggable onDragStart={(e) => { e.dataTransfer.setData("text/plain", c.id); setDragId(c.id); }}
                  onDragEnd={() => setDragId(null)}
                  className="flex items-center gap-1.5 bg-black/30 border border-white/10 rounded-lg px-2 py-1.5 cursor-grab text-sm">
                  <span className="flex-1 truncate font-semibold">{c.title}</span>
                  <span className="text-[11px] text-white/40 font-mono">S{n.jeopardy} D{n.double} F{n.final}</span>
                  {(c.tags ?? []).slice(0, 2).map((t) => (
                    <span key={t} className="text-[10px] px-1 rounded bg-white/10 text-white/60">#{t}</span>
                  ))}
                  <button title="Add to Single" onClick={() => addTo("single", c.id)} className="tap44 px-1.5 py-0.5 rounded bg-white/10 text-xs font-bold hover:bg-[#3ddad7] hover:text-black">S</button>
                  <button title="Add to Double" onClick={() => addTo("double", c.id)} className="tap44 px-1.5 py-0.5 rounded bg-white/10 text-xs font-bold hover:bg-[#ff5470] hover:text-black">D</button>
                  <button title="Set as Final" onClick={() => addTo("final", c.id)} className="tap44 px-1.5 py-0.5 rounded bg-white/10 text-xs font-bold hover:bg-[#ffcc57] hover:text-black">F</button>
                </div>
              );
            })}
            {!pool.length && <div className="text-white/40 text-sm">No categories left in the pool.</div>}
          </div>
        </div>

        <div className="mt-3 flex flex-wrap gap-2">
          {boards.map((b) => (
            <div key={b.id} className="flex items-center gap-2 bg-black/30 border border-white/10 rounded-lg px-2.5 py-1.5 text-sm">
              <span className="font-semibold">{b.name}</span>
              <span className="text-[11px] text-white/40">{b.categories} cats · {b.clues} clues</span>
              {(b.tags ?? []).map((t) => <span key={t} className="text-[10px] px-1 rounded bg-white/10 text-white/60">#{t}</span>)}
              <button onClick={() => void loadBoardIntoBuilder(b.id)} className="text-white/50 hover:text-white text-xs">Duplicate</button>
              <button onClick={async () => { await api.deleteBoard(b.id); setBoards(await api.boards()); onChanged(); }}
                className="text-white/40 hover:text-red-400 text-xs px-1">✕</button>
            </div>
          ))}
        </div>
      </div>

      {/* categories + clues */}
      <div className="grid md:grid-cols-[280px_1fr] gap-4">
        <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
          <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">CATEGORIES ({filtered.length})</h3>
          <div className="flex flex-col gap-1.5 mt-3 max-h-[50vh] overflow-auto">
            {filtered.map((c) => (
              <div key={c.id} className={`rounded-lg px-2 py-1.5 border ${sel === c.id ? "bg-[#060ce9] border-[#ffcc57]" : "bg-black/30 border-white/10"}`}>
                <div className="flex items-center gap-1">
                  <button onClick={() => setSel(c.id)} className="flex-1 text-left text-sm font-semibold truncate">{c.title}</button>
                  <button onClick={async () => { await api.deleteCategory(c.id); if (sel === c.id) setSel(null); await refresh(); onChanged(); }}
                    className="text-white/40 hover:text-red-400 text-xs px-1">✕</button>
                </div>
                {!!(c.tags ?? []).length && (
                  <div className="flex gap-1 mt-1 flex-wrap">
                    {(c.tags ?? []).map((t) => <span key={t} className="text-[10px] px-1 rounded bg-white/10 text-white/60">#{t}</span>)}
                  </div>
                )}
              </div>
            ))}
          </div>
          <div className="mt-3 flex flex-col gap-2">
            <input value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })}
              placeholder="New category title" className="bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
            <input value={form.tags} onChange={(e) => setForm({ ...form, tags: e.target.value })}
              placeholder="Tags: marvel, science" className="bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
            <button onClick={saveCat} className="py-1.5 rounded-lg bg-[#ffcc57] text-black font-bold text-sm">+ Add category</button>
          </div>
        </div>

        <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
          <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">
            CLUES {sel ? `— ${cats.find((c) => c.id === sel)?.title}` : ""} ({clues.length})
          </h3>
          {sel && (
            <div className="flex gap-2 mt-2">
              <input value={catTags} onChange={(e) => setCatTags(e.target.value)}
                placeholder="Category tags, comma separated" className="flex-1 bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
              <button onClick={saveCatTags} className="px-3 py-1.5 rounded-lg bg-white/10 border border-white/20 text-sm">Save tags</button>
            </div>
          )}
          <div className="flex flex-col gap-2 mt-3">
            {clues.map((cl) => (
              <div key={cl.id} className="bg-black/30 border border-white/10 rounded-xl p-3">
                <div className="flex items-center gap-2 text-xs">
                  <span className="px-2 py-0.5 rounded bg-white/10 font-mono">{cl.round}</span>
                  <span className="font-value text-[#ffcc57]">${cl.value}</span>
                  {cl.daily_double && <span className="px-1.5 py-0.5 rounded bg-[#ffcc57] text-black font-bold">DD</span>}
                  <span className="ml-auto flex gap-1">
                    <button onClick={() => { setEditingClue(cl.id); setClueForm({ round: cl.round, value: cl.value, question: cl.question, answer: cl.answer, daily_double: cl.daily_double }); }} className="text-white/50 hover:text-white text-xs px-1">Edit</button>
                    <button onClick={async () => { await api.deleteClue(cl.id); setClues(await api.clues(sel!)); setAllClues(await api.clues().catch(() => [])); onChanged(); }} className="text-white/50 hover:text-red-400 text-xs px-1">Delete</button>
                  </span>
                </div>
                <div className="text-sm mt-1"><span className="text-white/50">Q:</span> {cl.question}</div>
                <div className="text-sm text-[#ffcc57]"><span className="text-white/50">A:</span> {cl.answer}</div>
              </div>
            ))}
            {!clues.length && <div className="text-white/40 text-sm">No clues yet for this category.</div>}
          </div>

          <div className="mt-4 rounded-xl border border-[#ffcc5755] p-3 bg-black/20">
            <div className="text-sm font-bold mb-2">{editingClue ? "Edit clue" : "New clue"}</div>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
              <select value={clueForm.round} onChange={(e) => setClueForm({ ...clueForm, round: e.target.value as Round })}
                className="bg-white/10 rounded-lg px-2 py-1.5 text-sm text-white">
                <option value="jeopardy">single</option>
                <option value="double">double</option>
                <option value="final">final</option>
              </select>
              <input type="number" value={clueForm.value} min={0} step={100}
                onChange={(e) => setClueForm({ ...clueForm, value: Number(e.target.value) })}
                className="bg-white/10 rounded-lg px-2 py-1.5 text-sm" placeholder="Value" />
              <label className="flex items-center gap-1 text-xs text-white/70">
                <input type="checkbox" checked={clueForm.daily_double}
                  onChange={(e) => setClueForm({ ...clueForm, daily_double: e.target.checked })} /> Daily Double
              </label>
              {editingClue && <button onClick={() => { setEditingClue(null); setClueForm({ round: "jeopardy", value: 400, question: "", answer: "", daily_double: false }); }} className="text-xs text-white/50 underline">Cancel edit</button>}
            </div>
            <textarea value={clueForm.question} onChange={(e) => setClueForm({ ...clueForm, question: e.target.value })}
              placeholder="Question (the clue text shown on board)" rows={2} className="mt-2 w-full bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
            <input value={clueForm.answer} onChange={(e) => setClueForm({ ...clueForm, answer: e.target.value })}
              placeholder="Answer (What is…?)" className="mt-2 w-full bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
            <button onClick={saveClue} className="mt-2 px-4 py-1.5 rounded-lg bg-[#ffcc57] text-black font-bold text-sm">
              {editingClue ? "Save changes" : "+ Add clue"}
            </button>
          </div>
        </div>
      </div>

      {/* guide / FAQ */}
      <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
        <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">HOST GUIDE</h3>
        <details className="mt-2 text-sm">
          <summary className="cursor-pointer font-semibold">Building a fair, complete set</summary>
          <ul className="list-disc ml-5 mt-1 text-white/70 space-y-1">
            <li>A complete set is 6 Single + 6 Double categories with 5 clues each, plus 1 Final. The builder will not save until all 13 slots are filled.</li>
            <li>Keep the value ladder honest: 200s are gimmes, 1000s/2000s are stumpers. If half the room cannot get a 200, rewrite it.</li>
            <li>Every clue must point at exactly one answer. Read it aloud: if two answers fit, narrow the wording.</li>
            <li>Spread answers across the set. No character, film, or term should be the answer twice in one game.</li>
            <li>One Daily Double per Single round, two per Double round, hidden in mid-to-high values.</li>
          </ul>
        </details>
        <details className="mt-2 text-sm">
          <summary className="cursor-pointer font-semibold">Fact-checking validators (school-safe sets)</summary>
          <ul className="list-disc ml-5 mt-1 text-white/70 space-y-1">
            <li>Confirm every clue against at least two independent sources (primary text plus one reference).</li>
            <li>Rank sources: primary work first, then established references, then fan wikis last and never alone.</li>
            <li>Datestamp time-sensitive facts (rosters, records, office-holders). If it can change, it needs a year in the clue.</li>
            <li>When in doubt, cut the clue. A shorter honest board beats a full shaky one.</li>
          </ul>
        </details>
        <details className="mt-2 text-sm">
          <summary className="cursor-pointer font-semibold">Personal, party, and study sets</summary>
          <ul className="list-disc ml-5 mt-1 text-white/70 space-y-1">
            <li>Inside jokes work if the ANSWER is gettable and the joke is the garnish, never the other way around.</li>
            <li>Keep it balanced: nobody should face a whole category about someone else's memories. Mix personal with general.</li>
            <li>For studying, tag sets by subject (e.g. biology, spanish) and keep one concept per clue so misses teach exactly one thing.</li>
            <li>Use tags to organize sets (marvel, science, party) and filter the pool before building.</li>
          </ul>
        </details>
      </div>
    </div>
  );
}

function SlotCol({ title, ids, slot, onDrop, onRemove, dragId, setDragId, titleOf, accent }: {
  title: string; ids: string[]; slot: Slot;
  onDrop: (id: string) => void; onRemove: (id: string) => void;
  dragId: string | null; setDragId: (id: string | null) => void;
  titleOf: (id: string) => string; accent: string;
}) {
  const max = slot === "final" ? 1 : 6;
  const over = dragId !== null && (slot === "final" ? ids.length < 1 : ids.length < 6);
  return (
    <div
      onDragOver={(e) => { if (over) e.preventDefault(); }}
      onDrop={(e) => { e.preventDefault(); const id = e.dataTransfer.getData("text/plain"); if (id) onDrop(id); setDragId(null); }}
      className="rounded-xl border-2 border-dashed p-2 min-h-[180px] bg-black/20 transition-colors"
      style={{ borderColor: dragId ? accent : "#ffffff22" }}
    >
      <div className="text-xs font-bold tracking-widest mb-1.5" style={{ color: accent }}>{title}</div>
      <div className="flex flex-col gap-1">
        {ids.map((id) => (
          <div key={id} className="flex items-center gap-1 bg-[#060ce9] border border-white/20 rounded-lg px-2 py-1 text-sm">
            <span className="flex-1 truncate font-semibold">{titleOf(id)}</span>
            <button onClick={() => onRemove(id)} aria-label={`Remove ${titleOf(id)}`} className="tap44 text-white/50 hover:text-red-400 text-xs px-1">✕</button>
          </div>
        ))}
        {Array.from({ length: Math.max(0, max - ids.length) }).map((_, i) => (
          <div key={i} className="rounded-lg px-2 py-1 text-xs text-white/25 border border-white/5 text-center">
            drop here
          </div>
        ))}
      </div>
    </div>
  );
}
