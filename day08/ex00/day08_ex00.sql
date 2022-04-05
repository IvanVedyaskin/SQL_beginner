BEGIN; -- Begin - запускает транзакцию, у которой по умолчанию статус чтение/запись.
savepoint first_savepoint; -- Fри желании можно сделать сэйв поинт, чтобы откатить изменения
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT; -- Если не запускать комит, то мы не увидим изменения в другой сессии.