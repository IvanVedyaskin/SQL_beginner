-- DROP FUNCTION fnc_person_visits_and_eats_on_date(in pperson varchar, in pprice numeric, in pdate date);

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(in pperson varchar DEFAULT 'Dmitriy',
in pprice numeric DEFAULT 500,
in pdate date DEFAULT '2022-01-01') RETURNS TABLE
    (
        pizzeria_name varchar
    )
 AS $table1$
        BEGIN
        RETURN QUERY
        SELECT DISTINCT pizzeria.name AS pizzeria_name FROM pizzeria
        INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
        INNER JOIN person ON person.id = person_visits.person_id
        WHERE pperson = person.name AND menu.price < pprice AND person_visits.visit_date = pdate;
        END;
    $table1$
LANGUAGE plpgsql;

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);
--
-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');