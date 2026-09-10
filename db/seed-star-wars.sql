-- Star Wars game set. One-shot seed: 13 star-wars-tagged categories, 61 clues.
-- Canon: 9 saga films + famous animated series facts. No Legends. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (FORCE 1000), 2 double (SEQUELS 1600, CLONE WARS 1200).

INSERT INTO categories (title, description, tags) VALUES
  ('THE FORCE','Mystical energy and its powers','{star-wars}'),
  ('DROIDS','Mechanical companions and warriors','{star-wars}'),
  ('THE ORIGINAL TRILOGY','Episodes Four through Six','{star-wars}'),
  ('PLANETS & PLACES','Worlds across the galaxy','{star-wars}'),
  ('VILLAINS OF THE SAGA','Dark side rulers and foes','{star-wars}'),
  ('HEROES OF THE REBELLION','Leaders of the fight against the Empire','{star-wars}'),
  ('THE PREQUELS','Episodes One through Three','{star-wars}'),
  ('THE SEQUELS','Episodes Seven through Nine','{star-wars}'),
  ('THE CLONE WARS','Animated war era stories','{star-wars}'),
  ('THE JEDI ORDER','Guardians of peace and justice','{star-wars}'),
  ('STARSHIPS & VEHICLES','Ships and machines of war','{star-wars}'),
  ('BOUNTY HUNTERS & SCOUNDRELS','Hunters smugglers and outlaws','{star-wars}'),
  ('1977','The year it all began','{star-wars}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE FORCE'),'jeopardy',200,'Obi-Wan calls this an energy field created by all living things that binds the galaxy together','What is the Force?',false),
((SELECT id FROM categories WHERE title='THE FORCE'),'jeopardy',400,'Microscopic life form linked to Force sensitivity','What is a midi-chlorian?',false),
((SELECT id FROM categories WHERE title='THE FORCE'),'jeopardy',600,'Obi-Wan uses this power on a Mos Eisley stormtrooper: These are not the droids you seek','What is the Jedi mind trick?',false),
((SELECT id FROM categories WHERE title='THE FORCE'),'jeopardy',800,'This Force power Luke trains on Dagobah lifting stones while failing his X-wing','What is telekinesis?',false),
((SELECT id FROM categories WHERE title='THE FORCE'),'jeopardy',1000,'Palpatine uses this power on Luke in the throne room and on Mace Windu','What is Force lightning?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DROIDS'),'jeopardy',200,'Gold protocol droid fluent in six million forms of communication','Who is C-3PO?',false),
((SELECT id FROM categories WHERE title='DROIDS'),'jeopardy',400,'This astromech carried Death Star plans, served Luke, later held the map to Luke','Who is R2-D2?',false),
((SELECT id FROM categories WHERE title='DROIDS'),'jeopardy',600,'Orange and white rolling droid carrying part of the map to Luke Skywalker','Who is BB-8?',false),
((SELECT id FROM categories WHERE title='DROIDS'),'jeopardy',800,'Reprogrammed assassin droid who protects Grogu and says I have spoken','Who is IG-11?',false),
((SELECT id FROM categories WHERE title='DROIDS'),'jeopardy',1000,'Separatist infantry droid known for saying Roger Roger','What is a B1 battle droid?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE ORIGINAL TRILOGY'),'jeopardy',200,'The 1977 film opening crawl gives it this Episode IV subtitle','What is A New Hope?',false),
((SELECT id FROM categories WHERE title='THE ORIGINAL TRILOGY'),'jeopardy',400,'Planet destroying station Luke blows up through an exhaust port','What is the Death Star?',false),
((SELECT id FROM categories WHERE title='THE ORIGINAL TRILOGY'),'jeopardy',600,'Frozen substance Han Solo is encased in at the end of The Empire Strikes Back','What is carbonite?',false),
((SELECT id FROM categories WHERE title='THE ORIGINAL TRILOGY'),'jeopardy',800,'Forest moon home of the Ewoks and the second Death Star shield','What is Endor?',false),
((SELECT id FROM categories WHERE title='THE ORIGINAL TRILOGY'),'jeopardy',1000,'This general with Nien Nunb leads Gold Squadron destroying the second Death Star core at Endor','Who is Lando Calrissian?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PLANETS & PLACES'),'jeopardy',200,'Desert home of Luke Skywalker with twin suns','What is Tatooine?',false),
((SELECT id FROM categories WHERE title='PLANETS & PLACES'),'jeopardy',400,'Frozen world of Echo Base in The Empire Strikes Back','What is Hoth?',false),
((SELECT id FROM categories WHERE title='PLANETS & PLACES'),'jeopardy',600,'Gas giant home to Cloud City','What is Bespin?',false),
((SELECT id FROM categories WHERE title='PLANETS & PLACES'),'jeopardy',800,'Murky swamp world where Yoda lives in exile','What is Dagobah?',false),
((SELECT id FROM categories WHERE title='PLANETS & PLACES'),'jeopardy',1000,'New Republic capital system destroyed by Starkiller Base in The Force Awakens','What is Hosnian Prime?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='VILLAINS OF THE SAGA'),'jeopardy',200,'Black helmeted Sith Lord and father of Luke Skywalker','Who is Darth Vader?',false),
((SELECT id FROM categories WHERE title='VILLAINS OF THE SAGA'),'jeopardy',400,'Ruler of the Galactic Empire seated on the throne on the second Death Star','Who is Emperor Palpatine?',false),
((SELECT id FROM categories WHERE title='VILLAINS OF THE SAGA'),'jeopardy',600,'Horned Sith with a double bladed lightsaber in The Phantom Menace','Who is Darth Maul?',false),
((SELECT id FROM categories WHERE title='VILLAINS OF THE SAGA'),'jeopardy',800,'Masked First Order warrior with a crossguard lightsaber','Who is Kylo Ren?',false),
((SELECT id FROM categories WHERE title='VILLAINS OF THE SAGA'),'jeopardy',1000,'Former Jedi turned Separatist leader known as the Count','Who is Count Dooku?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HEROES OF THE REBELLION'),'jeopardy',200,'Tatooine farm boy who destroys the first Death Star','Who is Luke Skywalker?',false),
((SELECT id FROM categories WHERE title='HEROES OF THE REBELLION'),'jeopardy',400,'Alderaan princess and general of the Resistance','Who is Leia Organa?',false),
((SELECT id FROM categories WHERE title='HEROES OF THE REBELLION'),'jeopardy',600,'Corellian smuggler who made the Kessel Run and owes Jabba','Who is Han Solo?',false),
((SELECT id FROM categories WHERE title='HEROES OF THE REBELLION'),'jeopardy',800,'Mon Calamari admiral famous for warning of a trap at Endor','Who is Admiral Ackbar?',false),
((SELECT id FROM categories WHERE title='HEROES OF THE REBELLION'),'jeopardy',1000,'Childhood friend of Luke from Tatooine who dies at the Battle of Yavin','Who is Biggs Darklighter?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE PREQUELS'),'double',400,'Sport Anakin wins to earn freedom on Tatooine','What is podracing?',false),
((SELECT id FROM categories WHERE title='THE PREQUELS'),'double',800,'Homeworld of the Gungans and Queen Amidala','What is Naboo?',false),
((SELECT id FROM categories WHERE title='THE PREQUELS'),'double',1200,'Armored bounty hunter whose DNA creates the clone army','Who is Jango Fett?',false),
((SELECT id FROM categories WHERE title='THE PREQUELS'),'double',1600,'Queen of Naboo who becomes senator and mother of twins','Who is Padme Amidala?',false),
((SELECT id FROM categories WHERE title='THE PREQUELS'),'double',2000,'Wookiee homeworld with a major battle in Revenge of the Sith','What is Kashyyyk?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE SEQUELS'),'double',400,'Jakku scavenger, Force heroine who finds Luke','Who is Rey?',false),
((SELECT id FROM categories WHERE title='THE SEQUELS'),'double',800,'First Order stormtrooper FN-2187 who defects to the Resistance','Who is Finn?',false),
((SELECT id FROM categories WHERE title='THE SEQUELS'),'double',1200,'Resistance pilot and leader with callsign Black Leader','Who is Poe Dameron?',false),
((SELECT id FROM categories WHERE title='THE SEQUELS'),'double',1600,'First Order hyperspace superweapon built on Ilum, infiltrated by Han and Finn','What is Starkiller Base?',true),
((SELECT id FROM categories WHERE title='THE SEQUELS'),'double',2000,'Ocean island world with the first Jedi temple where Luke hides','What is Ahch-To?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE CLONE WARS'),'double',400,'Togruta Padawan of Anakin Skywalker who leaves the Jedi','Who is Ahsoka Tano?',false),
((SELECT id FROM categories WHERE title='THE CLONE WARS'),'double',800,'Clone captain CT-7567 who serves with Anakin and Ahsoka','Who is Captain Rex?',false),
((SELECT id FROM categories WHERE title='THE CLONE WARS'),'double',1200,'Death Watch leader who duels Maul on Mandalore and loses the Darksaber','Who is Pre Vizsla?',true),
((SELECT id FROM categories WHERE title='THE CLONE WARS'),'double',1600,'Secret command that orders clones to kill all Jedi','What is Order 66?',false),
((SELECT id FROM categories WHERE title='THE CLONE WARS'),'double',2000,'Outer Rim planet besieged by Ahsoka and Maul at the end of the war','What is Mandalore?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE JEDI ORDER'),'double',400,'Nine-hundred-year-old master who trains Luke, says Do or do not','Who is Yoda?',false),
((SELECT id FROM categories WHERE title='THE JEDI ORDER'),'double',800,'Jedi Master who trains Anakin and defeats Maul on Naboo','Who is Obi-Wan Kenobi?',false),
((SELECT id FROM categories WHERE title='THE JEDI ORDER'),'double',1200,'This master found Anakin on Tatooine, killed by Maul on Naboo, avenged by Obi-Wan','Who is Qui-Gon Jinn?',false),
((SELECT id FROM categories WHERE title='THE JEDI ORDER'),'double',1600,'Jedi Council master with a purple lightsaber','Who is Mace Windu?',false),
((SELECT id FROM categories WHERE title='THE JEDI ORDER'),'double',2000,'Frozen world where younglings find kyber crystals for lightsabers','What is Ilum?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='STARSHIPS & VEHICLES'),'double',400,'Fastest hunk of junk in the galaxy flown by Han Solo','What is the Millennium Falcon?',false),
((SELECT id FROM categories WHERE title='STARSHIPS & VEHICLES'),'double',800,'Rebel single pilot fighter Luke uses at Yavin','What is an X-wing?',false),
((SELECT id FROM categories WHERE title='STARSHIPS & VEHICLES'),'double',1200,'Four legged Imperial walker used at the Battle of Hoth','What is an AT-AT?',false),
((SELECT id FROM categories WHERE title='STARSHIPS & VEHICLES'),'double',1600,'Darth Vader Super Star Destroyer flagship','What is the Executor?',false),
((SELECT id FROM categories WHERE title='STARSHIPS & VEHICLES'),'double',2000,'Modified freighter home of the Spectre crew in Rebels','What is the Ghost?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='BOUNTY HUNTERS & SCOUNDRELS'),'double',400,'Helmeted bounty hunter who delivers Han Solo in carbonite','Who is Boba Fett?',false),
((SELECT id FROM categories WHERE title='BOUNTY HUNTERS & SCOUNDRELS'),'double',800,'Mandalorian foundling named Din Djarin who protects Grogu','Who is Din Djarin?',false),
((SELECT id FROM categories WHERE title='BOUNTY HUNTERS & SCOUNDRELS'),'double',1200,'Green Rodian bounty hunter shot by Han in Mos Eisley','Who is Greedo?',false),
((SELECT id FROM categories WHERE title='BOUNTY HUNTERS & SCOUNDRELS'),'double',1600,'Weequay pirate leader active in the Clone Wars and Rebels era','Who is Hondo Ohnaka?',false),
((SELECT id FROM categories WHERE title='BOUNTY HUNTERS & SCOUNDRELS'),'double',2000,'Blue skinned bounty hunter with a wide brimmed hat from the Clone Wars','Who is Cad Bane?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='1977'),'final',0,'The creator and director of the first Star Wars film released this year','Who is George Lucas?',false);

INSERT INTO boards (name, description, tags) VALUES
('Star Wars','Nine saga films plus famous animated series. No Legends. Tribunal-verified.','{star-wars}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Star Wars');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Star Wars'), id, 'jeopardy', pos FROM (VALUES
  ('THE FORCE',0),('DROIDS',1),('THE ORIGINAL TRILOGY',2),('PLANETS & PLACES',3),('VILLAINS OF THE SAGA',4),('HEROES OF THE REBELLION',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Star Wars'), id, 'double', pos FROM (VALUES
  ('THE PREQUELS',0),('THE SEQUELS',1),('THE CLONE WARS',2),('THE JEDI ORDER',3),('STARSHIPS & VEHICLES',4),('BOUNTY HUNTERS & SCOUNDRELS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Star Wars'), id, 'final', 0 FROM categories WHERE title='1977';
