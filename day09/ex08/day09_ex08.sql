CREATE OR REPLACE FUNCTION fnc_fibonacci(in pstop int DEFAULT 10) RETURNS SETOF INT
 AS $table1$
     BEGIN
    RETURN QUERY WITH RECURSIVE t(a,b) AS(
    VALUES (0, 1)
     UNION ALL
        SELECT GREATEST(a, b), a + b AS a from t
        WHERE b < pstop)
    SELECT a FROM t;
    END;
    $table1$
LANGUAGE plpgsql;


-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();
