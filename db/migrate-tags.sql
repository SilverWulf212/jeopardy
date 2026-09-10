-- Game sets: tags/labels for categories + boards. Idempotent.
ALTER TABLE categories ADD COLUMN IF NOT EXISTS tags TEXT[] NOT NULL DEFAULT '{}';
ALTER TABLE boards ADD COLUMN IF NOT EXISTS tags TEXT[] NOT NULL DEFAULT '{}';
ALTER TABLE boards ADD COLUMN IF NOT EXISTS description TEXT NOT NULL DEFAULT '';
CREATE INDEX IF NOT EXISTS idx_categories_tags ON categories USING GIN (tags);
CREATE INDEX IF NOT EXISTS idx_boards_tags ON boards USING GIN (tags);

-- Tag the premiere seed set as classics
UPDATE categories SET tags = '{classics}'
WHERE title IN ('WORLD CAPITALS','SCIENCE 101','MOVIES','HISTORY','TECH','FOOD & DRINK',
  'LITERATURE','SPACE','SPORTS','MUSIC','GEOGRAPHY','WORDPLAY','FINAL: INVENTIONS')
  AND tags = '{}';
UPDATE boards SET tags = '{classics}', description = 'The original premiere-night board: general trivia across 12 categories plus Final.'
WHERE name = 'Premiere Night' AND tags = '{}';
