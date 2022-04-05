CREATE TABLE big_data
(
    node1 varchar not null,
    node2 varchar not null,
    cost integer
  );

	insert into big_data values ('A', 'B', 10);
	insert into big_data values ('B', 'A', 10);
	insert into big_data values ('A', 'D', 20);
	insert into big_data values ('D', 'A', 20);
	insert into big_data values ('A', 'C', 15);
	insert into big_data values ('C', 'A', 15);
	insert into big_data values ('B', 'C', 35);
	insert into big_data values ('C', 'B', 35);
	insert into big_data values ('D', 'B', 25);
	insert into big_data values ('B', 'D', 25);
    insert into big_data values ('D', 'C', 30);
    insert into big_data values ('C', 'D', 30);

CREATE VIEW all_traces AS
(
    WITH RECURSIVE true_way AS
    (
        SELECT node1 AS tour, node1, node2, cost
            FROM big_data WHERE node1 = 'A'
        UNION ALL
        SELECT parrent.tour || ',' || child.node1 AS trace,
            child.node1,
            child.node2,
            child.cost + parrent.cost AS sum
        FROM big_data AS child
        INNER JOIN true_way AS parrent ON child.node1 = parrent.node2
        WHERE tour not like '%' || child.node1 || '%'
    )

    SELECT cost AS total_cost, concat('{', tour, ',', true_way.node2, '}') AS tour
    FROM true_way
    WHERE node2 = 'A'
      AND length(tour) = 7
    ORDER BY 1, 2
);

SELECT total_cost, tour FROM all_traces WHERE total_cost IN (SELECT min(total_cost) FROM all_traces)
ORDER BY 1,2;



