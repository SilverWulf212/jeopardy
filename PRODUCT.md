# Product

## Register

product

## Users

Groups of friends or family hosting a Jeopardy night in a living room. One shared screen, one host running the game, 2 to 4 players with keyboard buzzers. Everyone reads the board from couch distance. A second user, the quizmaster, builds and edits the question bank ahead of time in the Manage view.

## Product Purpose

A singular self-hosted Jeopardy night: a PostgreSQL-backed question bank with an editing UI, plus a broadcast-style game surface that plays a full show (Jeopardy, Double Jeopardy with Daily Doubles, Final Jeopardy) on one screen with assignable first-press-wins buzzers. Success is a full game night that runs flawlessly with zero confusion about game state.

## Brand Personality

Showtime: dramatic, polished, electric. The interface should feel like a big-stage TV production, building tension toward each reveal, while staying warm and inviting for a family game night. Confidence of a seasoned host, never sterile, never cheesy.

## Anti-references

Explicitly not a generic SaaS dashboard (no sidebar nav, no stat cards, no purple gradient on white). Not a cheap quiz app (no clutter, no clipart, no garish neon arcade skins). No AI slop patterns: no glassmorphism defaults, no gradient text, no identical icon-card grids.

## Design Principles

1. The stage is the product. The board must read from a couch: huge values, high contrast, unmistakable state (used vs live tiles).
2. Drama through pacing. Reveals, wagers, and Daily Doubles are staged moments, not dialogs to dismiss.
3. The host is the power user. Every host action (arm buzzers, mark correct, advance rounds) resolves in one confident click or keypress.
4. One screen, zero confusion. At any moment every player can tell whose turn it is, who buzzed, and what the scores are.
5. Self-hosted confidence. Everything runs locally; the show never waits on a network or a third party.

## Accessibility & Inclusion

Standard: legible from couch distance (large type, strong contrast for values and scores), fully keyboard operable (buzzers and host controls), honor prefers-reduced-motion for board and reveal animations, never convey game state by color alone.
