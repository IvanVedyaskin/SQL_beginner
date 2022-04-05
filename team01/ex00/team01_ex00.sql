WITH info_people (name, lastname, money, type, currency_id, user_id)
    AS
    (
        SELECT u.name, u.lastname, SUM(money), type, currency_id, user_id FROM balance
        FULL JOIN "user" u on balance.user_id = u.id
        GROUP BY u.name, u.lastname, balance.type, currency_id, user_id
    ),
    info_currency (user_id, name, currency_id)
    AS
    (
        SELECT user_id, c.name, currency_id FROM balance
        FULL JOIN currency c on balance.currency_id = c.id
        GROUP BY user_id, c.name, currency_id
    ),
    info_time (id, update)
    AS
    (
        SELECT id, MAX(updated) AS update FROM currency
        GROUP BY id
    )

SELECT COALESCE(info_people.name, '') AS name, COALESCE(lastname, '') AS lastname, type, money AS volume, COALESCE(info_currency.name, '') AS currency_name,
    COALESCE(lol.rate_to_usd, 1.0) AS last_rate_to_usd, money * COALESCE(lol.rate_to_usd, 1) AS total_volume_in_usd FROM info_people
INNER JOIN info_currency ON info_people.user_id = info_currency.user_id AND info_people.currency_id = info_currency.currency_id
FULL JOIN (SELECT DISTINCT currency.id, rate_to_usd FROM currency
    INNER JOIN info_time ON currency.updated=info_time.update AND currency.id = info_time.id) as lol ON lol.id = info_people.currency_id
ORDER BY 1 DESC, 2, 3