WITH pepperoni
AS  (
        SELECT person.name, m.pizza_name FROM person_order
        JOIN person ON  person_order.person_id = person.id
        JOIN menu m ON person_order.menu_id = m.id
        WHERE m.pizza_name = 'pepperoni pizza' AND person.gender = 'female'
    ),
    cheese
AS
    (
        SELECT person.name, m.pizza_name FROM person_order
        JOIN person ON  person_order.person_id = person.id
        JOIN menu m ON person_order.menu_id = m.id
        WHERE m.pizza_name = 'cheese pizza' AND person.gender = 'female'
    )
SELECT cheese.name FROM cheese
JOIN pepperoni ON pepperoni.name = cheese.name
ORDER BY 1