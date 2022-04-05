SELECT COALESCE (person.name, '-') AS person_name, pv.visit_date AS visit_date, COALESCE (p.name, '-') AS pizzeria_name
    FROM person
FULL JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
    pv on person.id = pv.person_id
FULL JOIN pizzeria p on p.id = pv.pizzeria_id
ORDER BY 1,2,3;