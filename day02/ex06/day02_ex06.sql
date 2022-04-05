WITH Anna_ord
AS  (
        SELECT pizza_name, pizzeria.name AS pizzeria_name FROM person_order
        JOIN person ON person.id = person_order.person_id
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        WHERE person.name = 'Anna'
    ),
    Denis_ord
AS
    (
    SELECT pizza_name, pizzeria.name AS pizzeria_name FROM person_order
        JOIN person ON person.id = person_order.person_id
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        WHERE person.name = 'Denis'
    )
SELECT * FROM Anna_ord WHERE Anna_ord.pizza_name IN (SELECT Denis_ord.pizza_name FROM Denis_ord)
UNION
SELECT * FROM Denis_ord where Denis_ord.pizza_name IN (SELECT Anna_ord.pizza_name FROM Anna_ord)
ORDER BY 1,2
-- JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
-- JOIN pizzeria ON pizzeria.id = menu.pizzeria_id