-- Display the departments table
SELECT * FROM departments;

-- Display the titles table
SELECT * FROM titles;

-- Display the employees table
SELECT * FROM employees;

-- Display the salaries table
SELECT * FROM salaries;

-- Display the dept_emp table
SELECT * FROM dept_emp;

-- Display the dept_manager table
SELECT * FROM dept_manager;

-- 1. Find the employee number, last name, first name, sex, and salary of each employee
-- Used an INNER JOIN between employees and salaries tables and ordered them by emp_no for readability
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
ON e.emp_no = s.emp_no
ORDER BY emp_no;

-- 2. Find the first name, last name, and hire date for the employees who were hired in 1986
-- Ordered it in ascending order for easy readability 
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. Find the manager of each department along with their department number, department name, 
-- employee number, last name, and first name
-- Ordered it, in Ascending order by dept_no for easy readability
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager 
ON e.emp_no = dept_manager.emp_no
JOIN departments AS d 
ON d.dept_no = dept_manager.dept_no
ORDER BY dept_no;

-- 4. Find the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name
-- Ordered it, in Ascending order by dept_no for easy readability
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees AS e
JOIN dept_emp 
ON e.emp_no = dept_emp.emp_no
JOIN departments AS d 
ON d.dept_no = dept_emp.dept_no
ORDER BY dept_no;

-- 5. Find first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B
-- Ordered it, in Ascending order by last name for easy readability
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- 6. Find each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp 
ON e.emp_no = dept_emp.emp_no
JOIN departments AS d 
ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';
 
-- 7. Find each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp 
ON e.emp_no = dept_emp.emp_no
JOIN departments AS d 
ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. Find the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS "Frequency of Last Name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;



