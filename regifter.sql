-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- price - integer
-- previously_regifted boolean
regifter=# CREATE TABLE gifts ( id SERIAL PRIMARY KEY, gift VARCHAR(225) NOT NULL, giver VARCHAR(255) NOT NULL, value INTEGER, regifted BOOLEAN DEFAULT FALSE);
CREATE TABLE


-- 
\echo See details of the table you created
regifter=# \d gifts
-- 


-- 
\echo Alter the table so that the column price is changed to value 
-- 


-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
regifter=# INSERT INTO gifts (gift, giver, value, regifted) VALUES ('peach candle', 'Santa', 9, TRUE)
regifter-# ;
INSERT 0 1

--
\echo Query for all the columns in your gifts table
-- 
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | regifted
----+--------------+-------+-------+----------
  1 | peach candle | Santa |     9 | t
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

-- INSERT INTO gifts (gift, giver, value, previously_regifted)
-- VALUES
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;
regifter=# INSERT INTO gifts (gift, giver, value, regifted) VALUES ('silver necklace', 'Santa', 20, FALSE), ('self-care gift basket', 'Kathy', 35, FALSE), ('coach purse', 'Lyra', 45, FALSE),  ('black watch', 'Miguel', 30, TRUE), ('chapter book', 'Athena', 15, FALSE);
INSERT 0 5

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
regifter=# INSERT INTO gifts (gift, giver, value, regifted) VALUES ('grapefruit candle', 'Vikky', 9, FALSE)

regifter=# INSERT INTO gifts (gift, giver, value, regifted) VALUES ('scented lotions', 'Jennifer', 20, FALSE), ('dark chocolate assorted nuts', 'Nichelle', 25, FALSE), ('orange backpack', 'Erika', 25, FALSE),  ('black notebook', 'Walter', 5, TRUE), ('mug', 'Linda', 11, TRUE);
INSERT 0 5
--
\echo Query for gifts with a value greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE value >= 20;
 id |             gift             |  giver   | value | regifted
----+------------------------------+----------+-------+----------
  2 | silver necklace              | Santa    |    20 | f
  3 | self-care gift basket        | Kathy    |    35 | f
  4 | coach purse                  | Lyra     |    45 | f
  5 | black watch                  | Miguel   |    30 | t
  8 | scented lotions              | Jennifer |    20 | f
  9 | dark chocolate assorted nuts | Nichelle |    25 | f
 10 | orange backpack              | Erika    |    25 | f
 13 | scented lotions              | Jennifer |    20 | f
 14 | dark chocolate assorted nuts | Nichelle |    25 | f
 15 | orange backpack              | Erika    |    25 | f
(10 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
regifter=# SELECT gift FROM gifts WHERE gift LIKE '%candle%';                   SELECT * FROM gifts;

       gift
-------------------
 peach candle
 grapefruit candle
(2 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
regifter=# SELECT * FROM gifts WHERE giver = 'Santa' OR value > 30;
 id |         gift          | giver | value | regifted
----+-----------------------+-------+-------+----------
  1 | peach candle          | Santa |     9 | t
  2 | silver necklace       | Santa |    20 | f
  3 | self-care gift basket | Kathy |    35 | f
  4 | coach purse           | Lyra  |    45 | f
(4 rows)

--
\echo Query for every gift whose giver is NOT Santa
--
regifter=# SELECT * FROM gifts WHERE giver != 'Santa';
 id |             gift             |  giver   | value | regifted
----+------------------------------+----------+-------+----------
  3 | self-care gift basket        | Kathy    |    35 | f
  4 | coach purse                  | Lyra     |    45 | f
  5 | black watch                  | Miguel   |    30 | t
  6 | chapter book                 | Athena   |    15 | f
  7 | grapefruit candle            | Vikky    |     9 | f
  8 | scented lotions              | Jennifer |    20 | f
  9 | dark chocolate assorted nuts | Nichelle |    25 | f
 10 | orange backpack              | Erika    |    25 | f
 11 | black notebook               | Walter   |     5 | t
 12 | mug                          | Linda    |    11 | t
 13 | scented lotions              | Jennifer |    20 | f
 14 | dark chocolate assorted nuts | Nichelle |    25 | f
 15 | orange backpack              | Erika    |    25 | f
 16 | black notebook               | Walter   |     5 | t
 17 | mug                          | Linda    |    11 | t
(15 rows)

--
\echo Update the second gift to have a value of 2999
-- 

regifter=# UPDATE gifts SET value = 2999 WHERE  id=2;
UPDATE 1

--
\echo Query for the updated item
--
regifter=# SELECT * FROM gifts WHERE id=2;
 id |      gift       | giver | value | regifted
----+-----------------+-------+-------+----------
  2 | silver necklace | Santa |  2999 | f
(1 row)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
regifter=# DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;
 value |      gift
-------+-----------------
     9 | peach candle
  2999 | silver necklace
(2 rows)

--
\echo Query for all the columns in your gifts table one more time
--

regifter=# SELECT * FROM gifts;
 id |             gift             |  giver   | value | regifted
----+------------------------------+----------+-------+----------
  3 | self-care gift basket        | Kathy    |    35 | f
  4 | coach purse                  | Lyra     |    45 | f
  5 | black watch                  | Miguel   |    30 | t
  6 | chapter book                 | Athena   |    15 | f
  7 | grapefruit candle            | Vikky    |     9 | f
  8 | scented lotions              | Jennifer |    20 | f
  9 | dark chocolate assorted nuts | Nichelle |    25 | f
 10 | orange backpack              | Erika    |    25 | f
 11 | black notebook               | Walter   |     5 | t
 12 | mug                          | Linda    |    11 | t
 13 | scented lotions              | Jennifer |    20 | f
 14 | dark chocolate assorted nuts | Nichelle |    25 | f
 15 | orange backpack              | Erika    |    25 | f
 16 | black notebook               | Walter   |     5 | t
 17 | mug                          | Linda    |    11 | t
(15 rows)

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 


--
\echo Get the AVEREAGE value from all the gifts
--


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;
