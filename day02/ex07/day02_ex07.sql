SELECT pizzeria.name FROM person
JOIN person_visits pv on person.id = pv.person_id
JOIN menu on menu.pizzeria_id = pv.pizzeria_id
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Dmitriy' AND menu.price < 800 AND pv.visit_date = '2022-01-08'