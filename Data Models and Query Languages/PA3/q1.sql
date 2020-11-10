WITH RECURSIVE counter AS (
  SELECT 999 as n, 1 as d, 999.0000 as q, 0 as m
  UNION ALL
  SELECT 999 as n, d + 1 as d, n/(d+1) as q, n MOD (d+1) as m FROM counter WHERE d<=n
)
SELECT n,d,q from counter WHERE m = 0;
