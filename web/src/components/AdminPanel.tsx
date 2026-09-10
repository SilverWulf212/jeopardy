import { useEffect, useState } from "react";
import { api } from "../lib/api";
import type { Category, Clue, Round } from "../lib/types";

export function AdminPanel({ onChanged }: { onChanged: () => void }) {
  const [cats, setCats] = useState<Category[]>([]);
  const [sel, setSel] = useState<string | null>(null);
  const [clues, setClues] = useState<Clue[]>([]);
  const [loading, setLoading] = useState(true);
  const [form, setForm] = useState({ title: "", description: "" });
  const [clueForm, setClueForm] = useState({ round: "jeopardy" as Round, value: 400, question: "", answer: "", daily_double: false });
  const [editingClue, setEditingClue] = useState<string | null>(null);
  const [msg, setMsg] = useState("");

  const refresh = async () => {
    setLoading(true);
    try {
      const c = await api.categories();
      setCats(c);
      if (!sel && c.length) setSel(c[0].id);
    } catch (e: any) {
      setMsg(`API offline: ${e.message} — run the API + Postgres first.`);
    } finally { setLoading(false); }
  };

  useEffect(() => { void refresh(); // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!sel) return;
    api.clues(sel).then(setClues).catch(() => {});
  }, [sel]);

  const saveCat = async () => {
    if (!form.title.trim()) return;
    await api.createCategory(form.title.trim(), form.description);
    setForm({ title: "", description: "" });
    await refresh(); onChanged();
  };

  const saveClue = async () => {
    if (!sel || !clueForm.question.trim() || !clueForm.answer.trim()) return;
    const payload = { category_id: sel, ...clueForm, question: clueForm.question.trim(), answer: clueForm.answer.trim() };
    if (editingClue) await api.updateClue(editingClue, payload);
    else await api.createClue(payload);
    setClueForm({ round: "jeopardy", value: 400, question: "", answer: "", daily_double: false });
    setEditingClue(null);
    setClues(await api.clues(sel)); onChanged();
  };

  if (loading) return <div className="p-8 text-white/60">Loading question bank…</div>;

  return (
    <div className="grid md:grid-cols-[280px_1fr] gap-4">
      <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
        <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">CATEGORIES ({cats.length})</h3>
        <div className="flex flex-col gap-1.5 mt-3 max-h-[50vh] overflow-auto">
          {cats.map((c) => (
            <div key={c.id} className={`flex items-center gap-1 rounded-lg px-2 py-1.5 border ${sel === c.id ? "bg-[#060ce9] border-[#ffcc57]" : "bg-black/30 border-white/10"}`}>
              <button onClick={() => setSel(c.id)} className="flex-1 text-left text-sm font-semibold truncate">{c.title}</button>
              <button
                onClick={async () => { await api.deleteCategory(c.id); if (sel === c.id) setSel(null); await refresh(); onChanged(); }}
                className="text-white/40 hover:text-red-400 text-xs px-1">✕</button>
            </div>
          ))}
        </div>
        <div className="mt-3 flex flex-col gap-2">
          <input value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })}
            placeholder="New category title" className="bg-white/10 rounded-lg px-2 py-1.5 text-sm" />
          <button onClick={saveCat} className="py-1.5 rounded-lg bg-[#ffcc57] text-black font-bold text-sm">+ Add category</button>
        </div>
        {msg && <div className="text-amber-300 text-xs mt-2">{msg}</div>}
      </div>

      <div className="rounded-2xl bg-white/5 border border-white/10 p-4">
        <h3 className="font-value tracking-widest text-[#ffcc57] text-sm">
          CLUES {sel ? `— ${cats.find((c) => c.id === sel)?.title}` : ""} ({clues.length})
        </h3>
        <div className="flex flex-col gap-2 mt-3">
          {clues.map((cl) => (
            <div key={cl.id} className="bg-black/30 border border-white/10 rounded-xl p-3">
              <div className="flex items-center gap-2 text-xs">
                <span className="px-2 py-0.5 rounded bg-white/10 font-mono">{cl.round}</span>
                <span className="font-value text-[#ffcc57]">${cl.value}</span>
                {cl.daily_double && <span className="px-1.5 py-0.5 rounded bg-[#ffcc57] text-black font-bold">DD</span>}
                <span className="ml-auto flex gap-1">
                  <button onClick={() => { setEditingClue(cl.id); setClueForm({ round: cl.round, value: cl.value, question: cl.question, answer: cl.answer, daily_double: cl.daily_double }); }} className="text-white/50 hover:text-white text-xs px-1">Edit</button>
                  <button onClick={async () => { await api.deleteClue(cl.id); setClues(await api.clues(sel!)); onChanged(); }} className="text-white/50 hover:text-red-400 text-xs px-1">Delete</button>
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
              <option value="jeopardy">jeopardy</option>
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
  );
}
