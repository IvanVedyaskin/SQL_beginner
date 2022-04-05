SELECT name, SUM(total_count) AS total_count
    FROM ((SELECT name, COUNT(person_visits.person_id) AS total_count FROM person_visits
        FULL JOIN pizzeria p on person_visits.pizzeria_id = p.id
        GROUP BY name)
    UNION ALL
        (SELECT p.name, COUNT(person_id) AS total_count FROM person_order
        INNER JOIN menu m on m.id = person_order.menu_id
        FULL JOIN pizzeria p on p.id = m.pizzeria_id
        GROUP BY name)) AS all_statistics
GROUP BY name ORDER BY total_count DESC;