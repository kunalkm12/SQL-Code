use employees;
SELECT DE.dept_name, T1.cnt 
FROM
(
SELECT dept_no, COUNT(*)-1 as cnt
FROM dept_manager M1
GROUP BY dept_no
) T1
INNER JOIN departments DE
ON T1.dept_no = DE.dept_no
WHERE cnt > 1
ORDER BY DE.dept_name