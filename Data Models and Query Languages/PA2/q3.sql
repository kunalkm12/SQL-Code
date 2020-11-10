use employees;
SELECT Tab1.emp_no, DE.dept_name FROM departments DE
INNER JOIN
(
SELECT D1.emp_no, D1.dept_no FROM dept_manager D1
WHERE NOT EXISTS
(
SELECT D2.emp_no, D2.dept_no, DATEDIFF(D2.to_date, D2.from_date) FROM dept_manager D2
WHERE
DATEDIFF(D1.to_date, D1.from_date) > DATEDIFF(D2.to_date, D2.from_date)
AND
D1.dept_no = D2.dept_no
GROUP BY D2.dept_no
)
) Tab1 ON Tab1.dept_no = DE.dept_no
ORDER BY Tab1.emp_no