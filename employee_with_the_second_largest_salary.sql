SELECT 
	emp_name, 
	MAX(emp_salary) AS sal
FROM 
	emp_table
WHERE
	sal < (SELECT
				MAX(emp_salary) as max_sal
				FROM emp_table)



-- List of employees and their current managers
SELECT 
	e1.emp_first_name,
	e1.emp_last_name,
	e1.sup_id,
	e2.emp_first_name as sup_fisrt_name,
	e2.emp_last_name as sup_last_name,
FROM
	emp_table e1
LEFT OUTER JOIN
	emp_table e2
ON
	e1.sup_id = e2.emp_id
