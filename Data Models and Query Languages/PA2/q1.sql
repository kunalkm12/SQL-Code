use employees;
SELECT T1.emp_no as e1, T2.emp_no as e2
FROM 
( 
SELECT E1.emp_no, S1.salary FROM employees E1
INNER JOIN dept_emp D1 ON E1.emp_no = D1.emp_no
INNER JOIN salaries S1 ON E1.emp_no = S1.emp_no
WHERE
D1.dept_no = "d002" AND
D1.to_date = "9999-01-01" AND
S1.to_date = "9999-01-01" AND
year(E1.birth_date) = 1956 AND
E1.emp_no < 100000
) T1,
( 
SELECT E2.emp_no, S2.salary FROM employees E2
INNER JOIN dept_emp D2 ON E2.emp_no = D2.emp_no
INNER JOIN salaries S2 ON E2.emp_no = S2.emp_no
WHERE
D2.dept_no = "d002" AND
D2.to_date = "9999-01-01" AND
S2.to_date = "9999-01-01" AND
year(E2.birth_date) = 1956 AND
E2.emp_no < 100000
) T2
WHERE
T2.salary > T1.salary AND
T1.emp_no > T2.emp_no
ORDER BY T1.emp_no, T2.emp_no
