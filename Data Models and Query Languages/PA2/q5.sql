use employees;
SELECT Tab1.emp_no, Tab1.chang as on_date, Tab1.tit1 as o_title, Tab1.tit2 as n_title, S1.salary as o_salary, S2.salary as n_salary FROM 
(
SELECT T1.emp_no, T1.title as tit1, T2.title as tit2, T1.to_date as chang FROM titles T1
INNER JOIN titles T2
ON T1.emp_no = T2.emp_no AND T1.title != T2.title AND T1.to_date = T2.from_date
) Tab1
INNER JOIN salaries S1
INNER JOIN salaries S2
WHERE
Tab1.emp_no = S1.emp_no AND
Tab1.emp_no = S2.emp_no AND
Tab1.chang = S1.to_date AND
Tab1.chang = S2.from_date AND
S2.salary < S1.salary
ORDER BY Tab1.emp_no