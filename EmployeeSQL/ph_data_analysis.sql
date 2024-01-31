-- Question 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT  
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name" ,
	e.first_name AS "First Name",
	e.sex AS "Sex",
	s.salary AS "Salary" 

FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no;

--Question 2: List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT  
	e.first_name AS "First Name",
	e.last_name AS "Last Name" ,
	e.hire_date AS "Hire Date"

FROM employees e
JOIN salaries s on s.emp_no = e.emp_no 
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--Question 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	dm.dept_no AS "Department #",
	dn.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"

FROM dept_manager dm
JOIN departments dn on dn.dept_no = dm.dept_no
JOIN employees e on e.emp_no = dm.emp_no;

--Question 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select 
	de.dept_no AS "Department #",
	de.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dn.dept_name AS "Department Name"

FROM dept_employee de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments dn on dn.dept_no = de.dept_no;

--Question 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT  
	e.first_name AS "First Name",
	e.last_name AS "Last Name" ,	
	e.sex AS "Sex"

FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
Where e.first_name = 'Hercules' and e.last_name like 'B%';

--Question 6: List each employee in the Sales department, including their employee number, last name, and first name.

Select 
	de.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dn.dept_name AS "Department Name"

FROM dept_employee de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments dn on dn.dept_no = de.dept_no
WHERE dn.dept_name = 'Sales';

--Question 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select 
	de.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	dn.dept_name AS "Department Name"

FROM dept_employee de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments dn on dn.dept_no = de.dept_no
WHERE dn.dept_name IN ('Sales','Development');

--Question 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	e.last_name AS "Last Name",
	COUNT(e.last_name) as "Name Count"

FROM employees e
GROUP BY e.last_name
ORDER BY "Name Count" DESC