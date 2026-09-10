-- Dinosaurs game set. One-shot seed: 13 dinosaurs-tagged categories, 61 clues.
-- Established paleontology only. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (TRICERATOPS 1000), 2 double (JURASSIC 1600, EXTINCTION 1200).

INSERT INTO categories (title, description, tags) VALUES
  ('TYRANNOSAURUS REX','The Late Cretaceous tyrant king','{dinosaurs}'),
  ('LONG NECKS','Giant sauropods of Jurassic and Cretaceous','{dinosaurs}'),
  ('RAPTORS','Sickle clawed hunters of the Cretaceous','{dinosaurs}'),
  ('FOSSILS','How ancient life is preserved in rock','{dinosaurs}'),
  ('TRICERATOPS','Horned plant eaters of Late Cretaceous','{dinosaurs}'),
  ('FLYERS & SWIMMERS','Mesozoic reptiles that were not dinosaurs','{dinosaurs}'),
  ('THE JURASSIC','Middle age of dinosaurs 201 to 145 million years','{dinosaurs}'),
  ('THE CRETACEOUS','Final dinosaur age 145 to 66 million years','{dinosaurs}'),
  ('PALEONTOLOGISTS','Fossil hunters of Jurassic and Cretaceous beds','{dinosaurs}'),
  ('EXTINCTION','End of the Cretaceous 66 million years ago','{dinosaurs}'),
  ('ARMORED DINOS','Tank like plant eaters of Jurassic and Cretaceous','{dinosaurs}'),
  ('HORNS & CRESTS','Display structures of Cretaceous plant eaters','{dinosaurs}'),
  ('MARY ANNING','Lyme Regis fossil pioneer','{dinosaurs}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TYRANNOSAURUS REX'),'jeopardy',200,'This Late Cretaceous tyrant whose name means tyrant lizard king reached 12 meters','What is Tyrannosaurus rex?',false),
((SELECT id FROM categories WHERE title='TYRANNOSAURUS REX'),'jeopardy',400,'Continent of T. rex, western Laramidia','What is North America?',false),
((SELECT id FROM categories WHERE title='TYRANNOSAURUS REX'),'jeopardy',600,'T. rex massive serrated crushing teeth up to 30 centimeters with root','What are T. rex teeth?',false),
((SELECT id FROM categories WHERE title='TYRANNOSAURUS REX'),'jeopardy',800,'This Late Cretaceous duck billed plant eater shared floodplains with T. rex','What is Edmontosaurus?',false),
((SELECT id FROM categories WHERE title='TYRANNOSAURUS REX'),'jeopardy',1000,'Maastrichtian formation in Montana and the Dakotas and Wyoming yielding T. rex 68 to 66 million years ago','What is Hell Creek Formation?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='LONG NECKS'),'jeopardy',200,'These long necked Mesozoic plant eaters with pillar legs are called lizard footed','What are sauropods?',false),
((SELECT id FROM categories WHERE title='LONG NECKS'),'jeopardy',400,'This Late Jurassic sauropod from Colorado had a whip tail and peg teeth','What is Apatosaurus?',false),
((SELECT id FROM categories WHERE title='LONG NECKS'),'jeopardy',600,'This Late Jurassic sauropod named for double beams under its tail','What is Diplodocus?',false),
((SELECT id FROM categories WHERE title='LONG NECKS'),'jeopardy',800,'This Late Jurassic sauropod had front legs longer than hind legs and a high neck','What is Brachiosaurus?',false),
((SELECT id FROM categories WHERE title='LONG NECKS'),'jeopardy',1000,'Polished stones hypothesized, though debated, as sauropod digestive aids','What are gastroliths?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='RAPTORS'),'jeopardy',200,'This 1993 film with a Cretaceous park kitchen scene made raptors famous','What is Jurassic Park?',false),
((SELECT id FROM categories WHERE title='RAPTORS'),'jeopardy',400,'This small Late Cretaceous Mongolian hunter name means swift thief','What is Velociraptor?',false),
((SELECT id FROM categories WHERE title='RAPTORS'),'jeopardy',600,'This large Early Cretaceous Utah hunter was found in Cedar Mountain rocks','What is Utahraptor?',false),
((SELECT id FROM categories WHERE title='RAPTORS'),'jeopardy',800,'This enlarged sickle shaped toe claw made dromaeosaurs feared pack hunters','What is a killing claw?',false),
((SELECT id FROM categories WHERE title='RAPTORS'),'jeopardy',1000,'This Late Cretaceous desert unit in Mongolia preserves Velociraptor in sandstone','What is Djadochta Formation?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FOSSILS'),'jeopardy',200,'These preserved remains or traces of Mesozoic life are found in sedimentary rock','What are fossils?',false),
((SELECT id FROM categories WHERE title='FOSSILS'),'jeopardy',400,'This layered sedimentary rock of Jurassic and Cretaceous rivers preserves many dinosaurs','What is sandstone?',false),
((SELECT id FROM categories WHERE title='FOSSILS'),'jeopardy',600,'These fossilized Late Cretaceous droppings reveal diet through plant fragments','What are coprolites?',false),
((SELECT id FROM categories WHERE title='FOSSILS'),'jeopardy',800,'These Mesozoic footprints and trackways are studied as trace evidence not bone','What are trace fossils?',false),
((SELECT id FROM categories WHERE title='FOSSILS'),'jeopardy',1000,'This glassy mineral replaced Late Jurassic bone during permineralization','What is silica?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TRICERATOPS'),'jeopardy',200,'This count of large horns on the face of Late Cretaceous Triceratops','What is three?',false),
((SELECT id FROM categories WHERE title='TRICERATOPS'),'jeopardy',400,'This bony neck shield behind the head of Late Cretaceous Triceratops','What is a frill?',false),
((SELECT id FROM categories WHERE title='TRICERATOPS'),'jeopardy',600,'This plant eating diet term for Late Cretaceous Triceratops feeding on low plants','What is a herbivore?',false),
((SELECT id FROM categories WHERE title='TRICERATOPS'),'jeopardy',800,'This northern plains state where Late Cretaceous Triceratops is the state fossil','What is South Dakota?',false),
((SELECT id FROM categories WHERE title='TRICERATOPS'),'jeopardy',1000,'This Late Cretaceous horned dinosaur from Alberta had spikes around its frill','What is Styracosaurus?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FLYERS & SWIMMERS'),'jeopardy',200,'These winged Mesozoic reptiles of Jurassic and Cretaceous skies were not dinosaurs','What are pterosaurs?',false),
((SELECT id FROM categories WHERE title='FLYERS & SWIMMERS'),'jeopardy',400,'These long necked Mesozoic marine reptiles with flippers were not dinosaurs','What are plesiosaurs?',false),
((SELECT id FROM categories WHERE title='FLYERS & SWIMMERS'),'jeopardy',600,'This Late Cretaceous Texas pterosaur had an 11 meter wingspan among largest flyers','What is Quetzalcoatlus?',false),
((SELECT id FROM categories WHERE title='FLYERS & SWIMMERS'),'jeopardy',800,'This crested Late Cretaceous pterosaur ruled the Kansas chalk seas skies','What is Pteranodon?',false),
((SELECT id FROM categories WHERE title='FLYERS & SWIMMERS'),'jeopardy',1000,'This Late Jurassic Solnhofen pterosaur was among first flyers described','What is Pterodactylus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE JURASSIC'),'double',400,'This Mesozoic period between Triassic and Cretaceous named for European mountains','What is the Jurassic?',false),
((SELECT id FROM categories WHERE title='THE JURASSIC'),'double',800,'This Late Jurassic Colorado predator with brow horns hunted sauropods','What is Allosaurus?',false),
((SELECT id FROM categories WHERE title='THE JURASSIC'),'double',1200,'This Late Jurassic plated plant eater had spikes on its tail','What is Stegosaurus?',false),
((SELECT id FROM categories WHERE title='THE JURASSIC'),'double',1600,'This Late Jurassic rock unit in Utah and Colorado holds Allosaurus and Diplodocus','What is Morrison Formation?',true),
((SELECT id FROM categories WHERE title='THE JURASSIC'),'double',2000,'This large Late Jurassic Portuguese predator hunted in floodplains','What is Torvosaurus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE CRETACEOUS'),'double',400,'This final Mesozoic period ending 66 million years ago held T. rex and Triceratops','What is the Cretaceous?',false),
((SELECT id FROM categories WHERE title='THE CRETACEOUS'),'double',800,'This Late Cretaceous duck billed dinosaur had a long hollow head crest','What is Parasaurolophus?',false),
((SELECT id FROM categories WHERE title='THE CRETACEOUS'),'double',1200,'This Late Cretaceous dome headed plant eater had a thick skull roof','What is Pachycephalosaurus?',false),
((SELECT id FROM categories WHERE title='THE CRETACEOUS'),'double',1600,'This giant Late Cretaceous African fish eater had a tall back sail','What is Spinosaurus?',false),
((SELECT id FROM categories WHERE title='THE CRETACEOUS'),'double',2000,'This small Late Cretaceous Montana horned plant eater had a short frill','What is Leptoceratops?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PALEONTOLOGISTS'),'double',400,'This American rival of Cope named Triceratops from Late Cretaceous beds','Who is Othniel Charles Marsh?',false),
((SELECT id FROM categories WHERE title='PALEONTOLOGISTS'),'double',800,'This rival described Camarasaurus from Garden Park Colorado Morrison beds','Who is Edward Drinker Cope?',false),
((SELECT id FROM categories WHERE title='PALEONTOLOGISTS'),'double',1200,'This English naturalist coined the word dinosaur in 1842','Who is Richard Owen?',false),
((SELECT id FROM categories WHERE title='PALEONTOLOGISTS'),'double',1600,'This Yale scholar described Early Cretaceous Deinonychus and tied birds to dinosaurs','Who is John Ostrom?',false),
((SELECT id FROM categories WHERE title='PALEONTOLOGISTS'),'double',2000,'This AMNH scientist named Velociraptor from the Mongolia expedition led by Roy Chapman Andrews','Who is Henry Fairfield Osborn?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='EXTINCTION'),'double',400,'This mass die off 66 million years ago ended all non avian dinosaurs','What is the Cretaceous Paleogene extinction?',false),
((SELECT id FROM categories WHERE title='EXTINCTION'),'double',800,'This buried impact crater in Mexico dates to the end Cretaceous 66 million years ago','What is Chicxulub crater?',false),
((SELECT id FROM categories WHERE title='EXTINCTION'),'double',1200,'This rare metal layer marks the end Cretaceous boundary worldwide','What is iridium?',true),
((SELECT id FROM categories WHERE title='EXTINCTION'),'double',1600,'These feathered living dinosaurs survived the end Cretaceous extinction','What are birds?',false),
((SELECT id FROM categories WHERE title='EXTINCTION'),'double',2000,'This dark cold spell after the end Cretaceous impact killed plants worldwide','What is impact winter?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ARMORED DINOS'),'double',400,'Only the ankylosaurine branch of these tank like plant eaters had tail clubs; nodosaurids lacked them','What are ankylosaurine ankylosaurs?',false),
((SELECT id FROM categories WHERE title='ARMORED DINOS'),'double',800,'This Late Cretaceous Montana armored giant had a massive tail club','What is Ankylosaurus?',false),
((SELECT id FROM categories WHERE title='ARMORED DINOS'),'double',1200,'Spined nodosaur of the Cloverly beds of Wyoming and Montana','What is Sauropelta?',false),
((SELECT id FROM categories WHERE title='ARMORED DINOS'),'double',1600,'These bony skin plates armored Jurassic and Cretaceous ankylosaurs','What are osteoderms?',false),
((SELECT id FROM categories WHERE title='ARMORED DINOS'),'double',2000,'This Early Jurassic English plant eater was an early armored form','What is Scelidosaurus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HORNS & CRESTS'),'double',400,'These horn faced Late Cretaceous plant eaters include Triceratops','What are ceratopsians?',false),
((SELECT id FROM categories WHERE title='HORNS & CRESTS'),'double',800,'This Late Cretaceous Alberta duckbill had a solid rounded head crest','What is Saurolophus?',false),
((SELECT id FROM categories WHERE title='HORNS & CRESTS'),'double',1200,'This Late Cretaceous Utah horned dinosaur had many frill horns','What is Kosmoceratops?',false),
((SELECT id FROM categories WHERE title='HORNS & CRESTS'),'double',1600,'This dome headed Alberta plant eater is actually a pachycephalosaur, not a horned dinosaur','What is Stegoceras?',false),
((SELECT id FROM categories WHERE title='HORNS & CRESTS'),'double',2000,'This Late Cretaceous Utah horned dinosaur had paired brow horns','What is Diabloceratops?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MARY ANNING'),'final',0,'This English Lyme Regis hunter found Jurassic ichthyosaur and plesiosaur skeletons','Who is Mary Anning?',false);

INSERT INTO boards (name, description, tags) VALUES
('Dinosaurs','Established paleontology through the Mesozoic. Tribunal-verified.','{dinosaurs}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Dinosaurs');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Dinosaurs'), id, 'jeopardy', pos FROM (VALUES
  ('TYRANNOSAURUS REX',0),('LONG NECKS',1),('RAPTORS',2),('FOSSILS',3),('TRICERATOPS',4),('FLYERS & SWIMMERS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Dinosaurs'), id, 'double', pos FROM (VALUES
  ('THE JURASSIC',0),('THE CRETACEOUS',1),('PALEONTOLOGISTS',2),('EXTINCTION',3),('ARMORED DINOS',4),('HORNS & CRESTS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Dinosaurs'), id, 'final', 0 FROM categories WHERE title='MARY ANNING';
