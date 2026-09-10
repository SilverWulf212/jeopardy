-- Seed: 1 full game board (Jeopardy + Double + Final). Idempotent via ON CONFLICT.
INSERT INTO categories (title, description) VALUES
  ('WORLD CAPITALS','Capital cities'),
  ('SCIENCE 101','Basic science'),
  ('MOVIES','Film trivia'),
  ('HISTORY','World history'),
  ('TECH','Computers & internet'),
  ('FOOD & DRINK','Culinary clues'),
  ('LITERATURE','Books & authors'),
  ('SPACE','Astronomy & spaceflight'),
  ('SPORTS','Athletics'),
  ('MUSIC','Songs & artists'),
  ('GEOGRAPHY','Rivers, mountains, flags'),
  ('WORDPLAY','Puns & language'),
  ('FINAL: INVENTIONS','Final Jeopardy category')
ON CONFLICT (title) DO NOTHING;

-- Helper: clear old seeded clues for these categories so re-seed is clean
DELETE FROM clues WHERE category_id IN (SELECT id FROM categories);

-- ===== JEOPARDY ROUND (200-1000) =====
-- WORLD CAPITALS
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WORLD CAPITALS'),'jeopardy',200,'This capital on the Seine is nicknamed the City of Light','What is Paris?',false),
((SELECT id FROM categories WHERE title='WORLD CAPITALS'),'jeopardy',400,'This capital of Japan was called Edo until 1868','What is Tokyo?',false),
((SELECT id FROM categories WHERE title='WORLD CAPITALS'),'jeopardy',600,'This Australian capital was purpose-built between Sydney and Melbourne','What is Canberra?',false),
((SELECT id FROM categories WHERE title='WORLD CAPITALS'),'jeopardy',800,'This capital on the Nile is the largest city in the Arab world','What is Cairo?',true),
((SELECT id FROM categories WHERE title='WORLD CAPITALS'),'jeopardy',1000,'This capital of Peru shares its name with a Che Guevara epithet about the city of kings','What is Lima?',false);

-- SCIENCE 101
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SCIENCE 101'),'jeopardy',200,'H2O is better known by this everyday name','What is water?',false),
((SELECT id FROM categories WHERE title='SCIENCE 101'),'jeopardy',400,'This planet is known as the Red Planet','What is Mars?',false),
((SELECT id FROM categories WHERE title='SCIENCE 101'),'jeopardy',600,'This force keeps your feet on the ground at 9.8 m/s²','What is gravity?',false),
((SELECT id FROM categories WHERE title='SCIENCE 101'),'jeopardy',800,'This part of the cell contains DNA and is called the control center','What is the nucleus?',false),
((SELECT id FROM categories WHERE title='SCIENCE 101'),'jeopardy',1000,'This scale measures acidity from 0 to 14','What is the pH scale?',false);

-- MOVIES
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MOVIES'),'jeopardy',200,'This 1997 shipwreck romance shouts “I''m the king of the world!”','What is Titanic?',false),
((SELECT id FROM categories WHERE title='MOVIES'),'jeopardy',400,'This caped hero protects Gotham City','Who is Batman?',false),
((SELECT id FROM categories WHERE title='MOVIES'),'jeopardy',600,'This Pixar film follows a clownfish searching for his son','What is Finding Nemo?',false),
((SELECT id FROM categories WHERE title='MOVIES'),'jeopardy',800,'This director made Jaws, E.T. and Jurassic Park','Who is Steven Spielberg?',false),
((SELECT id FROM categories WHERE title='MOVIES'),'jeopardy',1000,'This 2010 dream-heist film was directed by Christopher Nolan','What is Inception?',false);

-- HISTORY
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HISTORY'),'jeopardy',200,'This wall in Berlin fell in 1989','What is the Berlin Wall?',false),
((SELECT id FROM categories WHERE title='HISTORY'),'jeopardy',400,'This ship carried the Pilgrims to Plymouth in 1620','What is the Mayflower?',false),
((SELECT id FROM categories WHERE title='HISTORY'),'jeopardy',600,'This ancient Egyptian writing system used picture symbols','What are hieroglyphics?',false),
((SELECT id FROM categories WHERE title='HISTORY'),'jeopardy',800,'This empire built the Colosseum and spoke Latin','What is the Roman Empire?',false),
((SELECT id FROM categories WHERE title='HISTORY'),'jeopardy',1000,'This 1789 revolution began with the storming of the Bastille','What is the French Revolution?',false);

-- TECH
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TECH'),'jeopardy',200,'This “www” prefix stands for these three words','What is World Wide Web?',false),
((SELECT id FROM categories WHERE title='TECH'),'jeopardy',400,'This company makes the iPhone','What is Apple?',false),
((SELECT id FROM categories WHERE title='TECH'),'jeopardy',600,'This key combination is “copy” on most computers','What is Ctrl+C (Cmd+C)?',false),
((SELECT id FROM categories WHERE title='TECH'),'jeopardy',800,'This programming language shares its name with an island coffee','What is Java?',false),
((SELECT id FROM categories WHERE title='TECH'),'jeopardy',1000,'This man co-founded Microsoft with Paul Allen','Who is Bill Gates?',false);

-- FOOD & DRINK
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FOOD & DRINK'),'jeopardy',200,'This Italian dish is a flatbread with tomato, cheese and toppings','What is pizza?',false),
((SELECT id FROM categories WHERE title='FOOD & DRINK'),'jeopardy',400,'This Japanese dish pairs vinegared rice with raw fish','What is sushi?',false),
((SELECT id FROM categories WHERE title='FOOD & DRINK'),'jeopardy',600,'This hot drink is made from roasted beans and fuels mornings','What is coffee?',false),
((SELECT id FROM categories WHERE title='FOOD & DRINK'),'jeopardy',800,'This French cheese with white rind is named for a Normandy village','What is Camembert?',false),
((SELECT id FROM categories WHERE title='FOOD & DRINK'),'jeopardy',1000,'This spice, from Crocus flowers, is the world''s most expensive by weight','What is saffron?',false);

-- ===== DOUBLE JEOPARDY (400-2000) =====
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='LITERATURE'),'double',400,'He wrote Romeo and Juliet and Hamlet','Who is Shakespeare?',false),
((SELECT id FROM categories WHERE title='LITERATURE'),'double',800,'This boy wizard attends Hogwarts','Who is Harry Potter?',false),
((SELECT id FROM categories WHERE title='LITERATURE'),'double',1200,'She wrote Pride and Prejudice','Who is Jane Austen?',false),
((SELECT id FROM categories WHERE title='LITERATURE'),'double',1600,'This dystopia by George Orwell features Big Brother','What is 1984?',true),
((SELECT id FROM categories WHERE title='LITERATURE'),'double',2000,'This epic poem by Homer follows Odysseus home from Troy','What is The Odyssey?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SPACE'),'double',400,'This star is the center of our solar system','What is the Sun?',false),
((SELECT id FROM categories WHERE title='SPACE'),'double',800,'This was the first human in space, in 1961','Who is Yuri Gagarin?',false),
((SELECT id FROM categories WHERE title='SPACE'),'double',1200,'This planet has prominent rings made of ice and rock','What is Saturn?',false),
((SELECT id FROM categories WHERE title='SPACE'),'double',1600,'This NASA program landed humans on the Moon','What is Apollo?',false),
((SELECT id FROM categories WHERE title='SPACE'),'double',2000,'This telescope launched in 1990 orbits Earth','What is Hubble?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SPORTS'),'double',400,'In soccer, this many players per side start a match','What is 11?',false),
((SELECT id FROM categories WHERE title='SPORTS'),'double',800,'This Olympic event combines swimming, cycling and running','What is the triathlon?',false),
((SELECT id FROM categories WHERE title='SPORTS'),'double',1200,'This Grand Slam tennis event is played on clay in Paris','What is Roland-Garros (French Open)?',false),
((SELECT id FROM categories WHERE title='SPORTS'),'double',1600,'In American football, this is worth 6 points','What is a touchdown?',false),
((SELECT id FROM categories WHERE title='SPORTS'),'double',2000,'This country invented table tennis'' predecessor and hosts Olympic ping-pong dominance','What is China?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MUSIC'),'double',400,'This band sang “Hey Jude” and “Let It Be”','Who are The Beatles?',false),
((SELECT id FROM categories WHERE title='MUSIC'),'double',800,'This Queen anthem says “we will” do this to you','What is “We Will Rock You”?',false),
((SELECT id FROM categories WHERE title='MUSIC'),'double',1200,'This instrument has 88 keys','What is the piano?',false),
((SELECT id FROM categories WHERE title='MUSIC'),'double',1600,'This pop star''s 2023 tour was called the Eras Tour','Who is Taylor Swift?',false),
((SELECT id FROM categories WHERE title='MUSIC'),'double',2000,'This composer went deaf yet wrote the 9th Symphony','Who is Beethoven?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='GEOGRAPHY'),'double',400,'This is the longest river in the world (disputed with the Amazon)','What is the Nile?',false),
((SELECT id FROM categories WHERE title='GEOGRAPHY'),'double',800,'This desert is the largest hot desert on Earth','What is the Sahara?',false),
((SELECT id FROM categories WHERE title='GEOGRAPHY'),'double',1200,'This mountain range includes Everest','What are the Himalayas?',false),
((SELECT id FROM categories WHERE title='GEOGRAPHY'),'double',1600,'This country has the maple leaf on its flag','What is Canada?',false),
((SELECT id FROM categories WHERE title='GEOGRAPHY'),'double',2000,'This strait separates Spain and Morocco','What is the Strait of Gibraltar?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WORDPLAY'),'double',400,'A “wise guy” turned around becomes this kind of “guy” in a pun','What is a “guy wise” (guise)?',false),
((SELECT id FROM categories WHERE title='WORDPLAY'),'double',800,'This 3-letter word reads the same backward and forward and stings','What is “bee”?',false),
((SELECT id FROM categories WHERE title='WORDPLAY'),'double',1200,'“A Santa at NASA” is an example of this reversible phrase','What is a palindrome?',false),
((SELECT id FROM categories WHERE title='WORDPLAY'),'double',1600,'This word for a word that sounds like its meaning: “buzz” or “hiss”','What is onomatopoeia?',false),
((SELECT id FROM categories WHERE title='WORDPLAY'),'double',2000,'“The horse raced past the barn fell” is a classic example of this sentence type','What is a garden-path sentence?',false);

-- ===== FINAL =====
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FINAL: INVENTIONS'),'final',0,'This 1879 invention by Edison is tested in Menlo Park and lights up the clue','What is the light bulb?',false);

-- Default board wiring
INSERT INTO boards (name) VALUES ('Premiere Night') ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Premiere Night');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Premiere Night'), id, 'jeopardy', pos FROM (VALUES
  ('WORLD CAPITALS',0),('SCIENCE 101',1),('MOVIES',2),('HISTORY',3),('TECH',4),('FOOD & DRINK',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Premiere Night'), id, 'double', pos FROM (VALUES
  ('LITERATURE',0),('SPACE',1),('SPORTS',2),('MUSIC',3),('GEOGRAPHY',4),('WORDPLAY',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Premiere Night'), id, 'final', 0 FROM categories WHERE title='FINAL: INVENTIONS';
