WITH tbl1
AS
    (
        SELECT * FROM
            (SELECT name AS person_name1, address AS add1, id AS id1 FROM person) AS t1
            FULL JOIN (SELECT name AS person_name2, address AS add2, id AS id2 FROM person) AS t2 ON t1.add1=t2.add2
            WHERE t1.person_name1 != t2.person_name2
    )
SELECT person_name1, person_name2, tbl1.add1 AS common_address FROM tbl1
WHERE id1 > id2;