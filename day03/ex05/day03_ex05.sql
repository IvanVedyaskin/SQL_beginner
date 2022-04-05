SELECT DISTINCT p.name AS pizzeria_name FROM person_visits
INNER JOIN person p1 on person_visits.person_id = p1.id
INNER JOIN menu m on person_visits.pizzeria_id = m.pizzeria_id
INNER JOIN pizzeria p on p.id = person_visits.pizzeria_id
WHERE p1.name = 'Andrey' AND person_visits.pizzeria_id NOT IN (
    SELECT menu.pizzeria_id FROM menu
    JOIN person_order po on menu.id = po.menu_id
    JOIN person p on p.id = po.person_id
    WHERE p.name = 'Andrey'
    )
ORDER BY 1;