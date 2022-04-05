SELECT id, name,
    CASE WHEN(person.age BETWEEN 10 AND 20) THEN 'interval #1' ELSE
        CASE WHEN (person.age BETWEEN 21 AND 23) THEN 'interval #2' ELSE
            'interval #3'
        END
    END AS interval
FROM person
ORDER BY interval ;