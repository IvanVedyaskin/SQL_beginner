set enable_seqscan = off;
EXPLAIN ANALYZE SELECT pizza_name, p.name FROM menu
INNER JOIN pizzeria p on p.id = menu.pizzeria_id;