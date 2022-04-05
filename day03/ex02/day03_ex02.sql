WITH not_order (menu_id, pizzeria_id, pizza_name, price)
AS (
        SELECT *
        FROM menu
        WHERE id NOT IN (SELECT menu_id FROM person_order)
    )
SELECT pizza_name AS pizza_name, price, pizzeria.name AS pizzeria_name FROM not_order
JOIN pizzeria ON not_order.pizzeria_id = pizzeria.id
ORDER BY 1, 2;