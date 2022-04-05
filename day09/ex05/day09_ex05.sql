CREATE OR REPLACE FUNCTION fnc_persons(in pgender varchar DEFAULT 'female') RETURNS TABLE
    (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
    )
 AS $$ SELECT * FROM person
        WHERE gender = pgender;
    $$
LANGUAGE SQL;

-- select *
-- from fnc_persons(pgender := 'male');
--
-- select *
-- from fnc_persons();

-- DROP FUNCTION fnc_persons_female(), fnc_persons_male();