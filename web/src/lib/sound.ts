// Broadcast-style WebAudio cues — no assets needed, self-hosted.
let ctx: AudioContext | null = null;
let muted = false;
try { muted = localStorage.getItem("j-muted") === "1"; } catch {}
export const isMuted = () => muted;
export function setMuted(m: boolean) {
  muted = m;
  try { localStorage.setItem("j-muted", m ? "1" : "0"); } catch {}
}
function ac(): AudioContext {
  if (!ctx) ctx = new (window.AudioContext || (window as any).webkitAudioContext)();
  if (ctx.state === "suspended") void ctx.resume();
  return ctx;
}
interface Note { f: number; t?: number; d?: number; type?: OscillatorType; g?: number; slide?: number }
function seq(notes: Note[]) {
  if (muted) return;
  try {
    const a = ac();
    for (const n of notes) {
      const t0 = a.currentTime + (n.t ?? 0);
      const dur = n.d ?? 0.15;
      const o = a.createOscillator();
      const g = a.createGain();
      o.type = n.type ?? "triangle";
      o.frequency.setValueAtTime(n.f, t0);
      if (n.slide) o.frequency.exponentialRampToValueAtTime(Math.max(30, n.slide), t0 + dur);
      g.gain.setValueAtTime(n.g ?? 0.05, t0);
      g.gain.exponentialRampToValueAtTime(0.0001, t0 + dur);
      o.connect(g).connect(a.destination);
      o.start(t0); o.stop(t0 + dur + 0.03);
    }
  } catch { /* audio unavailable */ }
}
const C5 = 523.25, D5 = 587.33, E5 = 659.25, G5 = 783.99, A5 = 880, C6 = 1046.5, E6 = 1318.5, G4 = 392;
export const sfx = {
  // tile pick: crisp pop
  select: () => seq([{ f: A5, d: 0.07, type: "square", g: 0.03 }]),
  // buzzer: punchy two-tone press
  buzz: () => seq([
    { f: 196, d: 0.1, type: "square", g: 0.06 },
    { f: 262, t: 0.07, d: 0.14, type: "square", g: 0.05 },
  ]),
  // correct: bright ascending chime C-E-G-C
  correct: () => seq([
    { f: C5, d: 0.14 }, { f: E5, t: 0.09, d: 0.14 }, { f: G5, t: 0.18, d: 0.14 },
    { f: C6, t: 0.27, d: 0.3, g: 0.06 }, { f: E6, t: 0.27, d: 0.3, g: 0.03 },
  ]),
  // wrong: descending slide + low thud
  wrong: () => seq([
    { f: 220, d: 0.32, type: "sawtooth", g: 0.06, slide: 110 },
    { f: 82, t: 0.05, d: 0.3, type: "sine", g: 0.07 },
  ]),
  // daily double: rising fanfare + shimmer
  dailyDouble: () => seq([
    { f: G4, d: 0.12, type: "square", g: 0.04 }, { f: C5, t: 0.11, d: 0.12, type: "square", g: 0.04 },
    { f: E5, t: 0.22, d: 0.12, type: "square", g: 0.04 }, { f: G5, t: 0.33, d: 0.28, g: 0.06 },
    { f: C6, t: 0.33, d: 0.28, g: 0.03 },
  ]),
  // final: stately low pulses + shimmer
  final: () => seq([
    { f: 110, d: 0.22, type: "sine", g: 0.08 }, { f: 110, t: 0.28, d: 0.22, type: "sine", g: 0.08 },
    { f: 165, t: 0.56, d: 0.5, type: "triangle", g: 0.05 }, { f: 330, t: 0.56, d: 0.5, g: 0.025 },
  ]),
  // winner: full fanfare arpeggio with sustain
  win: () => seq([
    { f: C5, d: 0.13 }, { f: E5, t: 0.1, d: 0.13 }, { f: G5, t: 0.2, d: 0.13 },
    { f: C6, t: 0.3, d: 0.5, g: 0.06 }, { f: E6, t: 0.3, d: 0.5, g: 0.04 },
    { f: G5, t: 0.45, d: 0.6, g: 0.04 }, { f: C6, t: 0.6, d: 0.8, g: 0.05 },
  ]),
};
