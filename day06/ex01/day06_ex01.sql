INSERT INTO person_discounts
    SELECT row_number() over (ORDER BY person_id) AS id, person_id, pizzeria_id,
     (CASE WHEN COUNT (*) = 1 THEN 10.5
          WHEN COUNT (*) = 2 THEN 22
        ELSE 30
        END) AS discounts
     FROM person_order INNER JOIN menu ON menu.id = person_order.menu_id
               GROUP BY person_order.person_id, menu.pizzeria_id  ORDER BY 1