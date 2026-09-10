-- Presidents game set. One-shot seed: 13 presidents-tagged categories (12 wired into board + final), 61 clues.
-- Bedrock facts only. No repeated answers in-set. Daily Doubles: 1 single (800/1000), 2 double (1200+).

INSERT INTO categories (title, description, tags) VALUES
  ('WASHINGTON', 'The first president and his life', '{presidents}'),
  ('LINCOLN', 'The 16th president and Civil War', '{presidents}'),
  ('THE WHITE HOUSE', 'Home of the presidents', '{presidents}'),
  ('ELECTIONS', 'Votes terms and amendments', '{presidents}'),
  ('FIRST LADIES', 'Wives of the presidents', '{presidents}'),
  ('ON THE MONEY', 'Presidents on US currency', '{presidents}'),
  ('THOMAS JEFFERSON', 'Third president and founder', '{presidents}'),
  ('THEODORE ROOSEVELT', 'Rough Rider and reformer', '{presidents}'),
  ('FDR & WORLD WAR II', 'Roosevelt in Depression and war', '{presidents}'),
  ('JFK', 'Kennedy and the early 1960s', '{presidents}'),
  ('NIXON & WATERGATE', 'Nixon and the scandal', '{presidents}'),
  ('MODERN PRESIDENTS', 'Reagan through Biden', '{presidents}'),
  ('FOUR TERMS', 'The only four term president', '{presidents}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WASHINGTON'),'jeopardy',200,'This state in the Pacific Northwest was named for the first president','What is Washington?',false),
((SELECT id FROM categories WHERE title='WASHINGTON'),'jeopardy',400,'Washington crossed this river to attack Trenton on Christmas night 1776','What is the Delaware River?',false),
((SELECT id FROM categories WHERE title='WASHINGTON'),'jeopardy',600,'Home of Washington on the Potomac in Virginia','What is Mount Vernon?',false),
((SELECT id FROM categories WHERE title='WASHINGTON'),'jeopardy',800,'Washington took the first presidential oath in this city in 1789','What is New York City?',false),
((SELECT id FROM categories WHERE title='WASHINGTON'),'jeopardy',1000,'Washington warned against parties and foreign alliances in this farewell document','What is the Farewell Address?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='LINCOLN'),'jeopardy',200,'Lincoln appears on this small cent coin','What is the penny?',false),
((SELECT id FROM categories WHERE title='LINCOLN'),'jeopardy',400,'1863 order by Lincoln freeing enslaved people in Confederate states','What is the Emancipation Proclamation?',false),
((SELECT id FROM categories WHERE title='LINCOLN'),'jeopardy',600,'Brief 1863 dedication by Lincoln at a Pennsylvania battlefield cemetery','What is the Gettysburg Address?',false),
((SELECT id FROM categories WHERE title='LINCOLN'),'jeopardy',800,'Ford Theater in Washington where Lincoln was shot in 1865','What is Ford's Theatre?',false),
((SELECT id FROM categories WHERE title='LINCOLN'),'jeopardy',1000,'Actor who assassinated Lincoln in 1865','Who is John Wilkes Booth?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE WHITE HOUSE'),'jeopardy',200,'This city is home to the White House','What is Washington DC?',false),
((SELECT id FROM categories WHERE title='THE WHITE HOUSE'),'jeopardy',400,'The office of the president in the West Wing','What is the Oval Office?',false),
((SELECT id FROM categories WHERE title='THE WHITE HOUSE'),'jeopardy',600,'Annual egg roll held on the White House lawn at Easter','What is the Easter Egg Roll?',false),
((SELECT id FROM categories WHERE title='THE WHITE HOUSE'),'jeopardy',800,'The White House was burned in this year during the War of 1812','What is 1814?',true),
((SELECT id FROM categories WHERE title='THE WHITE HOUSE'),'jeopardy',1000,'This president was the first to live in the White House in 1800','Who is John Adams?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ELECTIONS'),'jeopardy',200,'Presidential elections are held in this month','What is November?',false),
((SELECT id FROM categories WHERE title='ELECTIONS'),'jeopardy',400,'This body formally elects the president, not the direct popular vote','What is the Electoral College?',false),
((SELECT id FROM categories WHERE title='ELECTIONS'),'jeopardy',600,'A full presidential term lasts this long','What is four years?',false),
((SELECT id FROM categories WHERE title='ELECTIONS'),'jeopardy',800,'Minimum age to be president under the Constitution','What is 35?',false),
((SELECT id FROM categories WHERE title='ELECTIONS'),'jeopardy',1000,'This amendment limits presidents to two terms','What is the 22nd Amendment?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FIRST LADIES'),'jeopardy',200,'Title given to the wife of the president','What is the First Lady?',false),
((SELECT id FROM categories WHERE title='FIRST LADIES'),'jeopardy',400,'Wife of Franklin Roosevelt and human rights leader','Who is Eleanor Roosevelt?',false),
((SELECT id FROM categories WHERE title='FIRST LADIES'),'jeopardy',600,'Wife of Ronald Reagan known for the Just Say No campaign','Who is Nancy Reagan?',false),
((SELECT id FROM categories WHERE title='FIRST LADIES'),'jeopardy',800,'Wife of James Madison who saved a portrait of Washington in 1814','Who is Dolley Madison?',false),
((SELECT id FROM categories WHERE title='FIRST LADIES'),'jeopardy',1000,'First Lady who later became senator and secretary of state','Who is Hillary Clinton?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='ON THE MONEY'),'jeopardy',200,'President on the one dollar bill','Who is George Washington?',false),
((SELECT id FROM categories WHERE title='ON THE MONEY'),'jeopardy',400,'President on the five dollar bill','Who is Abraham Lincoln?',false),
((SELECT id FROM categories WHERE title='ON THE MONEY'),'jeopardy',600,'President on the twenty dollar bill','Who is Andrew Jackson?',false),
((SELECT id FROM categories WHERE title='ON THE MONEY'),'jeopardy',800,'President on the fifty dollar bill','Who is Ulysses S Grant?',false),
((SELECT id FROM categories WHERE title='ON THE MONEY'),'jeopardy',1000,'President on the five hundred dollar bill','Who is William McKinley?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THOMAS JEFFERSON'),'double',400,'Jefferson wrote this 1776 founding document','What is the Declaration of Independence?',false),
((SELECT id FROM categories WHERE title='THOMAS JEFFERSON'),'double',800,'1803 purchase from France that doubled the size of the nation','What is the Louisiana Purchase?',false),
((SELECT id FROM categories WHERE title='THOMAS JEFFERSON'),'double',1200,'Virginia university founded by Jefferson','What is the University of Virginia?',false),
((SELECT id FROM categories WHERE title='THOMAS JEFFERSON'),'double',1600,'Home of Jefferson near Charlottesville Virginia','What is Monticello?',false),
((SELECT id FROM categories WHERE title='THOMAS JEFFERSON'),'double',2000,'Vice president under Jefferson who killed Hamilton in a duel','Who is Aaron Burr?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THEODORE ROOSEVELT'),'double',400,'Mountain carving in South Dakota with Roosevelt Washington Jefferson and Lincoln','What is Mount Rushmore?',false),
((SELECT id FROM categories WHERE title='THEODORE ROOSEVELT'),'double',800,'Volunteer cavalry led by Roosevelt in the Spanish American War','What are the Rough Riders?',false),
((SELECT id FROM categories WHERE title='THEODORE ROOSEVELT'),'double',1200,'Canal across Panama built during the Roosevelt years','What is the Panama Canal?',false),
((SELECT id FROM categories WHERE title='THEODORE ROOSEVELT'),'double',1600,'War between Russia and Japan ended by Roosevelt in a Nobel Prize peace deal','What is the Russo Japanese War?',false),
((SELECT id FROM categories WHERE title='THEODORE ROOSEVELT'),'double',2000,'1904 Roosevelt addition to this doctrine warned Europe to stay out of the Americas','What is the Monroe Doctrine?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FDR & WORLD WAR II'),'double',400,'Economic crisis that FDR faced when he took office in 1933','What is the Great Depression?',false),
((SELECT id FROM categories WHERE title='FDR & WORLD WAR II'),'double',800,'Vice president who became president when FDR died in 1945','Who is Harry S Truman?',false),
((SELECT id FROM categories WHERE title='FDR & WORLD WAR II'),'double',1200,'Hawaii naval base attacked by Japan in 1941','What is Pearl Harbor?',true),
((SELECT id FROM categories WHERE title='FDR & WORLD WAR II'),'double',1600,'1945 Crimea meeting of Roosevelt Churchill and Stalin','What is Yalta?',false),
((SELECT id FROM categories WHERE title='FDR & WORLD WAR II'),'double',2000,'1941 program lending arms to Britain to fight the Nazis','What is Lend Lease?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='JFK'),'double',400,'Texas city where Kennedy was assassinated in 1963','What is Dallas?',false),
((SELECT id FROM categories WHERE title='JFK'),'double',800,'Failed 1961 invasion of Cuba backed by Kennedy','What is the Bay of Pigs?',false),
((SELECT id FROM categories WHERE title='JFK'),'double',1200,'Kennedy promised to land a man on this body by the end of the 1960s','What is the Moon?',false),
((SELECT id FROM categories WHERE title='JFK'),'double',1600,'Wife of JFK and First Lady from 1961 to 1963','Who is Jacqueline Kennedy?',false),
((SELECT id FROM categories WHERE title='JFK'),'double',2000,'Navy patrol boat commanded by Kennedy in World War II','What is PT 109?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='NIXON & WATERGATE'),'double',400,'Year Nixon resigned the presidency','What is 1974?',false),
((SELECT id FROM categories WHERE title='NIXON & WATERGATE'),'double',800,'Nixon was the only president to do this','What is resignation?',false),
((SELECT id FROM categories WHERE title='NIXON & WATERGATE'),'double',1200,'Watergate burglars targeted offices of this political party','What is the Democratic Party?',false),
((SELECT id FROM categories WHERE title='NIXON & WATERGATE'),'double',1600,'Vice president under Nixon who resigned in 1973','Who is Spiro Agnew?',true),
((SELECT id FROM categories WHERE title='NIXON & WATERGATE'),'double',2000,'Washington newspaper of Woodward and Bernstein in Watergate coverage','What is the Washington Post?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MODERN PRESIDENTS'),'double',400,'Former movie actor elected president in 1980','Who is Ronald Reagan?',false),
((SELECT id FROM categories WHERE title='MODERN PRESIDENTS'),'double',800,'Peanut farmer from Georgia elected president in 1976','Who is Jimmy Carter?',false),
((SELECT id FROM categories WHERE title='MODERN PRESIDENTS'),'double',1200,'President in office during the September 11 attacks in 2001','Who is George W Bush?',false),
((SELECT id FROM categories WHERE title='MODERN PRESIDENTS'),'double',1600,'First Black president elected in 2008','Who is Barack Obama?',false),
((SELECT id FROM categories WHERE title='MODERN PRESIDENTS'),'double',2000,'Vice president under Obama who took office as president in 2021','Who is Joe Biden?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='FOUR TERMS'),'final',0,'Elected in 1932 1936 1940 and 1944, the only president to serve more than two terms','Who is Franklin D Roosevelt?',false);

INSERT INTO boards (name, description, tags) VALUES ('Presidents', 'US presidents from Washington through Biden. Verified facts.', '{presidents}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='Presidents');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Presidents'), id, 'jeopardy', pos FROM (VALUES
  ('WASHINGTON',0),
  ('LINCOLN',1),
  ('THE WHITE HOUSE',2),
  ('ELECTIONS',3),
  ('FIRST LADIES',4),
  ('ON THE MONEY',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Presidents'), id, 'double', pos FROM (VALUES
  ('THOMAS JEFFERSON',0),
  ('THEODORE ROOSEVELT',1),
  ('FDR & WORLD WAR II',2),
  ('JFK',3),
  ('NIXON & WATERGATE',4),
  ('MODERN PRESIDENTS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='Presidents'), id, 'final', pos FROM (VALUES
  ('FOUR TERMS',0)
) AS v(title,pos) JOIN categories c ON c.title=v.title;
