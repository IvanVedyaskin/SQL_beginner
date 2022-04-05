
CREATE TRIGGER trg_person_update_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();


CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
    BEGIN
        INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)  SELECT now(), 'U' ,OLD.*;
        RETURN OLD;
    END;
$trg_person_update_audit$ LANGUAGE plpgsql;


UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10;

-- DELETE FROM person_audit
--     WHERE row_id = 10

-- DROP TRIGGER trg_person_update_audit on person