WITH RECURSIVE fib(n,a,b) AS (
	SELECT 0 as n, 0 as a, 0 as b 
	UNION ALL
	SELECT n+1, b, (case when n+1<=1 then n+1
						 when b%2!=0 then a+b
                         when b%2=0 then a+b+1 end)
	FROM fib WHERE n<10
)
SELECT n,b as 'f(n)' from fib;