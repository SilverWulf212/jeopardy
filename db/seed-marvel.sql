-- Marvel Universe game set. One-shot seed: 15 marvel-tagged categories (13 wired
-- into the "Marvel Universe" board, 2 spares for the builder pool), 61 reviewed clues.
-- All facts verified by tribunal pass + showrunner dedup (no repeated answers in-set).
-- Canon only: comics Earth-616, MCU through 2024, Marvel Rivals launch era.

INSERT INTO categories (title, description, tags) VALUES
  ('HEROES & ALTER EGOS','Secret identities of famous Marvel heroes','{marvel}'),
  ('MCU PHASE ONE','Films of the MCU first phase, 2008 to 2012','{marvel}'),
  ('TEAMS & GROUPS','Hero teams, agencies, and guards','{marvel}'),
  ('VILLAINS','Famous foes of Marvel heroes','{marvel}'),
  ('SPIDEY''S WORLD','Peter Parker, friends, foes, and origin','{marvel}'),
  ('MARVEL RIVALS ROSTER','Launch-era playable heroes of Marvel Rivals','{marvel,rivals}'),
  ('GADGETS & ARTIFACTS','Iconic weapons, devices, and relics (builder pool spare)','{marvel}'),
  ('NEW YORK, MARVEL''S CITY','Places and headquarters of Marvel New York (builder pool spare)','{marvel}'),
  ('COSMIC MARVEL','Gods, titans, and guardians from beyond the stars','{marvel}'),
  ('X-MEN','Mutants, mansion, and coexistence','{marvel}'),
  ('AVENGERS ON SCREEN','Earth''s Mightiest Heroes in the MCU through 2024','{marvel}'),
  ('STREET-LEVEL HEROES','Vigilantes of New York neighborhoods','{marvel}'),
  ('MAGIC & THE MYSTIC','Sorcerers, dimensions, and artifacts','{marvel}'),
  ('RIVALS: ROLES & BATTLEGROUNDS','Roles and maps of Marvel Rivals launch era','{marvel,rivals}'),
  ('MARVEL FIRSTS','Landmark debuts that started it all','{marvel}')
ON CONFLICT (title) DO NOTHING;

-- ===== SINGLE JEOPARDY =====
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HEROES & ALTER EGOS'),'jeopardy',200,'This Queens teenager became Spider-Man after the bite of a radioactive spider','Who is Peter Parker?',false),
((SELECT id FROM categories WHERE title='HEROES & ALTER EGOS'),'jeopardy',400,'This Brooklyn super-soldier wields a vibranium shield as Captain America','Who is Steve Rogers?',false),
((SELECT id FROM categories WHERE title='HEROES & ALTER EGOS'),'jeopardy',600,'This billionaire genius built a powered suit of armor to become Iron Man','Who is Tony Stark?',false),
((SELECT id FROM categories WHERE title='HEROES & ALTER EGOS'),'jeopardy',800,'This blind lawyer from Hell''s Kitchen fights crime as Daredevil','Who is Matt Murdock?',false),
((SELECT id FROM categories WHERE title='HEROES & ALTER EGOS'),'jeopardy',1000,'This former U.S. Air Force officer became Captain Marvel','Who is Carol Danvers?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MCU PHASE ONE'),'jeopardy',200,'This 2008 film launched the MCU with Tony Stark building a suit in a cave','What is Iron Man?',false),
((SELECT id FROM categories WHERE title='MCU PHASE ONE'),'jeopardy',400,'This 2012 Joss Whedon film united the six original Avengers to battle in New York','What is The Avengers?',false),
((SELECT id FROM categories WHERE title='MCU PHASE ONE'),'jeopardy',600,'This 2011 film exiled the God of Thunder to New Mexico','What is Thor?',false),
((SELECT id FROM categories WHERE title='MCU PHASE ONE'),'jeopardy',800,'This 2011 film shows Steve Rogers receiving the Super-Soldier Serum and fighting the Red Skull','What is Captain America: The First Avenger?',false),
((SELECT id FROM categories WHERE title='MCU PHASE ONE'),'jeopardy',1000,'This 2008 film starred Edward Norton as Bruce Banner on the run from General Ross','What is The Incredible Hulk?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TEAMS & GROUPS'),'jeopardy',200,'Professor Charles Xavier''s team of mutant heroes based at a school in Westchester','What are the X-Men?',false),
((SELECT id FROM categories WHERE title='TEAMS & GROUPS'),'jeopardy',400,'This team of Reed Richards, Sue Storm, Johnny Storm, and Ben Grimm gained powers from cosmic rays','What is the Fantastic Four?',false),
((SELECT id FROM categories WHERE title='TEAMS & GROUPS'),'jeopardy',600,'This spy agency led by Nick Fury oversaw the Avengers Initiative','What is S.H.I.E.L.D.?',false),
((SELECT id FROM categories WHERE title='TEAMS & GROUPS'),'jeopardy',800,'This cosmic team includes Star-Lord, Gamora, Drax, Rocket, and Groot','What are the Guardians of the Galaxy?',false),
((SELECT id FROM categories WHERE title='TEAMS & GROUPS'),'jeopardy',1000,'This all-female Wakandan guard protects the Black Panther','What is the Dora Milaje?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='VILLAINS'),'jeopardy',200,'This brother of Thor invaded New York with a scepter and the Chitauri army','Who is Loki?',false),
((SELECT id FROM categories WHERE title='VILLAINS'),'jeopardy',400,'This Mad Titan used the Infinity Gauntlet to wipe out half of all life','Who is Thanos?',false),
((SELECT id FROM categories WHERE title='VILLAINS'),'jeopardy',600,'This X-Men foe and master of magnetism can control metal','Who is Magneto?',false),
((SELECT id FROM categories WHERE title='VILLAINS'),'jeopardy',800,'This Spider-Man foe and Norman Osborn alter ego throws pumpkin bombs from a glider','Who is the Green Goblin?',false),
((SELECT id FROM categories WHERE title='VILLAINS'),'jeopardy',1000,'This HYDRA leader and Captain America foe with a red skull-like face sought the Tesseract','Who is the Red Skull?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SPIDEY''S WORLD'),'jeopardy',200,'A bite from this type of irradiated creature gave Peter Parker his powers','What is a spider?',false),
((SELECT id FROM categories WHERE title='SPIDEY''S WORLD'),'jeopardy',400,'Peter Parker''s Uncle Ben famously told him that with great power must also come this','What is great responsibility?',false),
((SELECT id FROM categories WHERE title='SPIDEY''S WORLD'),'jeopardy',600,'This mustachioed newspaper publisher is constantly demanding pictures of Spider-Man','Who is J. Jonah Jameson?',false),
((SELECT id FROM categories WHERE title='SPIDEY''S WORLD'),'jeopardy',800,'This redheaded model told Peter Parker, Face it, tiger... you just hit the jackpot','Who is Mary Jane Watson?',false),
((SELECT id FROM categories WHERE title='SPIDEY''S WORLD'),'jeopardy',1000,'This college girlfriend of Peter Parker died on the George Washington Bridge in Amazing Spider-Man #121','Who is Gwen Stacy?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MARVEL RIVALS ROSTER'),'jeopardy',200,'This Flora Colossus Guardian of the Galaxy protects teammates as a Vanguard with living wood walls','Who is Groot?',false),
((SELECT id FROM categories WHERE title='MARVEL RIVALS ROSTER'),'jeopardy',400,'This skull-chested ex-Marine vigilante sprays bullets as a Duelist in Marvel Rivals','Who is the Punisher?',false),
((SELECT id FROM categories WHERE title='MARVEL RIVALS ROSTER'),'jeopardy',600,'This K-pop star turned ice-powered hero from Seoul heals allies as a Strategist','Who is Luna Snow?',false),
((SELECT id FROM categories WHERE title='MARVEL RIVALS ROSTER'),'jeopardy',800,'This Asgardian goddess of death snipes enemies as a Duelist in Marvel Rivals','Who is Hela?',false),
((SELECT id FROM categories WHERE title='MARVEL RIVALS ROSTER'),'jeopardy',1000,'This teenage pilot from Tokyo bonds with the SP//dr mech to tank as a Vanguard','Who is Peni Parker?',false);

-- spares for the builder pool
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='GADGETS & ARTIFACTS'),'jeopardy',200,'Captain America carries this nearly unbreakable disc-shaped weapon made of vibranium','What is Captain America''s shield?',false),
((SELECT id FROM categories WHERE title='GADGETS & ARTIFACTS'),'jeopardy',400,'Only the worthy can lift Thor''s hammer by this name','What is Mjolnir?',false),
((SELECT id FROM categories WHERE title='GADGETS & ARTIFACTS'),'jeopardy',600,'This glowing chest device powers Iron Man''s suit and keeps Tony Stark alive','What is the Arc Reactor?',false),
((SELECT id FROM categories WHERE title='GADGETS & ARTIFACTS'),'jeopardy',800,'Thanos snapped his fingers wearing this golden gauntlet holding six Infinity Stones','What is the Infinity Gauntlet?',false),
((SELECT id FROM categories WHERE title='GADGETS & ARTIFACTS'),'jeopardy',1000,'Doctor Strange wears this relic that holds the Time Stone in the MCU','What is the Eye of Agamotto?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='NEW YORK, MARVEL''S CITY'),'jeopardy',200,'Spider-Man grew up in Forest Hills in this New York City borough','What is Queens?',false),
((SELECT id FROM categories WHERE title='NEW YORK, MARVEL''S CITY'),'jeopardy',400,'Peter Parker works as a photographer for this New York newspaper','What is the Daily Bugle?',false),
((SELECT id FROM categories WHERE title='NEW YORK, MARVEL''S CITY'),'jeopardy',600,'Daredevil patrols this Manhattan neighborhood known for its kitchens','What is Hell''s Kitchen?',false),
((SELECT id FROM categories WHERE title='NEW YORK, MARVEL''S CITY'),'jeopardy',800,'Doctor Strange''s Greenwich Village townhouse headquarters is known by this alliterative name','What is the Sanctum Sanctorum?',false),
((SELECT id FROM categories WHERE title='NEW YORK, MARVEL''S CITY'),'jeopardy',1000,'The Fantastic Four''s Manhattan skyscraper headquarters by this Baxter name','What is the Baxter Building?',false);

-- ===== DOUBLE JEOPARDY =====
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='COSMIC MARVEL'),'double',400,'Peter Quill''s outlaw nickname','Who is Star-Lord?',false),
((SELECT id FROM categories WHERE title='COSMIC MARVEL'),'double',800,'This talking raccoon serves as weapons expert for the Guardians of the Galaxy','Who is Rocket Raccoon?',false),
((SELECT id FROM categories WHERE title='COSMIC MARVEL'),'double',1200,'The Silver Surfer serves as herald to this planet-devouring cosmic entity','Who is Galactus?',false),
((SELECT id FROM categories WHERE title='COSMIC MARVEL'),'double',1600,'This blue-skinned adopted daughter of Thanos joined the Guardians of the Galaxy','Who is Gamora?',true),
((SELECT id FROM categories WHERE title='COSMIC MARVEL'),'double',2000,'These six singularities that predate the universe became the powerful stones sought by Thanos','What are the Infinity Stones?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='X-MEN'),'double',400,'This X-Men leader fires optic blasts and must wear a visor to control them','Who is Cyclops?',false),
((SELECT id FROM categories WHERE title='X-MEN'),'double',800,'This weather-controlling mutant was once queen of Wakanda by marriage','Who is Storm?',false),
((SELECT id FROM categories WHERE title='X-MEN'),'double',1200,'This Weapon X subject known as Logan has claws and a healing factor','Who is Wolverine?',false),
((SELECT id FROM categories WHERE title='X-MEN'),'double',1600,'This powerful telepath founded Xavier''s School for Gifted Youngsters','Who is Professor X?',false),
((SELECT id FROM categories WHERE title='X-MEN'),'double',2000,'This blue-furred X-Man is a brilliant scientist','Who is Beast?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='AVENGERS ON SCREEN'),'double',400,'This Wakandan king made his MCU debut in 2016''s Captain America: Civil War','Who is Black Panther?',false),
((SELECT id FROM categories WHERE title='AVENGERS ON SCREEN'),'double',800,'This archer Avenger is known as Hawkeye','Who is Hawkeye?',false),
((SELECT id FROM categories WHERE title='AVENGERS ON SCREEN'),'double',1200,'This Asgardian prince of thunder wields the hammer Mjolnir','Who is Thor?',false),
((SELECT id FROM categories WHERE title='AVENGERS ON SCREEN'),'double',1600,'In 2012''s The Avengers, this alien army invades New York through a portal over Stark Tower','Who are the Chitauri?',false),
((SELECT id FROM categories WHERE title='AVENGERS ON SCREEN'),'double',2000,'This 2019 film culminated the Infinity Saga with the Avengers traveling through the Quantum Realm to undo the Snap','What is Avengers: Endgame?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='STREET-LEVEL HEROES'),'double',400,'This Brooklyn teen took up the Spider-Man mantle','Who is Miles Morales?',false),
((SELECT id FROM categories WHERE title='STREET-LEVEL HEROES'),'double',800,'This Alias Investigations owner has super-strength and a troubled past with Kilgrave','Who is Jessica Jones?',false),
((SELECT id FROM categories WHERE title='STREET-LEVEL HEROES'),'double',1200,'This sai-wielding assassin has loved and fought Daredevil','Who is Elektra?',false),
((SELECT id FROM categories WHERE title='STREET-LEVEL HEROES'),'double',1600,'This Harlem hero with unbreakable skin is known for the catchphrase Sweet Christmas','Who is Luke Cage?',true),
((SELECT id FROM categories WHERE title='STREET-LEVEL HEROES'),'double',2000,'This mystical martial artist from K''un-Lun wields a glowing chi-powered fist','Who is Iron Fist?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MAGIC & THE MYSTIC'),'double',400,'This former neurosurgeon became Sorcerer Supreme and Master of the Mystic Arts','Who is Doctor Strange?',false),
((SELECT id FROM categories WHERE title='MAGIC & THE MYSTIC'),'double',800,'This Spider-Man villain masters illusion with a fishbowl helmet','Who is Mysterio?',false),
((SELECT id FROM categories WHERE title='MAGIC & THE MYSTIC'),'double',1200,'This sentient cloak worn by Doctor Strange can move and act on its own','What is the Cloak of Levitation?',false),
((SELECT id FROM categories WHERE title='MAGIC & THE MYSTIC'),'double',1600,'This ancient sorcerer taught Doctor Strange the Mystic Arts','Who is the Ancient One?',false),
((SELECT id FROM categories WHERE title='MAGIC & THE MYSTIC'),'double',2000,'This ruler of the Dark Dimension seeks to merge Earth into his realm','Who is Dormammu?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='RIVALS: ROLES & BATTLEGROUNDS'),'double',400,'In Marvel Rivals, this green rage monster fights as a Vanguard','Who is Hulk?',false),
((SELECT id FROM categories WHERE title='RIVALS: ROLES & BATTLEGROUNDS'),'double',800,'In Marvel Rivals, this fan-favorite land shark heals allies as a Strategist','Who is Jeff the Land Shark?',false),
((SELECT id FROM categories WHERE title='RIVALS: ROLES & BATTLEGROUNDS'),'double',1200,'In Marvel Rivals, Iron Man and Spider-Man both queue as this damage-focused role','What is Duelist?',false),
((SELECT id FROM categories WHERE title='RIVALS: ROLES & BATTLEGROUNDS'),'double',1600,'In Marvel Rivals, Shin-Shibuya is a battleground within this futuristic Japanese map set in the year 2099','What is Tokyo 2099?',false),
((SELECT id FROM categories WHERE title='RIVALS: ROLES & BATTLEGROUNDS'),'double',2000,'In Marvel Rivals, the Royal Palace is a battleground on this map fusing Asgard and the World Tree','What is Yggsgard?',false);

-- ===== FINAL =====
INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MARVEL FIRSTS'),'final',0,'This November 1961 Stan Lee and Jack Kirby comic launched the Marvel Age with Marvel''s First Family','What is Fantastic Four #1?',false);

-- ===== board wiring =====
INSERT INTO boards (name, description, tags) VALUES
('Marvel Universe','Comics, MCU, and Marvel Rivals. Tribunal-verified canon, no repeated answers.','{marvel}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Marvel Universe');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Marvel Universe'), id, 'jeopardy', pos FROM (VALUES
  ('HEROES & ALTER EGOS',0),('MCU PHASE ONE',1),('TEAMS & GROUPS',2),('VILLAINS',3),('SPIDEY''S WORLD',4),('MARVEL RIVALS ROSTER',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Marvel Universe'), id, 'double', pos FROM (VALUES
  ('COSMIC MARVEL',0),('X-MEN',1),('AVENGERS ON SCREEN',2),('STREET-LEVEL HEROES',3),('MAGIC & THE MYSTIC',4),('RIVALS: ROLES & BATTLEGROUNDS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Marvel Universe'), id, 'final', 0 FROM categories WHERE title='MARVEL FIRSTS';
