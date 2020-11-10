use employees;
SELECT Tab2.dept_name, Tab1.title, COUNT(Tab1.title) as cnt
FROM 
( 
SELECT E1.emp_no, T1.title FROM employees E1
INNER JOIN titles T1 ON E1.emp_no = T1.emp_no
WHERE T1.to_date = "9999-01-01"
) Tab1
INNER JOIN
(
SELECT E2.emp_no, DE.dept_name FROM employees E2
INNER JOIN dept_emp D2 ON E2.emp_no = D2.emp_no
INNER JOIN departments DE ON D2.dept_no = DE.dept_no
WHERE D2.to_date = "9999-01-01"
) Tab2
ON Tab1.emp_no = Tab2.emp_no
GROUP BY Tab2.dept_name, Tab1.title
ORDER BY Tab2.dept_name