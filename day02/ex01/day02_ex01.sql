SELECT tbl2::date AS missing_date
FROM (SELECT visit_date FROM person_visits
    WHERE person_id = 1 OR person_id = 2) AS tbl1
RIGHT JOIN (SELECT tbl2::date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') tbl2) AS dates ON tbl1.visit_date = tbl2::date
WHERE tbl1.visit_date is null
ORDER BY 1;