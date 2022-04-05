SELECT t1.object_name
    FROM (SELECT name AS object_name FROM person ORDER BY object_name) AS t1
UNION ALL
SELECT tbl1.object_name
       FROM (SELECT pizza_name AS object_name FROM menu ORDER BY object_name) AS tbl1;