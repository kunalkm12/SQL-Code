use employees;
SELECT departments.dept_name, COUNT(dept_emp.emp_no) as noe FROM departments INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date = '9999-01-01' GROUP BY dept_name HAVING COUNT(dept_emp.emp_no)>20000 ORDER BY departments.dept_name;