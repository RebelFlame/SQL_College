use employees;

-- 1 . A list of the first 10 female employees (use LIMIT 10).
SELECT * FROM employees WHERE gender="F" LIMIT 10;

-- 2 . A list of female employees that have a last name of \u201cGils\u201d
SELECT * FROM employees WHERE gender="F" AND last_name="Gils";

-- 3 . Use the SQL created in 2 to create a list showing only the first name, last name and DOB.
SELECT first_name, last_name, birth_date FROM employees WHERE gender="F" AND last_name="Gils";

-- 4 . Sort the output in 3 by first name. 
SELECT first_name, last_name, birth_date FROM employees WHERE gender="F" AND last_name="Gils" ORDER BY last_name ASC;

-- 5 . Sort the output in 3 by DOB. 
SELECT first_name, last_name, birth_date FROM employees WHERE gender="F" AND last_name="Gils" ORDER BY birth_date ASC;

-- 6 . List all employees whose DOB is 18/1/1962 (dates can be referenced as strings - birth_date = '1961-08-29')
SELECT * FROM employees WHERE birth_date='1962-1-18';

-- 7. Who is the oldest employee
SELECT * FROM employees ORDER BY birth_date ASC LIMIT 1;

-- 8. Who is the newest employee
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 1;

-- 9 . List all female employees that were born in the 60s. 
SELECT * FROM employees WHERE gender="F" AND birth_date>='1960-01-01' AND birth_date<'1970-01-01';

-- 10. List all male employees that were hired in the 80s.
SELECT * FROM employees WHERE gender="M" AND hire_date>='1980-01-01' AND hire_date<'1990-01-01';

-- 11. Count the number of employees in employee table
SELECT COUNT(emp_no) FROM employees;

-- 12. Count number of female employees that were born in th 50s
SELECT COUNT(emp_no) FROM employees WHERE gender="F" AND birth_date>='1950-01-01' AND birth_date<'1960-01-01';

-- 13. What is the employee ID of the person with highest salary
SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 1;

-- 14. Use the employee ID identified in Q1 to locate the employee details from the salaries table
SELECT * FROM salaries WHERE emp_no='43624';

-- 15. Find the employee details of the person with the lowest salary
SELECT *, salaries.salary FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no ORDER BY salaries.salary ASC LIMIT 1;

-- 16. List all the salaries of Berni Sanella DOB 29/8/61 - order by to_date;
SELECT employees.emp_no, employees.birth_date, employees.first_name, employees.last_name, salaries.salary, salaries.to_date FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.first_name='Berni' AND employees.last_name='Sanella' AND  employees.birth_date='1961-08-29' ORDER BY salaries.to_date ASC;

-- 17. Bernie contributed 10% of her salary to her pansion. How much per annum did she pay into her pension for each of her salaries? Create a query to output the pensions contributions for each of her salaries + Q18 create alias
SELECT employees.emp_no, employees.birth_date, employees.first_name, employees.last_name, salaries.salary, salaries.to_date, (salaries.salary * 0.1) AS pension FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.first_name='Berni' AND employees.last_name='Sanella' AND  employees.birth_date='1961-08-29' ORDER BY salaries.to_date ASC;

-- 19. How much was Bernie paid in the month of October 1997 (salary/12)?
SELECT employees.emp_no, employees.birth_date, employees.first_name, employees.last_name, salaries.salary, (TRUNCATE(salaries.salary/12, 2)) AS monthly_pay FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.emp_no='10842' AND salaries.to_date>='1996-12-12' AND salaries.to_date<'1998-01-01' ORDER BY salaries.to_date ASC;