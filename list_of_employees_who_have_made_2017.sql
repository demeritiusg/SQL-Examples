SELECT
	emp_name,
	emp_ID
FROM
	emp_table
WHERE
	emp_ID IN 
		(SELECT
			emp_ID
		FROM
			emp_table
		WHERE
			emp_salary < 275000
		AND
			EXTRACT('year', effective_date) = '2017'
