WITH pizza_names
    AS (
        SELECT pizza_name, price, p.id, name
        FROM menu
                 INNER JOIN pizzeria p on p.id = menu.pizzeria_id
    )
SELECT t1.pizza_name, pizza_names.name AS pizzeria_name1, t1.name AS pizzeria_name2, t1.price FROM pizza_names AS t1
INNER JOIN pizza_names ON pizza_names.id > t1.id AND
        t1.price = pizza_names.price AND t1.pizza_name = pizza_names.pizza_name
ORDER BY 1;