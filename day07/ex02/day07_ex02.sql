(SELECT p.name, COUNT(pizzeria_id) AS count, 'visit' AS action_type FROM person_visits
INNER JOIN pizzeria p on person_visits.pizzeria_id = p.id
GROUP BY p.name ORDER BY count DESC LIMIT 3)
UNION
(SELECT p.name, COUNT(pizzeria_id) AS count, 'order' AS action_type FROM person_order
INNER JOIN menu m on m.id = person_order.menu_id
INNER JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY p.name ORDER BY count DESC LIMIT 3)
ORDER BY action_type, count DESC