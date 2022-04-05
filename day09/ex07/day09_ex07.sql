CREATE OR REPLACE FUNCTION fnc_mleast(VARIADIC arr numeric []) RETURNS NUMERIC
 AS $table1$
    DECLARE minimum NUMERIC;
        BEGIN
        SELECT MIN(arr[i]) INTO minimum FROM generate_subscripts(arr, 1) g(i);
        RETURN minimum;
        END;
    $table1$
LANGUAGE plpgsql;

-- SELECT fnc_mleast(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);