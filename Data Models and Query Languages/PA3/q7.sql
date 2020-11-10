use pa3;
WITH RECURSIVE paths (src, dst, cost, n) AS (
SELECT src,dst,cost, 0 as n FROM amap
UNION 
SELECT f1.src, a1.dst, f1.cost + a1.cost, n+1 FROM amap a1 JOIN paths f1 ON a1.src = f1.dst AND n<1
) 
SELECT src, dst, min(cost) as cost FROM paths WHERE src!=dst GROUP BY src, dst ORDER BY src,dst,cost;