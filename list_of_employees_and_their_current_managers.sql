SELECT 
	e1.emp_first_name,
	e1.emp_last_name,
	e1.supe_id,
	e2.emp_first_name as supe_fisrt_name,
	e2.emp_last_name as supe_last_name,
FROM
	emp_table e1
LEFT OUTER JOIN
	emp_table e2
ON
	e1.supe_id = e2.emp_id
