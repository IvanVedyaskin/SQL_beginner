SELECT total_cost, tour FROM all_traces
    WHERE total_cost IN (SELECT min(total_cost) FROM all_traces)
UNION
SELECT total_cost, tour FROM all_traces
    WHERE total_cost IN (SELECT max(total_cost) FROM all_traces)
ORDER BY 1,2;