SELECT DISTINCT person_id
    FROM person_visits WHERE visit_date='2022-01-06' OR visit_date='2022-01-09' OR pizzeria_id='2'
    ORDER BY person_id DESC;