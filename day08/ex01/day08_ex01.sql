BEGIN; -- #1
BEGIN; -- #2
SELECT * FROM pizzeria; --#1
SELECT * FROM pizzeria; --#2
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --#1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --#2
COMMIT; --#1
COMMIT; --#2
SELECT * FROM pizzeria; --#1
SELECT * FROM pizzeria; --#2