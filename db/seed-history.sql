-- World History game set. One-shot seed: 13 history-tagged categories, 61 clues.
-- Bedrock textbook facts with dates. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (EGYPT 1000), 2 double (CIVIL WAR 1600, COLD WAR 1600).

INSERT INTO categories (title, description, tags) VALUES
  ('ANCIENT EGYPT','Pharaohs and monuments along the Nile','{history}'),
  ('ANCIENT ROME','Emperors and empire from Republic to fall','{history}'),
  ('THE MIDDLE AGES','Castles and kingdoms from 500 to 1500','{history}'),
  ('EXPLORERS','Voyages that mapped the world oceans','{history}'),
  ('THE AMERICAN REVOLUTION','Rebellion that birthed the United States','{history}'),
  ('WORLD WAR II','Global conflict from 1939 to 1945','{history}'),
  ('ANCIENT GREECE','City states and thinkers of Hellas','{history}'),
  ('THE RENAISSANCE','Rebirth of art and learning in Europe','{history}'),
  ('THE U.S. CIVIL WAR','North versus South from 1861 to 1865','{history}'),
  ('WORLD WAR I','The Great War from 1914 to 1918','{history}'),
  ('THE COLD WAR','Standoff between superpowers after 1945','{history}'),
  ('CIVIL RIGHTS','Struggle for equality in America','{history}'),
  ('INDEPENDENCE','Nations breaking free through history','{history}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ANCIENT EGYPT'),'jeopardy',200,'This writing material made from river reeds was used by ancient Egyptian scribes','What is papyrus?',false),
((SELECT id FROM categories WHERE title='ANCIENT EGYPT'),'jeopardy',400,'The largest pyramid at Giza built for Pharaoh Khufu around 2560 BC','What is the Great Pyramid of Giza?',false),
((SELECT id FROM categories WHERE title='ANCIENT EGYPT'),'jeopardy',600,'This picture writing of ancient Egypt deciphered with the Rosetta Stone found in 1799','What is hieroglyphic writing?',false),
((SELECT id FROM categories WHERE title='ANCIENT EGYPT'),'jeopardy',800,'This pharaohs intact tomb was found by Howard Carter in 1922 in the Valley of the Kings','Who is Tutankhamun?',false),
((SELECT id FROM categories WHERE title='ANCIENT EGYPT'),'jeopardy',1000,'This female pharaoh who ruled from about 1479 to 1458 BC and built a mortuary temple at Deir el-Bahari','Who is Hatshepsut?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ANCIENT ROME'),'jeopardy',200,'This Roman dictator assassinated on the Ides of March in 44 BC','Who is Julius Caesar?',false),
((SELECT id FROM categories WHERE title='ANCIENT ROME'),'jeopardy',400,'This stone amphitheater in Rome opened in 80 AD for gladiator contests','What is the Colosseum?',false),
((SELECT id FROM categories WHERE title='ANCIENT ROME'),'jeopardy',600,'This language spoken in Rome by 100 BC and root of French Spanish and Italian','What is Latin?',false),
((SELECT id FROM categories WHERE title='ANCIENT ROME'),'jeopardy',800,'This first Roman emperor ruling from 27 BC to 14 AD and adopted heir of Julius Caesar','Who is Augustus?',false),
((SELECT id FROM categories WHERE title='ANCIENT ROME'),'jeopardy',1000,'This emperor who issued the Edict of Milan in 313 AD and moved the capital to Constantinople in 330 AD','Who is Constantine the Great?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE MIDDLE AGES'),'jeopardy',200,'This capital of the Byzantine Empire fell to the Ottomans in 1453','What is Constantinople?',false),
((SELECT id FROM categories WHERE title='THE MIDDLE AGES'),'jeopardy',400,'This plague that killed millions in Europe from 1347 to 1351','What is the Black Death?',false),
((SELECT id FROM categories WHERE title='THE MIDDLE AGES'),'jeopardy',600,'This Frankish king crowned emperor in Rome on Christmas Day in 800 AD','Who is Charlemagne?',false),
((SELECT id FROM categories WHERE title='THE MIDDLE AGES'),'jeopardy',800,'This Norman duke beat Harold Godwinson at Hastings in 1066','Who is William the Conqueror?',false),
((SELECT id FROM categories WHERE title='THE MIDDLE AGES'),'jeopardy',1000,'This charter of rights forced on King John at Runnymede in 1215','What is the Magna Carta?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='EXPLORERS'),'jeopardy',200,'This Genoese sailor for Spain who reached the Americas in 1492','Who is Christopher Columbus?',false),
((SELECT id FROM categories WHERE title='EXPLORERS'),'jeopardy',400,'This expedition fleet left in 1519 and completed the first circumnavigation in 1522 under Elcano','What is the Magellan expedition?',false),
((SELECT id FROM categories WHERE title='EXPLORERS'),'jeopardy',600,'This Venetian traveler who reached China in 1275 and served Kublai Khan','Who is Marco Polo?',false),
((SELECT id FROM categories WHERE title='EXPLORERS'),'jeopardy',800,'This Portuguese explorer who reached India by sea in 1498','Who is Vasco da Gama?',false),
((SELECT id FROM categories WHERE title='EXPLORERS'),'jeopardy',1000,'This Spanish conquistador who conquered the Aztecs from 1519 to 1521','Who is Hernan Cortes?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE AMERICAN REVOLUTION'),'jeopardy',200,'This commander of the Continental Army from 1775 who became president in 1789','Who is George Washington?',false),
((SELECT id FROM categories WHERE title='THE AMERICAN REVOLUTION'),'jeopardy',400,'This document adopted July 4 1776 declaring colonies free from Britain','What is the Declaration of Independence?',false),
((SELECT id FROM categories WHERE title='THE AMERICAN REVOLUTION'),'jeopardy',600,'This 1773 protest in Boston Harbor against British tea taxes','What is the Boston Tea Party?',false),
((SELECT id FROM categories WHERE title='THE AMERICAN REVOLUTION'),'jeopardy',800,'This Pennsylvania winter camp of Washingtons army from 1777 to 1778','What is Valley Forge?',false),
((SELECT id FROM categories WHERE title='THE AMERICAN REVOLUTION'),'jeopardy',1000,'This 1777 battle in New York that brought French aid to the Americans','What is the Battle of Saratoga?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WORLD WAR II'),'jeopardy',200,'This German dictator who invaded Poland on September 1 1939','Who is Adolf Hitler?',false),
((SELECT id FROM categories WHERE title='WORLD WAR II'),'jeopardy',400,'This Hawaiian naval base attacked by Japan on December 7 1941','What is Pearl Harbor?',false),
((SELECT id FROM categories WHERE title='WORLD WAR II'),'jeopardy',600,'This June 6 1944 Allied invasion of Normandy in France','What is D-Day?',false),
((SELECT id FROM categories WHERE title='WORLD WAR II'),'jeopardy',800,'This secret United States project begun in 1942 that built the atomic bomb','What is the Manhattan Project?',false),
((SELECT id FROM categories WHERE title='WORLD WAR II'),'jeopardy',1000,'This 1942 to 1943 battle in the Soviet Union that stopped Germany in the east','What is the Battle of Stalingrad?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ANCIENT GREECE'),'double',400,'This city state center of democracy in the 5th century BC','What is Athens?',false),
((SELECT id FROM categories WHERE title='ANCIENT GREECE'),'double',800,'This militaristic city state that defeated Athens in 404 BC ending the Peloponnesian War','What is Sparta?',false),
((SELECT id FROM categories WHERE title='ANCIENT GREECE'),'double',1200,'This Macedonian king who conquered Persia from 334 to 323 BC and died in 323 BC','Who is Alexander the Great?',false),
((SELECT id FROM categories WHERE title='ANCIENT GREECE'),'double',1600,'This Athenian teacher of Plato tried and executed in 399 BC','Who is Socrates?',false),
((SELECT id FROM categories WHERE title='ANCIENT GREECE'),'double',2000,'This temple to Athena on the Acropolis completed in 432 BC','What is the Parthenon?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE RENAISSANCE'),'double',400,'Leonardos Mona Lisa painted c.1503','Who is Leonardo da Vinci?',false),
((SELECT id FROM categories WHERE title='THE RENAISSANCE'),'double',800,'This artist who painted the Sistine Chapel ceiling from 1508 to 1512','Who is Michelangelo?',false),
((SELECT id FROM categories WHERE title='THE RENAISSANCE'),'double',1200,'This German who developed movable type around 1440 with a Bible around 1455','Who is Johannes Gutenberg?',false),
((SELECT id FROM categories WHERE title='THE RENAISSANCE'),'double',1600,'This English playwright who wrote Hamlet around 1600 and died in 1616','Who is William Shakespeare?',false),
((SELECT id FROM categories WHERE title='THE RENAISSANCE'),'double',2000,'This Italian astronomer tried in 1633 for supporting the sun centered theory','Who is Galileo Galilei?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE U.S. CIVIL WAR'),'double',400,'This president elected in 1860 who led the Union during the war','Who is Abraham Lincoln?',false),
((SELECT id FROM categories WHERE title='THE U.S. CIVIL WAR'),'double',800,'This proclamation effective January 1 1863 freeing slaves in rebel states','What is the Emancipation Proclamation?',false),
((SELECT id FROM categories WHERE title='THE U.S. CIVIL WAR'),'double',1200,'This Pennsylvania battle of July 1 to 3 1863 the bloodiest of the war','What is Gettysburg?',false),
((SELECT id FROM categories WHERE title='THE U.S. CIVIL WAR'),'double',1600,'This Union general who took Vicksburg in 1863 and led all Union armies from 1864','Who is Ulysses S. Grant?',true),
((SELECT id FROM categories WHERE title='THE U.S. CIVIL WAR'),'double',2000,'This Confederate general died of friendly fire wounds after Chancellorsville in 1863','Who is Stonewall Jackson?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WORLD WAR I'),'double',400,'This Austrian archduke assassinated in Sarajevo on June 28 1914','Who is Archduke Franz Ferdinand?',false),
((SELECT id FROM categories WHERE title='WORLD WAR I'),'double',800,'This British liner sunk by a German submarine on May 7 1915','What is the Lusitania?',false),
((SELECT id FROM categories WHERE title='WORLD WAR I'),'double',1200,'This 1919 treaty signed in France that ended war with Germany','What is the Treaty of Versailles?',false),
((SELECT id FROM categories WHERE title='WORLD WAR I'),'double',1600,'This 1917 telegram from Germany to Mexico pushed America toward war','What is the Zimmermann Telegram?',false),
((SELECT id FROM categories WHERE title='WORLD WAR I'),'double',2000,'This United States president who proposed the Fourteen Points in January 1918','Who is Woodrow Wilson?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE COLD WAR'),'double',400,'This Berlin barrier built in 1961 and opened in 1989','What is the Berlin Wall?',false),
((SELECT id FROM categories WHERE title='THE COLD WAR'),'double',800,'This Western military alliance founded in Washington in 1949','What is NATO?',false),
((SELECT id FROM categories WHERE title='THE COLD WAR'),'double',1200,'This 1962 standoff over Soviet missiles placed in Cuba','What is the Cuban Missile Crisis?',false),
((SELECT id FROM categories WHERE title='THE COLD WAR'),'double',1600,'This Soviet leader from 1985 to 1991 known for glasnost and perestroika','Who is Mikhail Gorbachev?',true),
((SELECT id FROM categories WHERE title='THE COLD WAR'),'double',2000,'This Asian war from 1950 to 1953 between North and South with United States and China involved','What is the Korean War?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='CIVIL RIGHTS'),'double',400,'This minister who gave the I Have a Dream speech in Washington in 1963','Who is Martin Luther King Jr.?',false),
((SELECT id FROM categories WHERE title='CIVIL RIGHTS'),'double',800,'This woman arrested in Montgomery on December 1 1955 for refusing to give up a bus seat','Who is Rosa Parks?',false),
((SELECT id FROM categories WHERE title='CIVIL RIGHTS'),'double',1200,'This 1963 Birmingham protest used children marching, facing fire hoses','What is the Children''s Crusade?',false),
((SELECT id FROM categories WHERE title='CIVIL RIGHTS'),'double',1600,'This 1954 Supreme Court case that ruled segregated schools unconstitutional','What is Brown v. Board of Education?',false),
((SELECT id FROM categories WHERE title='CIVIL RIGHTS'),'double',2000,'This 1965 federal law signed August 6 1965 banning racial discrimination in voting','What is the Voting Rights Act of 1965?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='INDEPENDENCE'),'final',0,'This West African nation led by Kwame Nkrumah gained independence from Britain on March 6 1957','What is Ghana?',false);

INSERT INTO boards (name, description, tags) VALUES
('World History','Bedrock dates and events from Egypt to civil rights. Tribunal-verified.','{history}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='World History');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='World History'), id, 'jeopardy', pos FROM (VALUES
  ('ANCIENT EGYPT',0),('ANCIENT ROME',1),('THE MIDDLE AGES',2),('EXPLORERS',3),('THE AMERICAN REVOLUTION',4),('WORLD WAR II',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='World History'), id, 'double', pos FROM (VALUES
  ('ANCIENT GREECE',0),('THE RENAISSANCE',1),('THE U.S. CIVIL WAR',2),('WORLD WAR I',3),('THE COLD WAR',4),('CIVIL RIGHTS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='World History'), id, 'final', 0 FROM categories WHERE title='INDEPENDENCE';
