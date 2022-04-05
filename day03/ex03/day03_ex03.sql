WITH visits
    AS(
    SELECT p2.name AS pizzeria_name, p3.gender FROM person_visits
    JOIN pizzeria p2 on pizzeria_id = p2.id
    JOIN person p3 on person_visits.person_id = p3.id
        )
(SELECT pizzeria_name FROM visits WHERE gender='male'
EXCEPT ALL
SELECT pizzeria_name FROM visits WHERE gender='female')
UNION ALL
(SELECT pizzeria_name FROM visits WHERE gender='female'
EXCEPT ALL
SELECT pizzeria_name FROM visits WHERE gender='male')
order by 1;