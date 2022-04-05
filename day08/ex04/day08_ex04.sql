BEGIN ISOLATION LEVEL SERIALIZATION ; -- #1
BEGIN ISOLATION LEVEL SERIALIZATION ; -- #2
SELECT * FROM pizzeria; -- #1
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- #2
COMMIT; -- #2
SELECT * FROM pizzeria ; -- #1
COMMIT; -- #1
SELECT * FROM pizzeria; -- #1
SELECT * FROM pizzeria; -- #2