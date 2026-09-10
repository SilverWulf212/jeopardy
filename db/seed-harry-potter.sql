-- Harry Potter game set. One-shot seed: 13 harry-potter-tagged categories, 61 clues.
-- Canon: 7 books + 8 films only. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (SPELLS 1000), 2 double (HORCRUXES 1600, PROFESSORS 2000).

INSERT INTO categories (title, description, tags) VALUES
  ('THE BOY WHO LIVED','Facts about Harry Potter himself','{harry-potter}'),
  ('HOGWARTS HOUSES','Brave smart loyal and cunning homes','{harry-potter}'),
  ('SPELLS & CHARMS','Wands out for famous incantations','{harry-potter}'),
  ('MAGICAL CREATURES','Beasts pets and forest dwellers','{harry-potter}'),
  ('QUIDDITCH','Brooms balls and snitch action','{harry-potter}'),
  ('POTIONS & PLANTS','Brews herbs and garden dangers','{harry-potter}'),
  ('HORCRUXES','Pieces of Voldemort soul','{harry-potter}'),
  ('DEATHLY HALLOWS','Three legendary magical artifacts','{harry-potter}'),
  ('DEATH EATERS','Followers of the Dark Lord','{harry-potter}'),
  ('HOGWARTS PROFESSORS','Teachers of Hogwarts classes','{harry-potter}'),
  ('MAGICAL PLACES','Shops schools and secret spots','{harry-potter}'),
  ('THE TRIWIZARD TOURNAMENT','Dragons lake and maze contest','{harry-potter}'),
  ('THE FOUNDERS','Builders of Hogwarts school','{harry-potter}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE BOY WHO LIVED'),'jeopardy',200,'The Dursley home where Harry slept in a cupboard is number four on this street','What is 4 Privet Drive?',false),
((SELECT id FROM categories WHERE title='THE BOY WHO LIVED'),'jeopardy',400,'This red haired youngest Weasley son is Harry best friend','Who is Ron Weasley?',false),
((SELECT id FROM categories WHERE title='THE BOY WHO LIVED'),'jeopardy',600,'This loyal house elf is freed when Harry hides a sock in a diary','Who is Dobby?',false),
((SELECT id FROM categories WHERE title='THE BOY WHO LIVED'),'jeopardy',800,'Harry Patronus takes the form of this male deer','What is a stag?',false),
((SELECT id FROM categories WHERE title='THE BOY WHO LIVED'),'jeopardy',1000,'This is Harry middle name shared with his father','What is James?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HOGWARTS HOUSES'),'jeopardy',200,'Harry Ron and Hermione belong to this lion house known for bravery','What is Gryffindor?',false),
((SELECT id FROM categories WHERE title='HOGWARTS HOUSES'),'jeopardy',400,'Draco Malfoy belongs to this serpent house known for ambition','What is Slytherin?',false),
((SELECT id FROM categories WHERE title='HOGWARTS HOUSES'),'jeopardy',600,'Cedric Diggory belongs to this badger house known for loyalty','What is Hufflepuff?',false),
((SELECT id FROM categories WHERE title='HOGWARTS HOUSES'),'jeopardy',800,'Luna Lovegood belongs to this eagle house known for wit','What is Ravenclaw?',false),
((SELECT id FROM categories WHERE title='HOGWARTS HOUSES'),'jeopardy',1000,'This jolly ghost called the Fat Friar haunts the Hufflepuff tables','Who is the Fat Friar?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SPELLS & CHARMS'),'jeopardy',200,'Say Wingardium Leviosa to cast this lifting charm','What is Wingardium Leviosa?',false),
((SELECT id FROM categories WHERE title='SPELLS & CHARMS'),'jeopardy',400,'Harry signature disarming spell that knocks wands away','What is Expelliarmus?',false),
((SELECT id FROM categories WHERE title='SPELLS & CHARMS'),'jeopardy',600,'Say Expecto Patronum to summon this silver guardian','What is Expecto Patronum?',false),
((SELECT id FROM categories WHERE title='SPELLS & CHARMS'),'jeopardy',800,'This killing curse flashes green light and cannot be blocked','What is Avada Kedavra?',false),
((SELECT id FROM categories WHERE title='SPELLS & CHARMS'),'jeopardy',1000,'Snape invented this slashing curse used on Draco in a school bathroom','What is Sectumsempra?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MAGICAL CREATURES'),'jeopardy',200,'Hagrid three headed guard dog at the trapdoor is called this','Who is Fluffy?',false),
((SELECT id FROM categories WHERE title='MAGICAL CREATURES'),'jeopardy',400,'This giant talking spider lives in the Forbidden Forest with many children','Who is Aragog?',false),
((SELECT id FROM categories WHERE title='MAGICAL CREATURES'),'jeopardy',600,'This noble centaur carries Harry to safety in the Forbidden Forest','Who is Firenze?',false),
((SELECT id FROM categories WHERE title='MAGICAL CREATURES'),'jeopardy',800,'The Hungarian Horntail that Harry faces in the tournament is this beast','What is a dragon?',false),
((SELECT id FROM categories WHERE title='MAGICAL CREATURES'),'jeopardy',1000,'This crimson phoenix comes to Harry in the Chamber of Secrets','Who is Fawkes?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='QUIDDITCH'),'jeopardy',200,'Harry plays this position that hunts the Golden Snitch','What is Seeker?',false),
((SELECT id FROM categories WHERE title='QUIDDITCH'),'jeopardy',400,'Catching the Golden Snitch earns this many points','What is 150?',false),
((SELECT id FROM categories WHERE title='QUIDDITCH'),'jeopardy',600,'Harry upgrades from a Nimbus 2000 to this racing broom in Prisoner of Azkaban','What is the Firebolt?',false),
((SELECT id FROM categories WHERE title='QUIDDITCH'),'jeopardy',800,'Chasers score by throwing the Quaffle through these, three per side','What are goal hoops?',false),
((SELECT id FROM categories WHERE title='QUIDDITCH'),'jeopardy',1000,'This Bulgarian seeker played in the World Cup final seen in the books','Who is Viktor Krum?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='POTIONS & PLANTS'),'jeopardy',200,'This screaming baby root must be repotted with earmuffs on','What is a mandrake?',false),
((SELECT id FROM categories WHERE title='POTIONS & PLANTS'),'jeopardy',400,'This clever Gryffindor girl brews Polyjuice Potion in a bathroom','Who is Hermione Granger?',false),
((SELECT id FROM categories WHERE title='POTIONS & PLANTS'),'jeopardy',600,'This golden luck potion is also called liquid luck','What is Felix Felicis?',false),
((SELECT id FROM categories WHERE title='POTIONS & PLANTS'),'jeopardy',800,'This healing herb essence carried by Hermione closes deep cuts fast','What is Dittany?',false),
((SELECT id FROM categories WHERE title='POTIONS & PLANTS'),'jeopardy',1000,'This stone from a goat stomach is a cure for most poisons','What is a bezoar?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HORCRUXES'),'double',400,'Lucius Malfoy slips this diary Horcrux to Ginny Weasley','What is the Riddle diary?',false),
((SELECT id FROM categories WHERE title='HORCRUXES'),'double',800,'Dumbledore cursed hand came from this ring Horcrux of the Gaunt family','What is the Gaunt ring?',false),
((SELECT id FROM categories WHERE title='HORCRUXES'),'double',1200,'Umbridge wore this locket Horcrux stolen from the Black house','What is the Slytherin locket?',false),
((SELECT id FROM categories WHERE title='HORCRUXES'),'double',1600,'This cup Horcrux from a Hufflepuff founder hid in a Gringotts vault','What is the Hufflepuff cup?',true),
((SELECT id FROM categories WHERE title='HORCRUXES'),'double',2000,'This huge snake Horcrux guards Voldemort and kills Snape in the Shrieking Shack','Who is Nagini?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DEATHLY HALLOWS'),'double',400,'James passed this invisibility cloak Hallow down to Harry','What is the Invisibility Cloak?',false),
((SELECT id FROM categories WHERE title='DEATHLY HALLOWS'),'double',800,'Dumbledore and Voldemort both sought this unbeatable wand Hallow','What is the Elder Wand?',false),
((SELECT id FROM categories WHERE title='DEATHLY HALLOWS'),'double',1200,'Hidden in the Gaunt ring this small stone Hallow recalls lost loved ones','What is the Resurrection Stone?',false),
((SELECT id FROM categories WHERE title='DEATHLY HALLOWS'),'double',1600,'This odd Lovegood father edits the Quibbler and explains the Hallows sign','Who is Xenophilius Lovegood?',false),
((SELECT id FROM categories WHERE title='DEATHLY HALLOWS'),'double',2000,'The three Hallows first appear in this story of three brothers told to children','What is The Tale of the Three Brothers?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DEATH EATERS'),'double',400,'This blond Malfoy father hides the diary in Ginny cauldron','Who is Lucius Malfoy?',false),
((SELECT id FROM categories WHERE title='DEATH EATERS'),'double',800,'This wild Black sister laughs while killing Sirius at the Ministry','Who is Bellatrix Lestrange?',false),
((SELECT id FROM categories WHERE title='DEATH EATERS'),'double',1200,'This rat Animagus hid as Scabbers before returning to his master','Who is Peter Pettigrew?',false),
((SELECT id FROM categories WHERE title='DEATH EATERS'),'double',1600,'This Crouch son posed all year as Mad Eye Moody using Polyjuice','Who is Barty Crouch Jr.?',false),
((SELECT id FROM categories WHERE title='DEATH EATERS'),'double',2000,'This younger Black brother stole the locket and died in the cave','Who is Regulus Black?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HOGWARTS PROFESSORS'),'double',400,'This stern Transfiguration teacher can change into a tabby cat','Who is Minerva McGonagall?',false),
((SELECT id FROM categories WHERE title='HOGWARTS PROFESSORS'),'double',800,'Hagrid teaches this subject at Hogwarts','What is Care of Magical Creatures?',false),
((SELECT id FROM categories WHERE title='HOGWARTS PROFESSORS'),'double',1200,'This pink clad Ministry official bans fun with Educational Decrees','Who is Dolores Umbridge?',false),
((SELECT id FROM categories WHERE title='HOGWARTS PROFESSORS'),'double',1600,'This hooked nose Potions master killed Dumbledore atop the tower','Who is Severus Snape?',false),
((SELECT id FROM categories WHERE title='HOGWARTS PROFESSORS'),'double',2000,'Ghost professor of History of Magic who lectures on goblin rebellions','Who is Professor Cuthbert Binns?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MAGICAL PLACES'),'double',400,'Students run through a brick wall to reach this London train platform','What is Platform Nine and Three Quarters?',false),
((SELECT id FROM categories WHERE title='MAGICAL PLACES'),'double',800,'Goblins guard gold vaults in this Diagon Alley bank','What is Gringotts?',false),
((SELECT id FROM categories WHERE title='MAGICAL PLACES'),'double',1200,'Dementors guard this island prison in the cold North Sea','What is Azkaban?',false),
((SELECT id FROM categories WHERE title='MAGICAL PLACES'),'double',1600,'The Shrieking Shack stands near this all wizard village','What is Hogsmeade?',false),
((SELECT id FROM categories WHERE title='MAGICAL PLACES'),'double',2000,'Village where Harry got his scar; Potter cottage ruins there','What is Godric''s Hollow?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE TRIWIZARD TOURNAMENT'),'double',400,'This flaming cup selects one champion from each school','What is the Goblet of Fire?',false),
((SELECT id FROM categories WHERE title='THE TRIWIZARD TOURNAMENT'),'double',800,'This fair Hufflepuff champion shares the cup with Harry in the maze','Who is Cedric Diggory?',false),
((SELECT id FROM categories WHERE title='THE TRIWIZARD TOURNAMENT'),'double',1200,'This Beauxbatons beauty is part Veela and competes for France','Who is Fleur Delacour?',false),
((SELECT id FROM categories WHERE title='THE TRIWIZARD TOURNAMENT'),'double',1600,'The second task hides hostages under this dark lake on school grounds','What is the Black Lake?',false),
((SELECT id FROM categories WHERE title='THE TRIWIZARD TOURNAMENT'),'double',2000,'The maze cup was charmed into this instant travel object to a graveyard','What is a Portkey?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE FOUNDERS'),'final',0,'This lion founder left a ruby sword that appears to true Gryffindors in need','Who is Godric Gryffindor?',false);

INSERT INTO boards (name, description, tags) VALUES
('Harry Potter','Seven books and eight films. Tribunal-verified canon, no repeated answers.','{harry-potter}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Harry Potter');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Harry Potter'), id, 'jeopardy', pos FROM (VALUES
  ('THE BOY WHO LIVED',0),('HOGWARTS HOUSES',1),('SPELLS & CHARMS',2),('MAGICAL CREATURES',3),('QUIDDITCH',4),('POTIONS & PLANTS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Harry Potter'), id, 'double', pos FROM (VALUES
  ('HORCRUXES',0),('DEATHLY HALLOWS',1),('DEATH EATERS',2),('HOGWARTS PROFESSORS',3),('MAGICAL PLACES',4),('THE TRIWIZARD TOURNAMENT',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Harry Potter'), id, 'final', 0 FROM categories WHERE title='THE FOUNDERS';
