CREATE TABLE person_audit
(
    created timestamp with time zone not null default now(),
    type_event char(1) not null default 'I',
    row_id bigint not null,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null,
    address varchar,
    constraint ch_type_event CHECK(type_event = 'I' OR type_event = 'U' OR type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit(created, row_id, name, age, gender, address)  SELECT now(), NEW.*;
        RETURN NEW;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();
--
-- DELETE  FROM person
--     WHERE id = 10;
-- --
-- DELETE  FROM person_audit
--     WHERE row_id = 10;
--
-- DROP TRIGGER trg_person_insert_audit ON person;

-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');