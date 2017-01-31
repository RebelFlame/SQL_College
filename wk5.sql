use employees;
-- 1.Berni Sanella DOB 29/8/61 contributed 10% of her salary (salary * 0.1) to her pension. How much per annum did she pay into her pension for each of her salaries? Create a query to output the pension contributions for each of her salaries.
-- 2.Create an alias for the pension column in Q1 called \u201cPension\u201d.
SELECT employees.first_name, employees.last_name, salaries.salary, (salaries.salary * 0.1) AS Pension, salaries.to_date FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.first_name = "Berni" AND employees.last_name = "Sanella" AND employees.birth_date = '1961-08-29' ORDER BY salaries.to_date ASC;

-- 3.How much was Berni paid in the month of October 1997 ( salary / 12 )?
SELECT employees.first_name, employees.last_name, salaries.salary, TRUNCATE(salaries.salary /12,2) AS paid_monthly, salaries.to_date FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.first_name = "Berni" AND employees.last_name = "Sanella" AND employees.birth_date = '1961-08-29' AND salaries.to_date < '1998-01-01' AND salaries.to_date > '1996-12-12' ORDER BY salaries.to_date ASC;

-- 4.List the first/last name and gender of all the department managers and include the department name in this list (requires 2 table joins).
SELECT employees.first_name, employees.last_name, employees.gender, departments.dept_name FROM employees JOIN dept_manager ON employees.emp_no = dept_manager.emp_no JOIN departments ON dept_manager.dept_no = departments.dept_no WHERE employees.emp_no = dept_manager.emp_no;

-- 5.List the first/last name of all employees that work in Sales (2 table joins required).
SELECT employees.first_name, employees.last_name, departments.dept_name FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales';

-- 6.List the first/last name of all the employees that have worked for Margareta Markovitch. (TOO DIFFICULT!)
SELECT employees.first_name, employees.last_name FROM employees JOIN dept_manager ON employees.emp_no = dept_manager.emp_no JOIN dept_emp ON employees.emp_no = dept_emp.emp_no WHERE dept_emp.dept_no = (SELECT dept_manager.dept_no FROM dept_manager JOIN employees ON dept_manager.emp_no = employees.emp_no WHERE  employees.first_name = 'Margareta' AND employees.last_name = 'Markovitch') AND dept_emp.to_date > (SELECT dept_manager.from_date FROM dept_manager JOIN employees ON dept_manager.emp_no = employees.emp_no WHERE  employees.first_name = 'Margareta' AND employees.last_name = 'Markovitch') AND dept_emp.from_date < (SELECT dept_manager.to_date FROM dept_manager JOIN employees ON dept_manager.emp_no = employees.emp_no WHERE employees.first_name = 'Margareta' AND employees.last_name = 'Markovitch') AND employees.first_name != 'Margareta' AND employees.last_name != 'Markovitch';

-- 7.Display the birth date and hire date of Berni Sanella in the format \u201c21 January 2015\u201d. Use appropriate column aliases so that the data is displayed in a meaningful way.
SELECT first_name, last_name, DATE_FORMAT(birth_date, '%e %M %Y') AS birth_date, DATE_FORMAT(hire_date, '%e %M %Y') AS hire_date FROM employees WHERE first_name = 'Berni' AND last_name = 'Sanella';

-- 8.Use the DATEDIFF function to determine how long ago Berni Sanella was hired.
SELECT first_name, last_name, ROUND(DATEDIFF(CURDATE(), hire_date) /30,2) AS hired_months FROM employees WHERE first_name = 'Berni' AND last_name = 'Sanella';

-- 9.Use the DATEDIFF function to determine how old in years Berni Sanell is (divide by 365).
SELECT first_name, last_name, ROUND(DATEDIFF(CURDATE(), hire_date) /365,2) AS hired_months FROM employees WHERE first_name = 'Berni' AND last_name = 'Sanella';

-- 10.How old was Berni when she was hired?
SELECT first_name, last_name, ROUND(DATEDIFF(hire_date, birth_date) /365,0) AS how_old_started FROM employees WHERE first_name = 'Berni' AND last_name = 'Sanella';

-- 11.Assume that the maximum to_date in the salaries table determines when an employee left the company. How old was Berni when she left the company?
SELECT employees.first_name, employees.last_name, ROUND(DATEDIFF(salaries.to_date, employees.birth_date) /365,0) AS how_old_left FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE first_name = 'Berni' AND last_name = 'Sanella' ORDER BY how_old_left DESC LIMIT 1;

-- 12.What is the name of the department that has the most employees on 1.1.1990?
SELECT departments.dept_name, COUNT(dept_emp.emp_no) AS number_of_empl FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no WHERE dept_emp.from_date < '1990-01-02' AND dept_emp.to_date > '1989-12-31' GROUP BY dept_emp.dept_no ORDER BY number_of_empl DESC;

-- 13.What is the name of the manager that has the least employees on 1.1.1990?
SELECT employees.first_name, employees.last_name FROM employees JOIN dept_manager ON employees.emp_no = dept_manager.emp_no WHERE dept_manager.dept_no = (SELECT dept_emp.dept_no FROM dept_emp WHERE dept_emp.from_date < '1990-01-02' AND dept_emp.to_date > '1989-12-31' GROUP BY dept_emp.dept_no ORDER BY dept_emp.dept_no ASC LIMIT 1) AND dept_manager.from_date < '1990-01-02' AND dept_manager.to_date > '1989-12-31';

-- 14.What is the most common employee title in the company on 1.1.1990?
SELECT title, COUNT(emp_no) AS number_of_titles FROM titles WHERE from_date < '1990-01-02' AND to_date > '1989-12-31' GROUP BY title ORDER BY number_of_titles DESC LIMIT 1;

-- 15.How many people have the least common title on 1.1.1990?
SELECT title, COUNT(emp_no) AS number_of_titles FROM titles WHERE from_date < '1990-01-02' AND to_date > '1989-12-31' GROUP BY title ORDER BY number_of_titles ASC LIMIT 1;

-- 16.Which department has the least number of females on 1.1.1990?
SELECT departments.dept_name, COUNT(employees.gender) AS working_F FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE employees.gender = 'f' AND dept_emp.from_date < '1990-01-02' AND dept_emp.to_date > '1989-12-31' GROUP BY dept_emp.dept_no ORDER BY working_F ASC LIMIT 1;

-- 17.Continue with solving the SQL challenges of your fellow students. 





