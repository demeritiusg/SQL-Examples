SELECT
	emp_name,
	emp_salary
FROM
	emp_table
HAVING
	MAX(emp_salary) < 150000
