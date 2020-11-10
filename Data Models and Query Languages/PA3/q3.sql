WITH RECURSIVE tab1 AS (
  SELECT 1.0 as d, 1 as m, 1 as n, 1 as 'm*n'
  UNION ALL
  SELECT d + (1/9) as d, CAST(FLOOR(d+(1/9)) AS SIGNED) as m, (n+1) MOD 10 as n, (CAST(FLOOR(d+(1/9)) AS SIGNED))*((n+1) MOD 10) as 'm*n' FROM tab1 WHERE d < 9.9
)
SELECT m,n,m*n FROM tab1 WHERE n!=0