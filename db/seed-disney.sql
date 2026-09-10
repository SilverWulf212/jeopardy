-- Disney Animation game set. One-shot seed: 13 disney-tagged categories, 61 clues.
-- Released Disney/Pixar films, parks, Walt history. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (VILLAINS 1000), 2 double (PIXAR 1600, MODERN 1600).

INSERT INTO categories (title, description, tags) VALUES
  ('MICKEY & FRIENDS','Core mouse universe pals and foes','{disney}'),
  ('DISNEY PRINCESSES','Royalty from classic fairy tales','{disney}'),
  ('DISNEY VILLAINS','Baddies schemers and tyrants','{disney}'),
  ('ANIMATED CLASSICS','Early Walt era feature milestones','{disney}'),
  ('SONGS','Big tunes from animated hits','{disney}'),
  ('ANIMAL STARS','Furry feathered and finned leads','{disney}'),
  ('PIXAR FILMS','Lamp studio computer animated hits','{disney}'),
  ('THE DISNEY RENAISSANCE','Late 1980s to 1990s comeback era','{disney}'),
  ('DISNEY PARKS','Lands castles and rides','{disney}'),
  ('WALT THE MAN','Life and legacy of the founder','{disney}'),
  ('MODERN ERA','2010s to 2020s animated hits','{disney}'),
  ('VOICE ACTORS','Stars behind beloved characters','{disney}'),
  ('STEAMBOAT WILLIE','1928 short that made Mickey a star','{disney}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MICKEY & FRIENDS'),'jeopardy',200,'Mickey loyal pet dog who first appeared in 1930','Who is Pluto?',false),
((SELECT id FROM categories WHERE title='MICKEY & FRIENDS'),'jeopardy',400,'This sailor suited duck with a short temper is a best friend of Mickey Mouse','Who is Donald Duck?',false),
((SELECT id FROM categories WHERE title='MICKEY & FRIENDS'),'jeopardy',600,'This leading lady in polka dots debuted with Mickey in 1928 as his longtime sweetheart','Who is Minnie Mouse?',false),
((SELECT id FROM categories WHERE title='MICKEY & FRIENDS'),'jeopardy',800,'This tall and goofy pal of Mickey is the father of Max Goof','Who is Goofy?',false),
((SELECT id FROM categories WHERE title='MICKEY & FRIENDS'),'jeopardy',1000,'This peg legged cat is the longtime foe of Mickey dating back to 1925','Who is Pete?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DISNEY PRINCESSES'),'jeopardy',200,'This 1959 princess pricks her finger and sleeps until true love kiss','Who is Aurora?',false),
((SELECT id FROM categories WHERE title='DISNEY PRINCESSES'),'jeopardy',400,'This 1937 princess befriends seven dwarfs while fleeing a jealous queen','Who is Snow White?',false),
((SELECT id FROM categories WHERE title='DISNEY PRINCESSES'),'jeopardy',600,'This 1950 princess loses a glass slipper at the royal ball','Who is Cinderella?',false),
((SELECT id FROM categories WHERE title='DISNEY PRINCESSES'),'jeopardy',800,'This 1989 mermaid princess trades her voice for human legs','Who is Ariel?',false),
((SELECT id FROM categories WHERE title='DISNEY PRINCESSES'),'jeopardy',1000,'This 2010 tower bound princess with very long hair wields a frying pan','Who is Rapunzel?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DISNEY VILLAINS'),'jeopardy',200,'This fur obsessed villain wants to make coats from 101 Dalmatians','Who is Cruella de Vil?',false),
((SELECT id FROM categories WHERE title='DISNEY VILLAINS'),'jeopardy',400,'This purple sea witch offers Ariel a deal for human legs','Who is Ursula?',false),
((SELECT id FROM categories WHERE title='DISNEY VILLAINS'),'jeopardy',600,'This scarred lion uncle betrays Mufasa to take the Pride Lands throne','Who is Scar?',false),
((SELECT id FROM categories WHERE title='DISNEY VILLAINS'),'jeopardy',800,'This disguised old hag offers Snow White a poisoned apple','Who is the Evil Queen?',false),
((SELECT id FROM categories WHERE title='DISNEY VILLAINS'),'jeopardy',1000,'This stern Paris judge who sings Hellfire hunts Esmeralda in 1996','Who is Claude Frollo?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ANIMATED CLASSICS'),'jeopardy',200,'This 1937 debut feature with a princess and seven dwarfs was Disney first full length animated film','What is Snow White and the Seven Dwarfs?',false),
((SELECT id FROM categories WHERE title='ANIMATED CLASSICS'),'jeopardy',400,'This 1940 classic follows a wooden puppet who wishes to be a real boy','What is Pinocchio?',false),
((SELECT id FROM categories WHERE title='ANIMATED CLASSICS'),'jeopardy',600,'This 1942 classic follows a young deer called Prince of the Forest','What is Bambi?',false),
((SELECT id FROM categories WHERE title='ANIMATED CLASSICS'),'jeopardy',800,'This 1941 classic follows a big eared elephant who learns to fly','What is Dumbo?',false),
((SELECT id FROM categories WHERE title='ANIMATED CLASSICS'),'jeopardy',1000,'This 1940 feature pairs animation with classical music including Night on Bald Mountain','What is Fantasia?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SONGS'),'jeopardy',200,'This Lion King phrase meaning no worries is sung by Timon and Pumbaa','What is Hakuna Matata?',false),
((SELECT id FROM categories WHERE title='SONGS'),'jeopardy',400,'This power ballad sung by Elsa tops the Frozen soundtrack','What is Let It Go?',false),
((SELECT id FROM categories WHERE title='SONGS'),'jeopardy',600,'This Aladdin love duet is sung during a magic carpet ride','What is A Whole New World?',false),
((SELECT id FROM categories WHERE title='SONGS'),'jeopardy',800,'This Little Mermaid song has Ariel dreaming of life on land','What is Part of Your World?',false),
((SELECT id FROM categories WHERE title='SONGS'),'jeopardy',1000,'This Pinocchio lullaby about a star was sung by Jiminy Cricket','What is When You Wish Upon a Star?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ANIMAL STARS'),'jeopardy',200,'This lion cub grows to claim the throne in The Lion King','Who is Simba?',false),
((SELECT id FROM categories WHERE title='ANIMAL STARS'),'jeopardy',400,'This jungle bear teaches Mowgli the Bare Necessities','Who is Baloo?',false),
((SELECT id FROM categories WHERE title='ANIMAL STARS'),'jeopardy',600,'This thumping bunny is the best friend of Bambi','Who is Thumper?',false),
((SELECT id FROM categories WHERE title='ANIMAL STARS'),'jeopardy',800,'This mutt shares a spaghetti kiss with Lady in 1955','Who is Tramp?',false),
((SELECT id FROM categories WHERE title='ANIMAL STARS'),'jeopardy',1000,'This warthog is the best friend of Timon','Who is Pumbaa?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PIXAR FILMS'),'double',400,'This 1995 debut Pixar feature stars Woody and Buzz Lightyear','What is Toy Story?',false),
((SELECT id FROM categories WHERE title='PIXAR FILMS'),'double',800,'This 2003 Pixar hit follows a clownfish father crossing the ocean','What is Finding Nemo?',false),
((SELECT id FROM categories WHERE title='PIXAR FILMS'),'double',1200,'This 2004 Pixar film follows the Parr family of supers','What is The Incredibles?',false),
((SELECT id FROM categories WHERE title='PIXAR FILMS'),'double',1600,'This 2007 Pixar film follows a rat who cooks in Paris','What is Ratatouille?',true),
((SELECT id FROM categories WHERE title='PIXAR FILMS'),'double',2000,'This 2008 Pixar film follows a trash robot in love with EVE','What is WALL-E?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE DISNEY RENAISSANCE'),'double',400,'This 1989 mermaid hit launched the Renaissance era','What is The Little Mermaid?',false),
((SELECT id FROM categories WHERE title='THE DISNEY RENAISSANCE'),'double',800,'This 1991 tale of Belle and a cursed prince was Oscar nominated for Best Picture','What is Beauty and the Beast?',false),
((SELECT id FROM categories WHERE title='THE DISNEY RENAISSANCE'),'double',1200,'This 1992 hit features a Genie and a magic lamp in Agrabah','What is Aladdin?',false),
((SELECT id FROM categories WHERE title='THE DISNEY RENAISSANCE'),'double',1600,'This 1994 film was the highest grossing film of 1994 and top Renaissance grosser','What is The Lion King?',false),
((SELECT id FROM categories WHERE title='THE DISNEY RENAISSANCE'),'double',2000,'This 1997 film with gospel Muses follows a Greek hero seeking godhood','What is Hercules?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DISNEY PARKS'),'double',400,'This original California park opened by Walt Disney in 1955','What is Disneyland?',false),
((SELECT id FROM categories WHERE title='DISNEY PARKS'),'double',800,'Walt Disney World Magic Kingdom opened 1971 in Florida; EPCOT added as second gate in 1982','What is Walt Disney World?',false),
((SELECT id FROM categories WHERE title='DISNEY PARKS'),'double',1200,'This pink Anaheim castle honors the 1959 princess Aurora','What is Sleeping Beauty Castle?',false),
((SELECT id FROM categories WHERE title='DISNEY PARKS'),'double',1600,'This space themed indoor coaster flies through the dark in Tomorrowland','What is Space Mountain?',false),
((SELECT id FROM categories WHERE title='DISNEY PARKS'),'double',2000,'This pirate voyage ride in New Orleans Square inspired a film saga','What is Pirates of the Caribbean?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WALT THE MAN'),'double',400,'This Illinois city is the 1901 birthplace of Walt Disney','What is Chicago?',false),
((SELECT id FROM categories WHERE title='WALT THE MAN'),'double',800,'This world famous mouse co created by Walt and Ub Iwerks debuted in 1928','Who is Mickey Mouse?',false),
((SELECT id FROM categories WHERE title='WALT THE MAN'),'double',1200,'This lucky rabbit was the pre Mickey star Walt lost to Universal','Who is Oswald the Lucky Rabbit?',false),
((SELECT id FROM categories WHERE title='WALT THE MAN'),'double',1600,'This older brother co founded the Disney studio with Walt','Who is Roy Disney?',false),
((SELECT id FROM categories WHERE title='WALT THE MAN'),'double',2000,'Walt Disney passed away in this year, five years before Disney World opened','What is 1966?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MODERN ERA'),'double',400,'This 2013 snow hit stars Elsa Anna and Olaf in Arendelle','What is Frozen?',false),
((SELECT id FROM categories WHERE title='MODERN ERA'),'double',800,'This 2016 voyage follows a wayfinder and demigod Maui','What is Moana?',false),
((SELECT id FROM categories WHERE title='MODERN ERA'),'double',1200,'This 2016 city of mammals stars bunny cop Judy Hopps','What is Zootopia?',false),
((SELECT id FROM categories WHERE title='MODERN ERA'),'double',1600,'This 2021 hit about the Madrigal family takes place in a magic Casita','What is Encanto?',true),
((SELECT id FROM categories WHERE title='MODERN ERA'),'double',2000,'This 2019 sequel follows Elsa to an Enchanted Forest after hearing a siren call','What is Frozen II?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='VOICE ACTORS'),'double',400,'This comic star voiced Genie in Aladdin','Who is Robin Williams?',false),
((SELECT id FROM categories WHERE title='VOICE ACTORS'),'double',800,'This star voices Woody in every Toy Story feature','Who is Tom Hanks?',false),
((SELECT id FROM categories WHERE title='VOICE ACTORS'),'double',1200,'This comic host voices forgetful Dory in Finding Nemo','Who is Ellen DeGeneres?',false),
((SELECT id FROM categories WHERE title='VOICE ACTORS'),'double',1600,'This deep voiced star is Mufasa in The Lion King','Who is James Earl Jones?',false),
((SELECT id FROM categories WHERE title='VOICE ACTORS'),'double',2000,'This Broadway star is the singing voice of Elsa in Frozen','Who is Idina Menzel?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='STEAMBOAT WILLIE'),'final',0,'This 1928 short co-directed by Walt Disney and Ub Iwerks debuted Mickey Mouse','What is Steamboat Willie?',false);

INSERT INTO boards (name, description, tags) VALUES
('Disney Animation','Released films parks and Walt history. Tribunal-verified.','{disney}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Disney Animation');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Disney Animation'), id, 'jeopardy', pos FROM (VALUES
  ('MICKEY & FRIENDS',0),('DISNEY PRINCESSES',1),('DISNEY VILLAINS',2),('ANIMATED CLASSICS',3),('SONGS',4),('ANIMAL STARS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Disney Animation'), id, 'double', pos FROM (VALUES
  ('PIXAR FILMS',0),('THE DISNEY RENAISSANCE',1),('DISNEY PARKS',2),('WALT THE MAN',3),('MODERN ERA',4),('VOICE ACTORS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Disney Animation'), id, 'final', 0 FROM categories WHERE title='STEAMBOAT WILLIE';
