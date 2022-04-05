SELECT person_id, COUNT(person_visits) AS count_of_visits FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC;