-- Human Body game set. One-shot seed: 13 human-body-tagged categories (12 wired into board + final), 61 clues.
-- Bedrock facts only. No repeated answers in-set. Daily Doubles: 1 single (800/1000), 2 double (1200+).

INSERT INTO categories (title, description, tags) VALUES
  ('BONES', 'Support structure of the body', '{human-body}'),
  ('MUSCLES', 'Tissues that move the body', '{human-body}'),
  ('HEART & BLOOD', 'Pump and circulation', '{human-body}'),
  ('BRAIN & NERVES', 'Control center and signals', '{human-body}'),
  ('LUNGS & BREATHING', 'Oxygen and air', '{human-body}'),
  ('THE SENSES', 'Sight hearing smell and taste', '{human-body}'),
  ('DIGESTION', 'Food breakdown and absorption', '{human-body}'),
  ('THE IMMUNE SYSTEM', 'Defense against germs', '{human-body}'),
  ('DNA & GENETICS', 'Genes and heredity', '{human-body}'),
  ('HORMONES', 'Chemical messengers', '{human-body}'),
  ('SKIN, HAIR & NAILS', 'Outer covering and extras', '{human-body}'),
  ('SLEEP', 'Rest dreams and rhythms', '{human-body}'),
  ('THE HUMAN GENOME', 'Mapping all human DNA', '{human-body}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='BONES'),'jeopardy',200,'Adults have 206 of these hard structures','What are bones?',false),
((SELECT id FROM categories WHERE title='BONES'),'jeopardy',400,'Largest bone in the body found in the thigh','What is the femur?',false),
((SELECT id FROM categories WHERE title='BONES'),'jeopardy',600,'Bony case that protects the brain','What is the skull?',false),
((SELECT id FROM categories WHERE title='BONES'),'jeopardy',800,'Column of vertebrae along the back','What is the spine?',false),
((SELECT id FROM categories WHERE title='BONES'),'jeopardy',1000,'Soft tissue inside bones that makes blood cells','What is bone marrow?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MUSCLES'),'jeopardy',200,'Skeletal smooth and cardiac are the three types of these tissues','What are muscles?',false),
((SELECT id FROM categories WHERE title='MUSCLES'),'jeopardy',400,'Upper arm muscle that bends the elbow','What is the biceps?',false),
((SELECT id FROM categories WHERE title='MUSCLES'),'jeopardy',600,'Largest muscle of the buttocks','What is the gluteus maximus?',false),
((SELECT id FROM categories WHERE title='MUSCLES'),'jeopardy',800,'Group of muscles at the back of the thigh for running','What are the hamstrings?',false),
((SELECT id FROM categories WHERE title='MUSCLES'),'jeopardy',1000,'Tough cords that attach muscle to bone','What are tendons?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HEART & BLOOD'),'jeopardy',200,'Organ that pumps blood through the body','What is the heart?',false),
((SELECT id FROM categories WHERE title='HEART & BLOOD'),'jeopardy',400,'Red fluid that carries oxygen around the body','What is blood?',false),
((SELECT id FROM categories WHERE title='HEART & BLOOD'),'jeopardy',600,'Cells that carry oxygen using hemoglobin','What are red blood cells?',false),
((SELECT id FROM categories WHERE title='HEART & BLOOD'),'jeopardy',800,'Vessels that carry blood away from the heart','What are arteries?',false),
((SELECT id FROM categories WHERE title='HEART & BLOOD'),'jeopardy',1000,'Iron protein in red cells that binds oxygen','What is hemoglobin?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='BRAIN & NERVES'),'jeopardy',200,'Organ inside the skull that controls thought','What is the brain?',false),
((SELECT id FROM categories WHERE title='BRAIN & NERVES'),'jeopardy',400,'Cells that carry nerve signals','What are neurons?',false),
((SELECT id FROM categories WHERE title='BRAIN & NERVES'),'jeopardy',600,'Brain plus spinal cord form this system','What is the central nervous system?',false),
((SELECT id FROM categories WHERE title='BRAIN & NERVES'),'jeopardy',800,'Largest part of the brain for thinking and memory','What is the cerebrum?',false),
((SELECT id FROM categories WHERE title='BRAIN & NERVES'),'jeopardy',1000,'Small hindbrain area that controls balance','What is the cerebellum?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='LUNGS & BREATHING'),'jeopardy',200,'Pair of organs that take in air','What are the lungs?',false),
((SELECT id FROM categories WHERE title='LUNGS & BREATHING'),'jeopardy',400,'Gas breathed in from air to stay alive','What is oxygen?',false),
((SELECT id FROM categories WHERE title='LUNGS & BREATHING'),'jeopardy',600,'Waste gas breathed out of the lungs','What is carbon dioxide?',false),
((SELECT id FROM categories WHERE title='LUNGS & BREATHING'),'jeopardy',800,'Dome muscle under the lungs for breathing','What is the diaphragm?',false),
((SELECT id FROM categories WHERE title='LUNGS & BREATHING'),'jeopardy',1000,'Tiny air sacs in the lungs for gas exchange','What are alveoli?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE SENSES'),'jeopardy',200,'Organs that see light and color','What are the eyes?',false),
((SELECT id FROM categories WHERE title='THE SENSES'),'jeopardy',400,'Organs that hear sound','What are the ears?',false),
((SELECT id FROM categories WHERE title='THE SENSES'),'jeopardy',600,'Sense that detects odors with the nose','What is smell?',false),
((SELECT id FROM categories WHERE title='THE SENSES'),'jeopardy',800,'Organ with taste buds for sweet salty sour and bitter','What is the tongue?',false),
((SELECT id FROM categories WHERE title='THE SENSES'),'jeopardy',1000,'Light sensitive layer at the back of the eye','What is the retina?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DIGESTION'),'double',400,'Cavity where chewing begins','What is the mouth?',false),
((SELECT id FROM categories WHERE title='DIGESTION'),'double',800,'Organ that churns food with acid','What is the stomach?',false),
((SELECT id FROM categories WHERE title='DIGESTION'),'double',1200,'Long coiled organ where most nutrients are absorbed','What is the small intestine?',false),
((SELECT id FROM categories WHERE title='DIGESTION'),'double',1600,'Wider tube where water is absorbed from food waste','What is the large intestine?',true),
((SELECT id FROM categories WHERE title='DIGESTION'),'double',2000,'Greenish fluid from the liver that digests fats','What is bile?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE IMMUNE SYSTEM'),'double',400,'Cells that fight germs in the blood','What are white blood cells?',false),
((SELECT id FROM categories WHERE title='THE IMMUNE SYSTEM'),'double',800,'Proteins that tag germs after infection or vaccine','What are antibodies?',false),
((SELECT id FROM categories WHERE title='THE IMMUNE SYSTEM'),'double',1200,'Bean shaped glands in the neck that filter germs','What are lymph nodes?',false),
((SELECT id FROM categories WHERE title='THE IMMUNE SYSTEM'),'double',1600,'Shots that train the immune system against disease','What are vaccines?',true),
((SELECT id FROM categories WHERE title='THE IMMUNE SYSTEM'),'double',2000,'Organ in the belly that filters blood and fights infection','What is the spleen?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='DNA & GENETICS'),'double',400,'Twisted ladder shape of DNA','What is a double helix?',false),
((SELECT id FROM categories WHERE title='DNA & GENETICS'),'double',800,'Sections of DNA that code for traits','What are genes?',false),
((SELECT id FROM categories WHERE title='DNA & GENETICS'),'double',1200,'Number of chromosomes in each human body cell','What is 46?',false),
((SELECT id FROM categories WHERE title='DNA & GENETICS'),'double',1600,'XX and XY pairs that decide biological sex','What are sex chromosomes?',false),
((SELECT id FROM categories WHERE title='DNA & GENETICS'),'double',2000,'Pair who described DNA structure in 1953','Who are Watson and Crick?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='HORMONES'),'double',400,'Hormone that lowers blood sugar','What is insulin?',false),
((SELECT id FROM categories WHERE title='HORMONES'),'double',800,'Fight or flight hormone from the adrenals','What is adrenaline?',false),
((SELECT id FROM categories WHERE title='HORMONES'),'double',1200,'Neck gland that controls metabolism','What is the thyroid?',false),
((SELECT id FROM categories WHERE title='HORMONES'),'double',1600,'Male hormone made in the testes','What is testosterone?',false),
((SELECT id FROM categories WHERE title='HORMONES'),'double',2000,'Hormone released in childbirth and bonding','What is oxytocin?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SKIN, HAIR & NAILS'),'double',400,'Largest organ of the body','What is the skin?',false),
((SELECT id FROM categories WHERE title='SKIN, HAIR & NAILS'),'double',800,'Pigment that gives skin its color','What is melanin?',false),
((SELECT id FROM categories WHERE title='SKIN, HAIR & NAILS'),'double',1200,'Sweat helps the body control this','What is body temperature?',false),
((SELECT id FROM categories WHERE title='SKIN, HAIR & NAILS'),'double',1600,'Protein that makes up hair and nails','What is keratin?',false),
((SELECT id FROM categories WHERE title='SKIN, HAIR & NAILS'),'double',2000,'Outer layer of the skin','What is the epidermis?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SLEEP'),'double',400,'Rest state that fills about a third of life','What is sleep?',false),
((SELECT id FROM categories WHERE title='SLEEP'),'double',800,'Stories the mind makes during REM','What are dreams?',false),
((SELECT id FROM categories WHERE title='SLEEP'),'double',1200,'Stage with rapid eye movement and most dreaming','What is REM sleep?',false),
((SELECT id FROM categories WHERE title='SLEEP'),'double',1600,'Internal 24 hour clock for sleep and wake','What is the circadian rhythm?',false),
((SELECT id FROM categories WHERE title='SLEEP'),'double',2000,'Disorder of being unable to fall or stay asleep','What is insomnia?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE HUMAN GENOME'),'final',0,'2003 project that completed the first full map of human DNA','What is the Human Genome Project?',false);

INSERT INTO boards (name, description, tags) VALUES ('Human Body', 'Textbook human body from bones to genome. Verified facts.', '{human-body}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Human Body');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Human Body'), id, 'jeopardy', pos FROM (VALUES
  ('BONES',0),
  ('MUSCLES',1),
  ('HEART & BLOOD',2),
  ('BRAIN & NERVES',3),
  ('LUNGS & BREATHING',4),
  ('THE SENSES',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Human Body'), id, 'double', pos FROM (VALUES
  ('DIGESTION',0),
  ('THE IMMUNE SYSTEM',1),
  ('DNA & GENETICS',2),
  ('HORMONES',3),
  ('SKIN, HAIR & NAILS',4),
  ('SLEEP',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Human Body'), id, 'final', pos FROM (VALUES
  ('THE HUMAN GENOME',0)
) AS v(title,pos) JOIN categories c ON c.title=v.title;
