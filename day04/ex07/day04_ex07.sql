WITH not_visit AS
(
    SELECT * FROM pizzeria
    JOIN menu m on pizzeria.id = m.pizzeria_id
    WHERE name NOT IN (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats)
      AND m.price < 800 LIMIT 1
    )
INSERT INTO person_visits
(
    VALUES((SELECT MAX(id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Dmitriy'),
           (SELECT pizzeria_id FROM not_visit), '2022-01-08')
);
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;