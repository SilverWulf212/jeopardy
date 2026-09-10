-- Jeopardy schema: question bank + boards. Idempotent.
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL UNIQUE,
  description TEXT DEFAULT '',
  tags TEXT[] NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS clues (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  round TEXT NOT NULL DEFAULT 'jeopardy' CHECK (round IN ('jeopardy','double','final')),
  value INT NOT NULL DEFAULT 200 CHECK (value >= 0),
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  daily_double BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS boards (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL DEFAULT '',
  tags TEXT[] NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS board_categories (
  board_id UUID NOT NULL REFERENCES boards(id) ON DELETE CASCADE,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  round TEXT NOT NULL DEFAULT 'jeopardy' CHECK (round IN ('jeopardy','double','final')),
  position INT NOT NULL DEFAULT 0,
  PRIMARY KEY (board_id, category_id, round)
);

CREATE INDEX IF NOT EXISTS idx_clues_cat ON clues(category_id);
CREATE INDEX IF NOT EXISTS idx_clues_round ON clues(round);
CREATE INDEX IF NOT EXISTS idx_categories_tags ON categories USING GIN (tags);
CREATE INDEX IF NOT EXISTS idx_boards_tags ON boards USING GIN (tags);
