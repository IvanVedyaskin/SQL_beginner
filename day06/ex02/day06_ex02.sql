SELECT p.name, pizza_name, m.price, m.price * (100 - discount) / 100 AS discount_price FROM person_order
INNER JOIN person_discounts pd on person_order.person_id = pd.person_id
INNER JOIN menu m on m.id = person_order.menu_id AND m.pizzeria_id = pd.pizzeria_id
INNER JOIN person p on p.id = pd.person_id
ORDER BY 1, 2;