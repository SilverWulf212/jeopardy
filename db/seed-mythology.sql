-- Greek Mythology game set. One-shot seed: 13 mythology-tagged categories, 61 clues.
-- Classical sources: Homer, Hesiod, Ovid. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (GODDESSES 1000), 2 double (ILIAD 1600, LABORS 1200).

INSERT INTO categories (title, description, tags) VALUES
  ('KING OF THE GODS','The rule of Zeus from Olympus','{mythology}'),
  ('GODDESSES','Great goddesses of Olympus and beyond','{mythology}'),
  ('MONSTERS & BEASTS','Creatures slain by heroes','{mythology}'),
  ('MORTAL HEROES','Brave mortals of legend','{mythology}'),
  ('THE TROJAN WAR','Kings and warriors at Troy','{mythology}'),
  ('ORACLES & PROPHECIES','Seers and sacred oracle sites','{mythology}'),
  ('THE ILIAD','Events of the wrath of Achilles','{mythology}'),
  ('THE ODYSSEY','The long return from Troy','{mythology}'),
  ('JASON & THE ARGONAUTS','Voyage for the golden prize','{mythology}'),
  ('THE TWELVE LABORS','Labors set by a king','{mythology}'),
  ('THE UNDERWORLD','Realm of the dead','{mythology}'),
  ('TITANS & CREATION','Origin of gods and world','{mythology}'),
  ('THE LABYRINTH','The maze of Crete','{mythology}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='KING OF THE GODS'),'jeopardy',200,'This king of the gods ruled from Mount Olympus','Who is Zeus?',false),
((SELECT id FROM categories WHERE title='KING OF THE GODS'),'jeopardy',400,'This lightning weapon forged by the Cyclopes was the emblem of Zeus','What is a thunderbolt?',false),
((SELECT id FROM categories WHERE title='KING OF THE GODS'),'jeopardy',600,'This queen of the gods was both sister and wife to Zeus','Who is Hera?',false),
((SELECT id FROM categories WHERE title='KING OF THE GODS'),'jeopardy',800,'This Titan father swallowed his children until Zeus overthrew him','Who is Cronus?',false),
((SELECT id FROM categories WHERE title='KING OF THE GODS'),'jeopardy',1000,'This oak grove oracle in Epirus was sacred to Zeus','What is Dodona?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='GODDESSES'),'jeopardy',200,'This goddess of love rose from sea foam','Who is Aphrodite?',false),
((SELECT id FROM categories WHERE title='GODDESSES'),'jeopardy',400,'This goddess of wisdom sprang from the head of Zeus','Who is Athena?',false),
((SELECT id FROM categories WHERE title='GODDESSES'),'jeopardy',600,'Twin of Apollo, huntress with a bow','Who is Artemis?',false),
((SELECT id FROM categories WHERE title='GODDESSES'),'jeopardy',800,'This goddess of grain was mother of Persephone','Who is Demeter?',false),
((SELECT id FROM categories WHERE title='GODDESSES'),'jeopardy',1000,'This goddess of memory was mother of the nine Muses by Zeus','Who is Mnemosyne?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MONSTERS & BEASTS'),'jeopardy',200,'This half bull half man dwelled in the Cretan labyrinth','What is the Minotaur?',false),
((SELECT id FROM categories WHERE title='MONSTERS & BEASTS'),'jeopardy',400,'This Gorgon with serpent hair was slain by Perseus','Who is Medusa?',false),
((SELECT id FROM categories WHERE title='MONSTERS & BEASTS'),'jeopardy',600,'Fifty headed in Hesiod, later three headed hound of Hades','Who is Cerberus?',false),
((SELECT id FROM categories WHERE title='MONSTERS & BEASTS'),'jeopardy',800,'This great lion with invulnerable hide was strangled by Heracles','What is the Nemean lion?',false),
((SELECT id FROM categories WHERE title='MONSTERS & BEASTS'),'jeopardy',1000,'This fire breathing beast part lion part goat was slain by Bellerophon','What is the Chimera?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MORTAL HEROES'),'jeopardy',200,'This Athenian hero slew the Minotaur with help from Ariadne','Who is Theseus?',false),
((SELECT id FROM categories WHERE title='MORTAL HEROES'),'jeopardy',400,'This hero slew Medusa using a mirrored shield','Who is Perseus?',false),
((SELECT id FROM categories WHERE title='MORTAL HEROES'),'jeopardy',600,'This hero tamed Pegasus and slew the Chimera','Who is Bellerophon?',false),
((SELECT id FROM categories WHERE title='MORTAL HEROES'),'jeopardy',800,'This heroine huntress ran with Artemis and outran all suitors','Who is Atalanta?',false),
((SELECT id FROM categories WHERE title='MORTAL HEROES'),'jeopardy',1000,'This Theban hero founded the city of Thebes by sowing dragon teeth','Who is Cadmus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE TROJAN WAR'),'jeopardy',200,'This Spartan queen taken to Troy sparked the war','Who is Helen?',false),
((SELECT id FROM categories WHERE title='THE TROJAN WAR'),'jeopardy',400,'This Trojan prince carried Helen to Troy','Who is Paris?',false),
((SELECT id FROM categories WHERE title='THE TROJAN WAR'),'jeopardy',600,'This king of Mycenae led the Greek host, brother of Menelaus','Who is Agamemnon?',false),
((SELECT id FROM categories WHERE title='THE TROJAN WAR'),'jeopardy',800,'This greatest Greek warrior slew Hector outside Troy','Who is Achilles?',false),
((SELECT id FROM categories WHERE title='THE TROJAN WAR'),'jeopardy',1000,'This smith god forged new armor for Achilles at the plea of Thetis','Who is Hephaestus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ORACLES & PROPHECIES'),'jeopardy',200,'Apollo gives oracles at this sanctuary town','What is Delphi?',false),
((SELECT id FROM categories WHERE title='ORACLES & PROPHECIES'),'jeopardy',400,'At Dodona the will of Zeus was read in the rustling leaves of these sacred trees','What are oak trees?',false),
((SELECT id FROM categories WHERE title='ORACLES & PROPHECIES'),'jeopardy',600,'The priestess at Delphi who delivered Apollo prophecies','Who is the Pythia?',false),
((SELECT id FROM categories WHERE title='ORACLES & PROPHECIES'),'jeopardy',800,'This Lydian king tested the oracles before attacking Persia','Who is Croesus?',false),
((SELECT id FROM categories WHERE title='ORACLES & PROPHECIES'),'jeopardy',1000,'Alexander sought this Siwa oasis oracle to confirm his divine father','Who is Zeus-Ammon?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE ILIAD'),'double',400,'This Homer epic of the wrath of Achilles opens with rage','What is the Iliad?',false),
((SELECT id FROM categories WHERE title='THE ILIAD'),'double',800,'This Trojan son of Priam was slain by Achilles and ransomed','Who is Hector?',false),
((SELECT id FROM categories WHERE title='THE ILIAD'),'double',1200,'This close companion of Achilles died wearing his armor','Who is Patroclus?',false),
((SELECT id FROM categories WHERE title='THE ILIAD'),'double',1600,'This river god fought Achilles in Book 21, also called Xanthus','Who is Scamander?',true),
((SELECT id FROM categories WHERE title='THE ILIAD'),'double',2000,'This Thracian king slain asleep on his first night at Troy in Book 10','Who is Rhesus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE ODYSSEY'),'double',400,'This king of Ithaca took ten years to sail home from Troy','Who is Odysseus?',false),
((SELECT id FROM categories WHERE title='THE ODYSSEY'),'double',800,'This faithful wife of Odysseus wove a shroud by day and unwove by night','Who is Penelope?',false),
((SELECT id FROM categories WHERE title='THE ODYSSEY'),'double',1200,'This Cyclops son of Poseidon was blinded by Odysseus','Who is Polyphemus?',false),
((SELECT id FROM categories WHERE title='THE ODYSSEY'),'double',1600,'This witch of Aeaea turned men of Odysseus into swine','Who is Circe?',false),
((SELECT id FROM categories WHERE title='THE ODYSSEY'),'double',2000,'This Phaeacian princess found shipwrecked Odysseus on the shore','Who is Nausicaa?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='JASON & THE ARGONAUTS'),'double',400,'This golden prize in Colchis was the goal of Jason','What is the Golden Fleece?',false),
((SELECT id FROM categories WHERE title='JASON & THE ARGONAUTS'),'double',800,'This shipwright Argus built the Argo','Who is Argus the builder?',false),
((SELECT id FROM categories WHERE title='JASON & THE ARGONAUTS'),'double',1200,'This Colchian witch helped Jason yoke fire breathing bulls','Who is Medea?',false),
((SELECT id FROM categories WHERE title='JASON & THE ARGONAUTS'),'double',1600,'This uncle of Jason sent him for the Fleece to claim the throne of Iolcus','Who is Pelias?',false),
((SELECT id FROM categories WHERE title='JASON & THE ARGONAUTS'),'double',2000,'Pollux the boxer and Castor the horseman, twin Argonauts','Who are Castor and Pollux?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE TWELVE LABORS'),'double',400,'This Mycenaean king imposed twelve labors upon Heracles','Who is Eurystheus?',false),
((SELECT id FROM categories WHERE title='THE TWELVE LABORS'),'double',800,'Amazon queen Hippolyta belt won by Heracles','What is the belt of Hippolyta?',false),
((SELECT id FROM categories WHERE title='THE TWELVE LABORS'),'double',1200,'Three bodied Geryon cattle seized by Heracles','What are the cattle of Geryon?',true),
((SELECT id FROM categories WHERE title='THE TWELVE LABORS'),'double',1600,'Man eating mares of Thracian Diomedes','What are the mares of Diomedes?',false),
((SELECT id FROM categories WHERE title='THE TWELVE LABORS'),'double',2000,'Golden apples of the Hesperides','What are the apples of the Hesperides?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE UNDERWORLD'),'double',400,'This stern god ruled the dead with Persephone','Who is Hades?',false),
((SELECT id FROM categories WHERE title='THE UNDERWORLD'),'double',800,'River and oath of the Underworld crossed by the dead','What is the Styx?',false),
((SELECT id FROM categories WHERE title='THE UNDERWORLD'),'double',1200,'This Titan holds up the sky, father of Calypso','Who is Atlas?',false),
((SELECT id FROM categories WHERE title='THE UNDERWORLD'),'double',1600,'This son of Zeus and Europa became a judge of the dead','Who is Minos?',false),
((SELECT id FROM categories WHERE title='THE UNDERWORLD'),'double',2000,'This red seeded fruit bound Persephone to Hades when tasted','What is a pomegranate?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TITANS & CREATION'),'double',400,'This earth mother bore the Titans in Hesiod','Who is Gaia?',false),
((SELECT id FROM categories WHERE title='TITANS & CREATION'),'double',800,'This sky father was overthrown by his son Cronus','Who is Uranus?',false),
((SELECT id FROM categories WHERE title='TITANS & CREATION'),'double',1200,'This Titan stole fire for mortals and was chained to a rock','Who is Prometheus?',false),
((SELECT id FROM categories WHERE title='TITANS & CREATION'),'double',1600,'This Titan son of Hyperion drives the chariot of the sun','Who is Helios?',false),
((SELECT id FROM categories WHERE title='TITANS & CREATION'),'double',2000,'This yawning void was first of all in Hesiod creation','What is Chaos?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE LABYRINTH'),'final',0,'This craftsman built wings of wax and feathers to escape Crete with his son Icarus','Who is Daedalus?',false);

INSERT INTO boards (name, description, tags) VALUES
('Greek Mythology','Homer Hesiod and Ovid. Tribunal-verified, no repeated answers.','{mythology}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Greek Mythology');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Greek Mythology'), id, 'jeopardy', pos FROM (VALUES
  ('KING OF THE GODS',0),('GODDESSES',1),('MONSTERS & BEASTS',2),('MORTAL HEROES',3),('THE TROJAN WAR',4),('ORACLES & PROPHECIES',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Greek Mythology'), id, 'double', pos FROM (VALUES
  ('THE ILIAD',0),('THE ODYSSEY',1),('JASON & THE ARGONAUTS',2),('THE TWELVE LABORS',3),('THE UNDERWORLD',4),('TITANS & CREATION',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Greek Mythology'), id, 'final', 0 FROM categories WHERE title='THE LABYRINTH';
