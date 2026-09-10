-- Space game set. One-shot seed: 13 space-tagged categories, 61 clues.
-- Textbook astronomy/spaceflight only. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (MOON 800), 2 double (MARS 1600, APOLLO 1200).

INSERT INTO categories (title, description, tags) VALUES
  ('PLANETS','Rocky and gas worlds orbiting the Sun','{space}'),
  ('THE MOON','Earth natural satellite and lunar science','{space}'),
  ('THE SUN & STARS','Stars fusion and stellar life cycles','{space}'),
  ('ASTRONAUTS','Pioneers of human spaceflight','{space}'),
  ('TELESCOPES','Eyes on the sky in space and on Earth','{space}'),
  ('THE SOLAR SYSTEM','Structure and borders of our system','{space}'),
  ('MARS','The red planet landforms and missions','{space}'),
  ('BLACK HOLES','Gravity traps and famous examples','{space}'),
  ('SPACE STATIONS','Outposts in Earth orbit and beyond','{space}'),
  ('THE APOLLO PROGRAM','NASA Moon landings 1969 to 1972','{space}'),
  ('EXOPLANETS','Worlds beyond the solar system','{space}'),
  ('COMETS & ASTEROIDS','Icy visitors and rocky debris','{space}'),
  ('VOYAGER','Twin probes launched in 1977','{space}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PLANETS'),'jeopardy',200,'The fourth planet from the Sun known as the red planet','What is Mars?',false),
((SELECT id FROM categories WHERE title='PLANETS'),'jeopardy',400,'The largest planet in the solar system with the Great Red Spot','What is Jupiter?',false),
((SELECT id FROM categories WHERE title='PLANETS'),'jeopardy',600,'The planet with the brightest wide rings made mostly of ice','What is Saturn?',false),
((SELECT id FROM categories WHERE title='PLANETS'),'jeopardy',800,'The second planet from the Sun hottest due to a dense carbon dioxide atmosphere','What is Venus?',false),
((SELECT id FROM categories WHERE title='PLANETS'),'jeopardy',1000,'The farthest giant with supersonic winds measured by Voyager 2 in 1989','What is Neptune?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE MOON'),'jeopardy',200,'Earth only natural satellite','What is the Moon?',false),
((SELECT id FROM categories WHERE title='THE MOON'),'jeopardy',400,'The dark basalt plains on the Moon once mistaken for seas','What are lunar maria?',false),
((SELECT id FROM categories WHERE title='THE MOON'),'jeopardy',600,'The 1969 landing plain where Apollo 11 touched down','What is the Sea of Tranquility?',false),
((SELECT id FROM categories WHERE title='THE MOON'),'jeopardy',800,'The 1968 crewed mission that first orbited the Moon','What is Apollo 8?',true),
((SELECT id FROM categories WHERE title='THE MOON'),'jeopardy',1000,'The loose dust and broken rock layer covering the lunar surface','What is regolith?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE SUN & STARS'),'jeopardy',200,'The G type star at the center of the solar system','What is the Sun?',false),
((SELECT id FROM categories WHERE title='THE SUN & STARS'),'jeopardy',400,'The process fusing hydrogen into helium in stellar cores','What is nuclear fusion?',false),
((SELECT id FROM categories WHERE title='THE SUN & STARS'),'jeopardy',600,'The massive stellar explosion that can leave a neutron star or black hole','What is a supernova?',false),
((SELECT id FROM categories WHERE title='THE SUN & STARS'),'jeopardy',800,'The nearest star to the Sun about 4.24 light years away','What is Proxima Centauri?',false),
((SELECT id FROM categories WHERE title='THE SUN & STARS'),'jeopardy',1000,'The chart plotting stellar luminosity against temperature and spectral type','What is the Hertzsprung-Russell diagram?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ASTRONAUTS'),'jeopardy',200,'The commander of Apollo 11 in 1969 first to walk on the Moon','Who is Neil Armstrong?',false),
((SELECT id FROM categories WHERE title='ASTRONAUTS'),'jeopardy',400,'The American who flew Freedom 7 in 1961 as first American in space','Who is Alan Shepard?',false),
((SELECT id FROM categories WHERE title='ASTRONAUTS'),'jeopardy',600,'The Soviet cosmonaut aboard Vostok 6 in 1963 first woman in space','Who is Valentina Tereshkova?',false),
((SELECT id FROM categories WHERE title='ASTRONAUTS'),'jeopardy',800,'The American aboard Challenger in 1983 first American woman in space','Who is Sally Ride?',false),
((SELECT id FROM categories WHERE title='ASTRONAUTS'),'jeopardy',1000,'The NASA astronaut who spent 340 days on the ISS in 2015 to 2016','Who is Scott Kelly?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='TELESCOPES'),'jeopardy',200,'The NASA space telescope launched in 1990 operating in low Earth orbit','What is the Hubble Space Telescope?',false),
((SELECT id FROM categories WHERE title='TELESCOPES'),'jeopardy',400,'The infrared space telescope launched in 2021 stationed near Lagrange point L2','What is the James Webb Space Telescope?',false),
((SELECT id FROM categories WHERE title='TELESCOPES'),'jeopardy',600,'The Italian astronomer who first turned a telescope to the Moon and Jupiter in 1609 to 1610','Who is Galileo Galilei?',false),
((SELECT id FROM categories WHERE title='TELESCOPES'),'jeopardy',800,'The Hawaii summit site of the twin 10 meter Keck telescopes','What is Mauna Kea?',false),
((SELECT id FROM categories WHERE title='TELESCOPES'),'jeopardy',1000,'The California observatory with the 200 inch Hale reflector dedicated in 1948','What is Palomar Observatory?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE SOLAR SYSTEM'),'jeopardy',200,'This force keeps the planets in orbit around the Sun','What is gravity?',false),
((SELECT id FROM categories WHERE title='THE SOLAR SYSTEM'),'jeopardy',400,'The dwarf planet reclassified by the IAU in 2006','What is Pluto?',false),
((SELECT id FROM categories WHERE title='THE SOLAR SYSTEM'),'jeopardy',600,'The donut shaped region beyond Neptune holding Pluto and many icy bodies','What is the Kuiper Belt?',false),
((SELECT id FROM categories WHERE title='THE SOLAR SYSTEM'),'jeopardy',800,'The distant spherical shell thought to source long period comets','What is the Oort Cloud?',false),
((SELECT id FROM categories WHERE title='THE SOLAR SYSTEM'),'jeopardy',1000,'The boundary where the solar wind stops crossed by Voyager 1 in 2012','What is the heliopause?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MARS'),'double',400,'The shield volcano on Mars tallest in the solar system','What is Olympus Mons?',false),
((SELECT id FROM categories WHERE title='MARS'),'double',800,'The NASA rover that landed in Jezero Crater in 2021','What is Perseverance?',false),
((SELECT id FROM categories WHERE title='MARS'),'double',1200,'The vast canyon system over 2500 miles long across the Martian equator','What is Valles Marineris?',false),
((SELECT id FROM categories WHERE title='MARS'),'double',1600,'The two small moons of Mars discovered in 1877','What are Phobos and Deimos?',true),
((SELECT id FROM categories WHERE title='MARS'),'double',2000,'The twin NASA landers that first operated on Mars in 1976','What are Viking 1 and Viking 2?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='BLACK HOLES'),'double',400,'The boundary around a black hole where escape velocity exceeds light speed','What is the event horizon?',false),
((SELECT id FROM categories WHERE title='BLACK HOLES'),'double',800,'The giant elliptical galaxy with the black hole imaged in 2019','What is M87?',false),
((SELECT id FROM categories WHERE title='BLACK HOLES'),'double',1200,'This glowing ring of infalling matter surrounds some black holes','What is an accretion disk?',false),
((SELECT id FROM categories WHERE title='BLACK HOLES'),'double',1600,'The supermassive black hole at the center of the Milky Way imaged in 2022','What is Sagittarius A-star?',false),
((SELECT id FROM categories WHERE title='BLACK HOLES'),'double',2000,'The Cygnus X-ray source identified in 1971 as the first widely accepted black hole','What is Cygnus X-1?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='SPACE STATIONS'),'double',400,'The multinational station with first module launched in 1998 still crewed through 2024','What is the International Space Station?',false),
((SELECT id FROM categories WHERE title='SPACE STATIONS'),'double',800,'The first US space station launched in 1973','What is Skylab?',false),
((SELECT id FROM categories WHERE title='SPACE STATIONS'),'double',1200,'The Soviet station occupied from 1986 to 2001','What is Mir?',false),
((SELECT id FROM categories WHERE title='SPACE STATIONS'),'double',1600,'The first space station launched by the Soviet Union in 1971','What is Salyut 1?',false),
((SELECT id FROM categories WHERE title='SPACE STATIONS'),'double',2000,'The cosmonaut who logged 437 days aboard Mir ending in 1995','Who is Valeri Polyakov?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE APOLLO PROGRAM'),'double',400,'The 1969 mission with the first crewed Moon landing','What is Apollo 11?',false),
((SELECT id FROM categories WHERE title='THE APOLLO PROGRAM'),'double',800,'The 1970 Moon mission aborted after an oxygen tank explosion','What is Apollo 13?',false),
((SELECT id FROM categories WHERE title='THE APOLLO PROGRAM'),'double',1200,'The giant rocket that launched all crewed Apollo Moon missions','What is the Saturn V?',true),
((SELECT id FROM categories WHERE title='THE APOLLO PROGRAM'),'double',1600,'The name of the Apollo 11 lunar module that landed in 1969','What is Eagle?',false),
((SELECT id FROM categories WHERE title='THE APOLLO PROGRAM'),'double',2000,'The final Apollo Moon landing mission flown in 1972','What is Apollo 17?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='EXOPLANETS'),'double',400,'The detection method watching starlight dip as a planet passes in front','What is the transit method?',false),
((SELECT id FROM categories WHERE title='EXOPLANETS'),'double',800,'The NASA mission launched in 2009 that found thousands of exoplanets','What is the Kepler Space Telescope?',false),
((SELECT id FROM categories WHERE title='EXOPLANETS'),'double',1200,'The rapidly spinning stellar remnant orbited by the first confirmed exoplanets in 1992','What is a pulsar?',false),
((SELECT id FROM categories WHERE title='EXOPLANETS'),'double',1600,'The orbital region where temperatures allow liquid water on a rocky planet','What is the habitable zone?',false),
((SELECT id FROM categories WHERE title='EXOPLANETS'),'double',2000,'The star 51 Pegasi planet found in 1995 first around a Sun like star','What is 51 Pegasi b?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='COMETS & ASTEROIDS'),'double',400,'The famous comet seen in 1986 due back in 2061','What is Halleys Comet?',false),
((SELECT id FROM categories WHERE title='COMETS & ASTEROIDS'),'double',800,'This bright comet of 1997 was visible for months to the naked eye','What is Hale-Bopp?',false),
((SELECT id FROM categories WHERE title='COMETS & ASTEROIDS'),'double',1200,'The glowing gas cloud around a comet nucleus near the Sun','What is the coma?',false),
((SELECT id FROM categories WHERE title='COMETS & ASTEROIDS'),'double',1600,'The August meteor shower from Comet Swift-Tuttle','What are the Perseids?',false),
((SELECT id FROM categories WHERE title='COMETS & ASTEROIDS'),'double',2000,'The first interstellar object detected passing through in 2017','What is Oumuamua?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='VOYAGER'),'final',0,'The twin NASA probes launched in 1977 carrying the Golden Record','What are Voyager 1 and Voyager 2?',false);

INSERT INTO boards (name, description, tags) VALUES
('Outer Space','Planets astronauts and deep space. Textbook facts, tribunal-verified.','{space}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Outer Space');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Outer Space'), id, 'jeopardy', pos FROM (VALUES
  ('PLANETS',0),('THE MOON',1),('THE SUN & STARS',2),('ASTRONAUTS',3),('TELESCOPES',4),('THE SOLAR SYSTEM',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Outer Space'), id, 'double', pos FROM (VALUES
  ('MARS',0),('BLACK HOLES',1),('SPACE STATIONS',2),('THE APOLLO PROGRAM',3),('EXOPLANETS',4),('COMETS & ASTEROIDS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Outer Space'), id, 'final', 0 FROM categories WHERE title='VOYAGER';
