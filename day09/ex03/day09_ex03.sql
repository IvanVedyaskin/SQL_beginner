CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit(created, row_id, name, age, gender, address)  SELECT now(), NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)  SELECT now(), 'U' ,OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)  SELECT now(), 'D' , OLD.*;
            RETURN OLD;
        END IF;
        RETURN NULL;
    END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

-- DROP TRIGGER trg_person_audit ON person
--
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
-- UPDATE person SET name = 'Bulat' WHERE id = 10;
-- UPDATE person SET name = 'Damir' WHERE id = 10;
-- DELETE FROM person WHERE id = 10;