// Tiny WebAudio bleeps — no assets needed, self-hosted.
let ctx: AudioContext | null = null;
function ac(): AudioContext {
  if (!ctx) ctx = new (window.AudioContext || (window as any).webkitAudioContext)();
  if (ctx.state === "suspended") void ctx.resume();
  return ctx;
}
function tone(freq: number, dur = 0.12, type: OscillatorType = "square", gain = 0.04, when = 0) {
  try {
    const a = ac();
    const o = a.createOscillator();
    const g = a.createGain();
    o.type = type; o.frequency.value = freq;
    g.gain.setValueAtTime(gain, a.currentTime + when);
    g.gain.exponentialRampToValueAtTime(0.0001, a.currentTime + when + dur);
    o.connect(g).connect(a.destination);
    o.start(a.currentTime + when); o.stop(a.currentTime + when + dur + 0.02);
  } catch { /* audio unavailable */ }
}
export const sfx = {
  select: () => tone(660, 0.09, "square"),
  buzz: () => { tone(220, 0.18, "sawtooth", 0.06); tone(330, 0.14, "square", 0.04, 0.02); },
  correct: () => { tone(523, 0.12); tone(659, 0.12, "square", 0.04, 0.1); tone(784, 0.2, "square", 0.04, 0.2); },
  wrong: () => tone(160, 0.3, "sawtooth", 0.06),
  dailyDouble: () => { tone(392, 0.12); tone(392, 0.12, "square", 0.05, 0.15); tone(523, 0.25, "square", 0.05, 0.3); },
  final: () => { tone(330, 0.2); tone(440, 0.2, "triangle", 0.05, 0.2); tone(554, 0.4, "triangle", 0.05, 0.4); },
};
