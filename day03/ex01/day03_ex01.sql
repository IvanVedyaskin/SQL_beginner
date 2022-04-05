WITH not_order (menu_id)
AS (
        SELECT id
        FROM menu
        WHERE id NOT IN (SELECT menu_id FROM person_order)
    )
SELECT menu_id FROM not_order
ORDER BY 1;