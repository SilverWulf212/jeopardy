-- Olympic Games set. One-shot seed: 13 olympics-tagged categories, 61 clues.
-- Official Games history through Paris 2024. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (SYMBOLS 1000), 2 double (RECORDS 1600, BOYCOTTS 1600).

INSERT INTO categories (title, description, tags) VALUES
  ('SUMMER SPORTS','Warm weather Olympic contests','{olympics}'),
  ('WINTER SPORTS','Ice and snow Olympic contests','{olympics}'),
  ('GOLD MEDAL MOMENTS','Unforgettable Olympic victories','{olympics}'),
  ('HOST CITIES','Past and future Olympic hosts','{olympics}'),
  ('OLYMPIC SYMBOLS','Rings flame and motto','{olympics}'),
  ('TRACK & FIELD','Running jumping throwing events','{olympics}'),
  ('THE ANCIENT GAMES','Origins in ancient Greece','{olympics}'),
  ('RECORD BREAKERS','Medal counts and lasting marks','{olympics}'),
  ('GYMNASTICS GREATS','Stars of mat and apparatus','{olympics}'),
  ('SWIMMING GREATS','Legends of the Olympic pool','{olympics}'),
  ('BOYCOTTS & HISTORY','Politics war and protest','{olympics}'),
  ('PARALYMPIC GAMES','Games for athletes with disabilities','{olympics}'),
  ('ATHENS 1896','First modern Olympic Games','{olympics}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SUMMER SPORTS'),'jeopardy',200,'Hoops game played at the Olympics by Dream Team stars','What is basketball?',false),
((SELECT id FROM categories WHERE title='SUMMER SPORTS'),'jeopardy',400,'This swimming stroke is swum on the back in freestyle events','What is backstroke?',false),
((SELECT id FROM categories WHERE title='SUMMER SPORTS'),'jeopardy',600,'This women apparatus is a 10 centimeter wide beam','What is the balance beam?',false),
((SELECT id FROM categories WHERE title='SUMMER SPORTS'),'jeopardy',800,'Japanese martial art won by ippon','What is judo?',false),
((SELECT id FROM categories WHERE title='SUMMER SPORTS'),'jeopardy',1000,'This many weapons are contested in Olympic fencing: epee foil and sabre','What is three?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WINTER SPORTS'),'jeopardy',200,'Ice dance with triple axels and spins','What is figure skating?',false),
((SELECT id FROM categories WHERE title='WINTER SPORTS'),'jeopardy',400,'Ice sport sliding stones toward a house','What is curling?',false),
((SELECT id FROM categories WHERE title='WINTER SPORTS'),'jeopardy',600,'This fastest alpine event is a downhill only speed race','What is downhill?',false),
((SELECT id FROM categories WHERE title='WINTER SPORTS'),'jeopardy',800,'Oval ice laps raced for speed','What is speed skating?',false),
((SELECT id FROM categories WHERE title='WINTER SPORTS'),'jeopardy',1000,'Headfirst solo sled run','What is skeleton?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='GOLD MEDAL MOMENTS'),'jeopardy',200,'American swimmer with eight golds at Beijing 2008','Who is Michael Phelps?',false),
((SELECT id FROM categories WHERE title='GOLD MEDAL MOMENTS'),'jeopardy',400,'American sprinter with four golds at Berlin 1936','Who is Jesse Owens?',false),
((SELECT id FROM categories WHERE title='GOLD MEDAL MOMENTS'),'jeopardy',600,'Rome 1960 boxing champ later known as The Greatest','Who is Muhammad Ali?',false),
((SELECT id FROM categories WHERE title='GOLD MEDAL MOMENTS'),'jeopardy',800,'American gymnast who vaulted on an injured ankle at Atlanta 1996','Who is Kerri Strug?',false),
((SELECT id FROM categories WHERE title='GOLD MEDAL MOMENTS'),'jeopardy',1000,'Usain Bolt won the 100m and 200m at Beijing 2008 London 2012 and Rio 2016','Who is Usain Bolt?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HOST CITIES'),'jeopardy',200,'Host of the Summer Games in 2024','What is Paris?',false),
((SELECT id FROM categories WHERE title='HOST CITIES'),'jeopardy',400,'Host picked for the Summer Games in 2028','What is Los Angeles?',false),
((SELECT id FROM categories WHERE title='HOST CITIES'),'jeopardy',600,'Host of the Summer Games in 2012','What is London?',false),
((SELECT id FROM categories WHERE title='HOST CITIES'),'jeopardy',800,'Host of the Summer Games in 2016','What is Rio de Janeiro?',false),
((SELECT id FROM categories WHERE title='HOST CITIES'),'jeopardy',1000,'Host of the Summer Games in 2000','What is Sydney?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='OLYMPIC SYMBOLS'),'jeopardy',200,'Number of interlocking rings on the Olympic flag','What is five?',false),
((SELECT id FROM categories WHERE title='OLYMPIC SYMBOLS'),'jeopardy',400,'Gold silver or bronze Olympic prize','What is a medal?',false),
((SELECT id FROM categories WHERE title='OLYMPIC SYMBOLS'),'jeopardy',600,'Torch relay fire lit in Olympia','What is the Olympic flame?',false),
((SELECT id FROM categories WHERE title='OLYMPIC SYMBOLS'),'jeopardy',800,'Faster Higher Stronger Together in Latin with Communiter added 2021','What is the Olympic motto?',false),
((SELECT id FROM categories WHERE title='OLYMPIC SYMBOLS'),'jeopardy',1000,'Olive crown given to winners in ancient times','What is an olive wreath?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TRACK & FIELD'),'jeopardy',200,'Long road race of 26 point 2 miles','What is the marathon?',false),
((SELECT id FROM categories WHERE title='TRACK & FIELD'),'jeopardy',400,'Shortest Olympic sprint','What is the 100 meter dash?',false),
((SELECT id FROM categories WHERE title='TRACK & FIELD'),'jeopardy',600,'Fosbury Flop event over a high bar','What is the high jump?',false),
((SELECT id FROM categories WHERE title='TRACK & FIELD'),'jeopardy',800,'Two day ten event contest','What is the decathlon?',false),
((SELECT id FROM categories WHERE title='TRACK & FIELD'),'jeopardy',1000,'Throw of a heavy metal ball on a wire','What is the hammer throw?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE ANCIENT GAMES'),'double',400,'Sanctuary site of the ancient Games in Elis','What is Olympia?',false),
((SELECT id FROM categories WHERE title='THE ANCIENT GAMES'),'double',800,'One stade footrace the original event','What is the stadion?',false),
((SELECT id FROM categories WHERE title='THE ANCIENT GAMES'),'double',1200,'King of the gods honored by the ancient Games','Who is Zeus?',false),
((SELECT id FROM categories WHERE title='THE ANCIENT GAMES'),'double',1600,'Four year period between ancient Games','What is an Olympiad?',false),
((SELECT id FROM categories WHERE title='THE ANCIENT GAMES'),'double',2000,'Roman emperor who banned the ancient Games in 393 AD','Who is Theodosius?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='RECORD BREAKERS'),'double',400,'Total Olympic gold medals won by Michael Phelps','What is twenty three?',false),
((SELECT id FROM categories WHERE title='RECORD BREAKERS'),'double',800,'American swimmer with seven golds at Munich 1972','Who is Mark Spitz?',false),
((SELECT id FROM categories WHERE title='RECORD BREAKERS'),'double',1200,'American track athlete who won 9 Olympic golds from 1984 to 1996','Who is Carl Lewis?',false),
((SELECT id FROM categories WHERE title='RECORD BREAKERS'),'double',1600,'Soviet gymnast with eighteen medals record for decades','Who is Larisa Latynina?',true),
((SELECT id FROM categories WHERE title='RECORD BREAKERS'),'double',2000,'American whose Mexico City 1968 long jump stood for decades','Who is Bob Beamon?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='GYMNASTICS GREATS'),'double',400,'Romanian teen with first perfect ten at Montreal 1976','Who is Nadia Comaneci?',false),
((SELECT id FROM categories WHERE title='GYMNASTICS GREATS'),'double',800,'American darling of Los Angeles 1984','Who is Mary Lou Retton?',false),
((SELECT id FROM categories WHERE title='GYMNASTICS GREATS'),'double',1200,'American star of Rio Tokyo and Paris with seven golds','Who is Simone Biles?',false),
((SELECT id FROM categories WHERE title='GYMNASTICS GREATS'),'double',1600,'Soviet pixie star of Munich 1972','Who is Olga Korbut?',false),
((SELECT id FROM categories WHERE title='GYMNASTICS GREATS'),'double',2000,'Japanese man called King Kohei all around champ 2012 and 2016','Who is Kohei Uchimura?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SWIMMING GREATS'),'double',400,'American woman with nine golds through Paris 2024','Who is Katie Ledecky?',false),
((SELECT id FROM categories WHERE title='SWIMMING GREATS'),'double',800,'Australian Thorpedo with five gold medals','Who is Ian Thorpe?',false),
((SELECT id FROM categories WHERE title='SWIMMING GREATS'),'double',1200,'French star with four golds at Paris 2024','Who is Leon Marchand?',false),
((SELECT id FROM categories WHERE title='SWIMMING GREATS'),'double',1600,'East German woman with six golds at Seoul 1988','Who is Kristin Otto?',false),
((SELECT id FROM categories WHERE title='SWIMMING GREATS'),'double',2000,'Australian who won the same freestyle thrice in 1956 1960 1964','Who is Dawn Fraser?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='BOYCOTTS & HISTORY'),'double',400,'Nation that led the boycott of Moscow 1980','What is the United States?',false),
((SELECT id FROM categories WHERE title='BOYCOTTS & HISTORY'),'double',800,'Power that led the boycott of Los Angeles 1984','What is the Soviet Union?',false),
((SELECT id FROM categories WHERE title='BOYCOTTS & HISTORY'),'double',1200,'City where eleven Israelis died in 1972','What is Munich?',false),
((SELECT id FROM categories WHERE title='BOYCOTTS & HISTORY'),'double',1600,'Summer Games of these years were cancelled due to war','What are 1916 1940 and 1944?',true),
((SELECT id FROM categories WHERE title='BOYCOTTS & HISTORY'),'double',2000,'These two athletes raised fists in Mexico City 1968 protest','Who are Tommie Smith and John Carlos?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PARALYMPIC GAMES'),'double',400,'Year of the first official Paralympics in Rome','What is 1960?',false),
((SELECT id FROM categories WHERE title='PARALYMPIC GAMES'),'double',800,'Doctor who founded the Stoke Mandeville Games','Who is Ludwig Guttmann?',false),
((SELECT id FROM categories WHERE title='PARALYMPIC GAMES'),'double',1200,'South African blade runner at London 2012','Who is Oscar Pistorius?',false),
((SELECT id FROM categories WHERE title='PARALYMPIC GAMES'),'double',1600,'American swimmer with fifty five Paralympic medals','Who is Trischa Zorn?',false),
((SELECT id FROM categories WHERE title='PARALYMPIC GAMES'),'double',2000,'Indoor ball sport for the visually impaired with bells inside','What is goalball?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ATHENS 1896'),'final',0,'French baron who founded the modern Olympic Games','Who is Pierre de Coubertin?',false);

INSERT INTO boards (name, description, tags) VALUES
('Olympic Games','Official Games history through Paris 2024. Tribunal-verified.','{olympics}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Olympic Games');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Olympic Games'), id, 'jeopardy', pos FROM (VALUES
  ('SUMMER SPORTS',0),('WINTER SPORTS',1),('GOLD MEDAL MOMENTS',2),('HOST CITIES',3),('OLYMPIC SYMBOLS',4),('TRACK & FIELD',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Olympic Games'), id, 'double', pos FROM (VALUES
  ('THE ANCIENT GAMES',0),('RECORD BREAKERS',1),('GYMNASTICS GREATS',2),('SWIMMING GREATS',3),('BOYCOTTS & HISTORY',4),('PARALYMPIC GAMES',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Olympic Games'), id, 'final', 0 FROM categories WHERE title='ATHENS 1896';
