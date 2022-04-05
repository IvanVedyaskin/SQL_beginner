WITH only_name
    AS
    (
        SELECT * FROM menu
        WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
    )
SELECT only_name.pizza_name, pizzeria.name AS pizzeria_name, price FROM pizzeria
FULL JOIN only_name ON only_name.pizzeria_id = pizzeria.id
WHERE price is not null
ORDER BY 1,2;