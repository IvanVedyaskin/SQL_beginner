BEGIN; -- #1
BEGIN; -- #2
UPDATE person SET address = 'Saransk' WHERE id = 1; -- #1
UPDATE person SET address = 'Saransk' WHERE id = 2; -- #2
UPDATE person SET address = 'Saransk' WHERE id = 2; -- #1
UPDATE person SET address = 'Saransk' WHERE id = 1; -- #2
COMMIT; -- #1
COMMIT; -- #2
