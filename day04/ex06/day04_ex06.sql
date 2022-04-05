CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizzeria_name FROM person
JOIN person_visits pv on person.id = pv.person_id
JOIN menu m on pv.pizzeria_id = m.pizzeria_id
JOIN pizzeria p on m.pizzeria_id = p.id
WHERE person.name = 'Dmitriy' AND m.price < 800 AND pv.visit_date = '2022-01-08'
WITH DATA;