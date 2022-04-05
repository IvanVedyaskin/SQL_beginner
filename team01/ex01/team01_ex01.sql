insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH max_upd AS
	(SELECT
		 b.user_id,
		 b.currency_id,
		 b.updated,
		 c.rate_to_usd,
		 MAX(c.updated) max_current_upd
	 FROM balance b JOIN currency c ON b.currency_id = c.id
	 WHERE c.updated <= b.updated
	 GROUP by b.user_id, b.currency_id, b.updated, c.rate_to_usd),

	 min_upd AS
	 (SELECT
		  b.user_id,
		  b.currency_id,
		  b.updated,
		  c.rate_to_usd,
		  MIN(c.updated) min_current_upd
	  FROM balance b JOIN currency c ON b.currency_id = c.id
	  WHERE c.updated > b.updated
	  GROUP by b.user_id, b.currency_id, b.updated, c.rate_to_usd)

	(SELECT
		COALESCE(u.name,'') AS name,
		COALESCE(u.lastname,'') AS lastname,
		c.name AS currency_name,
		(b.money * c.rate_to_usd)::real AS currency_in_usd	 
	FROM "user" u JOIN balance b ON u.id = b.user_id
				JOIN currency c ON b.currency_id = c.id
				JOIN max_upd ON c.id = max_upd.currency_id 
							AND b.updated = max_upd.updated
							AND b.user_id = max_upd.user_id
							AND c.updated = max_upd.max_current_upd)
	UNION
	(SELECT
			COALESCE(u.name,'') AS name,
			COALESCE(u.lastname,'') AS lastname,
			c.name AS currency_name,
			(b.money * c.rate_to_usd)::real AS currency_in_usd
		FROM "user" u JOIN balance b ON u.id = b.user_id
					JOIN currency c ON b.currency_id = c.id
					JOIN min_upd ON c.id = min_upd.currency_id 
								AND b.updated = min_upd.updated
								AND b.user_id = min_upd.user_id
								AND c.updated = min_upd.min_current_upd

		WHERE CONCAT(b.updated,b.user_id,b.currency_id) NOT IN
		(SELECT CONCAT(b.updated,b.user_id,b.currency_id)
		 FROM "user" u JOIN balance b ON u.id = b.user_id
					JOIN currency c ON b.currency_id = c.id
					JOIN max_upd ON c.id = max_upd.currency_id
		 						AND b.updated = max_upd.updated
		 						AND c.updated = max_upd.max_current_upd))

ORDER by 1 DESC, 2 ASC, 3 ASC;