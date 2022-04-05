SELECT pizza_name, price, p2.name AS pizzeria_name, visit_date FROM person_visits
JOIN person p on person_visits.person_id = p.id
JOIN pizzeria p2 on person_visits.pizzeria_id = p2.id
JOIN menu m on p2.id = m.pizzeria_id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3