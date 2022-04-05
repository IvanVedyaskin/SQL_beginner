SELECT address, ROUND((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) AS formula, ROUND(AVG(age), 2) AS average,
       ROUND((MAX(age) - (MIN(age) / MAX(age))), 2) > AVG(age) AS comparasion FROM person
GROUP BY address
ORDER BY 1;