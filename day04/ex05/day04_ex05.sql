CREATE VIEW v_price_with_discount (name, pizza_name, price, discount_price) AS
SELECT p.name, pizza_name, price, price * 0.9 AS discount_price FROM person_order
JOIN person p on person_order.person_id = p.id
JOIN menu m on person_order.menu_id = m.id
ORDER BY 1,2