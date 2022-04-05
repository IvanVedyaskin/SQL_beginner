SELECT name FROM person_order
JOIN menu m on person_order.menu_id = m.id
JOIN person p on person_order.person_id = p.id
WHERE (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AND (p.address = 'Moscow' OR p.address = 'Samara')
    AND p.gender = 'male'
ORDER BY 1 DESC;