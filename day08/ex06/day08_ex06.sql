BEGIN ISOLATION LEVEL REPEATABLE READ ; -- #1
BEGIN ISOLATION LEVEL REPEATABLE READ ; -- #2
BEGIN; -- #1
BEGIN; -- #2
SELECT SUM(rating) FROM pizzeria; -- #1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- #2
COMMIT; -- #2
SELECT SUM(rating) FROM pizzeria; -- #1
COMMIT; -- #1
SELECT SUM(rating) FROM pizzeria; -- #1
SELECT SUM(rating) FROM pizzeria; -- #2