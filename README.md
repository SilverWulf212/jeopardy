# JEOPARDY! — Self-Hosted Clone

Single-repo, self-hosted Jeopardy clone. React board + Express API + PostgreSQL question bank. One command to run.

## Quick start (singular self-hosted)

```bash
cp .env.example .env
docker compose up --build
# → App: http://localhost:3001
# → API: http://localhost:3001/api/health
# → DB:  localhost:5432 (jeopardy / jeopardy)
```

Dev (no docker, uses local postgres in docker only for db):

```bash
docker compose up db -d
bun install
bun run dev   # api :3001 + web :5173 with proxy
```

## What's inside

- `web/` — React 19 + Vite + Tailwind. Broadcast-prestige Jeopardy board, clue modal, assignable keyboard buzzers, host controls, admin question-bank UI.
- `api/` — Bun/Node + Express + `pg`. CRUD for categories / clues / boards. Serves `web/dist` in production.
- `db/` — `init.sql` schema + `seed.sql` (Jeopardy + Double + Final, Daily Doubles included).
- `e2e/` — Playwright smoke (board loads → open clue → buzz → score).

## Game flow

1. **Setup**: 2–4 players, name + color + buzzer key (click “Set” → press any key, conflict-checked). Pick board.
2. **Board**: click a value → clue modal → READ → BUZZ (first key wins, lockout) → answer → Correct/Incorrect → score.
3. **Daily Double**: wager screen, no buzzer, that player only.
4. **Double Jeopardy**: 2× values, then **Final Jeopardy**: wagers → reveal → winner.

## Buzzer keys

Default: P1=`A`, P2=`F`, P3=`L`, P4=`Enter`. Reassignable anytime in Setup or score bar. Stored in localStorage. First-press-wins with 1200ms lockout for losers after a wrong answer.

## API

- `GET /api/health`
- `GET/POST /api/categories` · `PUT/DELETE /api/categories/:id`
- `GET/POST /api/clues` (`?category_id=`) · `PUT/DELETE /api/clues/:id`
- `GET/POST /api/boards` · `GET /api/boards/:id` (nested categories+clues) · `DELETE /api/boards/:id`

See `api/src/index.ts` for validation (zod).
