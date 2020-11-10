use employees;
set @rank :=0;
SELECT GG1.S2emp, ((GG1.rnk-1)/(GG2.total-1))*100 as percentile FROM
(
SELECT * FROM
(
SELECT S2.emp_no as S2emp, S2.salary as S2sal, S2.from_date as S2fr, S2.to_date as S2to FROM salaries S2
WHERE S2.emp_no < 20000 AND S2.to_date = '9999-01-01'
) Tab1
INNER JOIN
(
SELECT * FROM
(
SELECT Tab1.*, @rank := @rank+1 as rnk FROM
(
SELECT S1.emp_no as S1emp, S1.salary as S1sal, S1.from_date as S1fr, S1.to_date as S1to FROM salaries S1
WHERE S1.emp_no < 20000 AND S1.to_date = '9999-01-01'
ORDER BY S1.salary
) Tab1
) M1
GROUP BY M1.S1sal
) Tab2
ON Tab1.S2sal = Tab2.S1sal
ORDER BY Tab2.rnk
) GG1
INNER JOIN
(
SELECT COUNT(*) as total FROM salaries S5
WHERE S5.emp_no < 20000 AND
S5.to_date = '9999-01-01'
) GG2
ORDER BY GG1.S2emp