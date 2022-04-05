SELECT address, p2.name, COUNT(*) AS count_of_orders FROM person_order
INNER JOIN person p on person_order.person_id = p.id
INNER JOIN menu m on m.id = person_order.menu_id
INNER JOIN pizzeria p2 on p2.id = m.pizzeria_id
GROUP BY address, p2.name
ORDER BY 1, 2;