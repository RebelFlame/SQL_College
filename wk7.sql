use employees;
-- 1 . Display each last name in the employees table with a count of the number of occurrences of that last name.
SELECT employees.last_name, COUNT(employees.last_name) AS occurs FROM employees GROUP BY employees.last_name ORDER BY employees.last_name ASC;

-- 2 . Display each first name in the employees table with a count of the number of occurrences of that first name.
SELECT employees.first_name, COUNT(employees.first_name) AS occurs FROM employees GROUP BY employees.first_name ORDER BY employees.first_name ASC;

-- 3 . Use the ORDER BY and LIMIT clauses to identify the ten most common last names in the database.
SELECT employees.last_name, COUNT(employees.last_name) AS occurs FROM employees GROUP BY employees.last_name ORDER BY occurs DESC LIMIT 10;

-- 4 . Use the ORDER BY and LIMIT clauses to identify the ten most common first names in the database.
SELECT employees.first_name, COUNT(employees.first_name) AS occurs FROM employees GROUP BY employees.first_name ORDER BY occurs DESC LIMIT 10;

-- 5 . Write SQL to determine if there Is there anyone in the database that has the same first name/last name combination (group by first_name, last_name and count emp_no)?
SELECT employees.first_name, employees.last_name FROM employees WHERE employees.first_name = employees.last_name;

-- 6 . Show the top 10 employees that have moved department the most.
SELECT employees.emp_no, employees.last_name, COUNT(dept_emp.emp_no) AS times_changed_d FROM employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no GROUP BY dept_emp.emp_no ORDER BY times_changed_d DESC LIMIT 10;

-- 7 . Show the top 10 employees that have had the most changes in salary.
SELECT salaries.emp_no, employees.first_name, employees.last_name, COUNT(DISTINCT salaries.salary) AS different_salaries FROM salaries INNER JOIN employees ON salaries.emp_no = employees.emp_no GROUP BY salaries.emp_no ORDER BY different_salaries DESC LIMIT 10;

-- 8 . Show the top 10 employees that have had the most changes in title.
SELECT employees.emp_no, employees.last_name, COUNT(titles.emp_no) AS times_changed_t FROM employees INNER JOIN titles ON employees.emp_no = titles.emp_no GROUP BY titles.emp_no ORDER BY times_changed_t DESC LIMIT 10;




