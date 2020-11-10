use employees;
WITH RECURSIVE tab1 as (
	SELECT t1.title as src, t2.title as dst, AVG((YEAR(t1.to_date)-YEAR(t1.from_date)+1)) as years FROM titles t1 INNER JOIN titles t2 on t1.emp_no = t2.emp_no
	WHERE t1.title != t2.title
	AND t1.to_date = t2.from_date
	GROUP BY t1.title, t2.title
	ORDER BY t1.title, t2.title
), 
tab2 as 
(
	SELECT src, dst, years FROM tab1
    UNION
    SELECT B.src, A.dst, A.years + B.years as years FROM tab2 A INNER JOIN tab1 B
    ON A.src = B.dst
    WHERE B.src != 'Manager'
	AND B.src <> A.dst
)
SELECT src,dst, MIN(years) as years FROM tab2 GROUP BY src,dst ORDER BY src,dst; 