SELECT p.name, COUNT(name) AS count_of_orders, ROUND(avg(price), 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price FROM person_order
INNER JOIN menu m on person_order.menu_id = m.id
INNER JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY p.name;