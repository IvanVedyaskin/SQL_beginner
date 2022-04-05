WITH all_date_id (info)
    AS
    (
        SELECT visit_date FROM person_visits
            WHERE person_id = 1 OR person_id = 2
    )
SELECT missing_date FROM all_date_id
RIGHT JOIN (SELECT tbl2::date AS missing_date
        FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') tbl2) AS dates
    ON dates.missing_date = all_date_id.info
WHERE info is null;