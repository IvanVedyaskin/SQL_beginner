WITH orders
    AS
(SELECT DISTINCT p2.name AS pizzeria_name, p3.gender FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria p2 on pizzeria_id = p2.id
JOIN person p3 on person_order.person_id = p3.id
    )
(SELECT pizzeria_name FROM orders WHERE gender='male'
EXCEPT
SELECT pizzeria_name FROM orders WHERE gender='female')
UNION
(SELECT pizzeria_name FROM orders WHERE gender='female'
EXCEPT
SELECT pizzeria_name FROM orders WHERE gender='male')
order by 1;