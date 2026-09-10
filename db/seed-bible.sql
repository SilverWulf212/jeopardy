-- Bible game set. One-shot seed: 13 bible-tagged categories, 61 clues.
-- Standard Protestant canon facts. Tribunal-verified, no repeated answers in-set.
-- Daily Doubles: 1 single (EXODUS 1000), 2 double (PROPHETS 1600, KINGDOM 1600).

INSERT INTO categories (title, description, tags) VALUES
  ('CREATION & GENESIS','Beginnings from Adam to Joseph','{bible}'),
  ('MOSES & THE EXODUS','Flight from Egypt to Sinai','{bible}'),
  ('KINGS OF ISRAEL','United monarchy and division','{bible}'),
  ('PSALMS & PROVERBS','Songs and wisdom sayings','{bible}'),
  ('MIRACLES OF JESUS','Mighty works in the Gospels','{bible}'),
  ('PARABLES','Stories told by Jesus','{bible}'),
  ('PROPHETS','Voices speaking for God','{bible}'),
  ('THE APOSTLES','Twelve chosen followers','{bible}'),
  ('WOMEN OF THE BIBLE','Heroines queens and mothers','{bible}'),
  ('KINGDOM & EXILE','Fall of Judah and return','{bible}'),
  ('THE PASSION','Cross and resurrection events','{bible}'),
  ('PAULS JOURNEYS','Missionary travels and churches','{bible}'),
  ('THE TEN COMMANDMENTS','Law given at Sinai','{bible}')
ON CONFLICT (title) DO NOTHING;

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='CREATION & GENESIS'),'jeopardy',200,'The first man created by God','Who is Adam?',false),
((SELECT id FROM categories WHERE title='CREATION & GENESIS'),'jeopardy',400,'The first woman formed from the rib of Adam','Who is Eve?',false),
((SELECT id FROM categories WHERE title='CREATION & GENESIS'),'jeopardy',600,'Garden where Adam and Eve lived','What is Eden?',false),
((SELECT id FROM categories WHERE title='CREATION & GENESIS'),'jeopardy',800,'He built the ark to survive the flood','Who is Noah?',false),
((SELECT id FROM categories WHERE title='CREATION & GENESIS'),'jeopardy',1000,'Son of Jacob sold by his brothers after receiving a coat of many colors','Who is Joseph?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MOSES & THE EXODUS'),'jeopardy',200,'The baby in the Nile basket who led Israel out of Egypt','Who is Moses?',false),
((SELECT id FROM categories WHERE title='MOSES & THE EXODUS'),'jeopardy',400,'Brother and spokesman of Moses, first high priest','Who is Aaron?',false),
((SELECT id FROM categories WHERE title='MOSES & THE EXODUS'),'jeopardy',600,'Sea parted by Moses for Israel to cross','What is the Red Sea?',false),
((SELECT id FROM categories WHERE title='MOSES & THE EXODUS'),'jeopardy',800,'Mountain where Moses received the Ten Commandments','What is Mount Sinai?',false),
((SELECT id FROM categories WHERE title='MOSES & THE EXODUS'),'jeopardy',1000,'Bread from heaven fed to Israel in the desert','What is manna?',true);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='KINGS OF ISRAEL'),'jeopardy',200,'Shepherd boy who slew Goliath and became king','Who is David?',false),
((SELECT id FROM categories WHERE title='KINGS OF ISRAEL'),'jeopardy',400,'Son of David who built the first temple in Jerusalem','Who is Solomon?',false),
((SELECT id FROM categories WHERE title='KINGS OF ISRAEL'),'jeopardy',600,'Saul son and closest friend of David','Who is Jonathan?',false),
((SELECT id FROM categories WHERE title='KINGS OF ISRAEL'),'jeopardy',800,'First king of Israel, predecessor of David','Who is Saul?',false),
((SELECT id FROM categories WHERE title='KINGS OF ISRAEL'),'jeopardy',1000,'This Jeroboam I became first king of the northern kingdom of Israel after the split','Who is Jeroboam I?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PSALMS & PROVERBS'),'jeopardy',200,'This book with 150 chapters is the longest book of the Bible','What is Psalms?',false),
((SELECT id FROM categories WHERE title='PSALMS & PROVERBS'),'jeopardy',400,'Book of wise sayings that follows Psalms','What is Proverbs?',false),
((SELECT id FROM categories WHERE title='PSALMS & PROVERBS'),'jeopardy',600,'David played this instrument to soothe King Saul','What is a harp?',false),
((SELECT id FROM categories WHERE title='PSALMS & PROVERBS'),'jeopardy',800,'The Lord is my shepherd opens this beloved psalm','What is Psalm 23?',false),
((SELECT id FROM categories WHERE title='PSALMS & PROVERBS'),'jeopardy',1000,'Psalm 111:10 says the fear of the Lord is the beginning of this','What is wisdom?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='MIRACLES OF JESUS'),'jeopardy',200,'Jesus turned water into this at Cana','What is wine?',false),
((SELECT id FROM categories WHERE title='MIRACLES OF JESUS'),'jeopardy',400,'Lake where Jesus walked on water','What is the Sea of Galilee?',false),
((SELECT id FROM categories WHERE title='MIRACLES OF JESUS'),'jeopardy',600,'Sea food multiplied with five loaves to feed five thousand','What is fish?',false),
((SELECT id FROM categories WHERE title='MIRACLES OF JESUS'),'jeopardy',800,'Brother of Mary and Martha raised after four days','Who is Lazarus?',false),
((SELECT id FROM categories WHERE title='MIRACLES OF JESUS'),'jeopardy',1000,'Synagogue ruler whose daughter Jesus raised','Who is Jairus?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PARABLES'),'jeopardy',200,'Traveler who aided a wounded man on the Jericho road','Who is the Good Samaritan?',false),
((SELECT id FROM categories WHERE title='PARABLES'),'jeopardy',400,'Wayward son who returned to his father','Who is the prodigal son?',false),
((SELECT id FROM categories WHERE title='PARABLES'),'jeopardy',600,'Smallest seed that grows great like the kingdom','What is the mustard seed?',false),
((SELECT id FROM categories WHERE title='PARABLES'),'jeopardy',800,'Shepherd left ninety nine to seek one of these','What is a lost sheep?',false),
((SELECT id FROM categories WHERE title='PARABLES'),'jeopardy',1000,'Virgins in the parable five wise and five foolish total this number','What is ten?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PROPHETS'),'double',400,'Prophet swallowed by a great fish','Who is Jonah?',false),
((SELECT id FROM categories WHERE title='PROPHETS'),'double',800,'Prophet taken to heaven in a whirlwind','Who is Elijah?',false),
((SELECT id FROM categories WHERE title='PROPHETS'),'double',1200,'At Elisha instruction Naaman washed in this river to be healed','What is the Jordan?',false),
((SELECT id FROM categories WHERE title='PROPHETS'),'double',1600,'Lamentations is traditionally attributed to this prophet','Who is Jeremiah?',true),
((SELECT id FROM categories WHERE title='PROPHETS'),'double',2000,'Exile who interpreted the dream of Nebuchadnezzar','Who is Daniel?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE APOSTLES'),'double',400,'Fisherman called the rock, brother of Andrew','Who is Peter?',false),
((SELECT id FROM categories WHERE title='THE APOSTLES'),'double',800,'He betrayed Jesus for thirty pieces of silver','Who is Judas Iscariot?',false),
((SELECT id FROM categories WHERE title='THE APOSTLES'),'double',1200,'Apostle who doubted until he saw the wounds','Who is Thomas?',false),
((SELECT id FROM categories WHERE title='THE APOSTLES'),'double',1600,'Tax collector who wrote the first Gospel','Who is Matthew?',false),
((SELECT id FROM categories WHERE title='THE APOSTLES'),'double',2000,'Apostle exiled on Patmos who wrote Revelation','Who is John?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='WOMEN OF THE BIBLE'),'double',400,'This Mary, mother of Jesus','Who is Mary mother of Jesus?',false),
((SELECT id FROM categories WHERE title='WOMEN OF THE BIBLE'),'double',800,'Sister of Moses who sang after the Red Sea crossing','Who is Miriam?',false),
((SELECT id FROM categories WHERE title='WOMEN OF THE BIBLE'),'double',1200,'Moabite who followed Naomi to Bethlehem','Who is Ruth?',false),
((SELECT id FROM categories WHERE title='WOMEN OF THE BIBLE'),'double',1600,'Jewish queen of Persia who saved her people','Who is Esther?',false),
((SELECT id FROM categories WHERE title='WOMEN OF THE BIBLE'),'double',2000,'Prophetess and judge who led Israel with Barak','Who is Deborah?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='KINGDOM & EXILE'),'double',400,'City of the temple, capital of Judah','What is Jerusalem?',false),
((SELECT id FROM categories WHERE title='KINGDOM & EXILE'),'double',800,'King of Babylon who destroyed the temple','Who is Nebuchadnezzar?',false),
((SELECT id FROM categories WHERE title='KINGDOM & EXILE'),'double',1200,'Persian king who decreed the return from exile','Who is Cyrus?',false),
((SELECT id FROM categories WHERE title='KINGDOM & EXILE'),'double',1600,'Great city where Judah was held in exile','What is Babylon?',true),
((SELECT id FROM categories WHERE title='KINGDOM & EXILE'),'double',2000,'Scribe who taught the law after the return','Who is Ezra?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE PASSION'),'double',400,'Garden where Jesus prayed before arrest','What is Gethsemane?',false),
((SELECT id FROM categories WHERE title='THE PASSION'),'double',800,'This Roman prefect Pontius Pilate condemned Jesus','Who is Pontius Pilate?',false),
((SELECT id FROM categories WHERE title='THE PASSION'),'double',1200,'Hill place of the crucifixion','What is Golgotha?',false),
((SELECT id FROM categories WHERE title='THE PASSION'),'double',1600,'Mocking headpiece placed on Jesus','What is a crown of thorns?',false),
((SELECT id FROM categories WHERE title='THE PASSION'),'double',2000,'Prisoner freed instead of Jesus','Who is Barabbas?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='PAULS JOURNEYS'),'double',400,'City on the road where Saul was blinded','What is Damascus?',false),
((SELECT id FROM categories WHERE title='PAULS JOURNEYS'),'double',800,'Island where Paul was shipwrecked','What is Malta?',false),
((SELECT id FROM categories WHERE title='PAULS JOURNEYS'),'double',1200,'Imperial capital where Paul appealed to Caesar','What is Rome?',false),
((SELECT id FROM categories WHERE title='PAULS JOURNEYS'),'double',1600,'Greek city where Paul preached the unknown god','What is Athens?',false),
((SELECT id FROM categories WHERE title='PAULS JOURNEYS'),'double',2000,'Macedonian city home to Lydia and the jailer','What is Philippi?',false);

INSERT INTO clues (category_id, round, value, question, answer, daily_double) VALUES
((SELECT id FROM categories WHERE title='THE TEN COMMANDMENTS'),'final',0,'Remember the sabbath day to keep it holy is this numbered commandment in Protestant tradition','What is the fourth commandment?',false);

INSERT INTO boards (name, description, tags) VALUES
('The Bible','Standard Protestant canon facts. Tribunal-verified, no repeated answers.','{bible}')
ON CONFLICT (name) DO NOTHING;

DELETE FROM board_categories WHERE board_id = (SELECT id FROM boards WHERE name='The Bible');

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='The Bible'), id, 'jeopardy', pos FROM (VALUES
  ('CREATION & GENESIS',0),('MOSES & THE EXODUS',1),('KINGS OF ISRAEL',2),('PSALMS & PROVERBS',3),('MIRACLES OF JESUS',4),('PARABLES',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='The Bible'), id, 'double', pos FROM (VALUES
  ('PROPHETS',0),('THE APOSTLES',1),('WOMEN OF THE BIBLE',2),('KINGDOM & EXILE',3),('THE PASSION',4),('PAULS JOURNEYS',5)
) AS v(title,pos) JOIN categories c ON c.title=v.title;

INSERT INTO board_categories (board_id, category_id, round, position)
SELECT (SELECT id FROM boards WHERE name='The Bible'), id, 'final', 0 FROM categories WHERE title='THE TEN COMMANDMENTS';
