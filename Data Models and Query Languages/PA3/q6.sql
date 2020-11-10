WITH RECURSIVE paths(src, dst) AS (
	SELECT src, dst FROM amap
    UNION
    SELECT f1.src, a1.dst FROM amap a1 INNER JOIN paths f1
    ON a1.src = f1.dst)
SELECT src, dst from paths ORDER BY src, dst