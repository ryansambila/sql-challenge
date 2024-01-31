--Create Employee table
CREATE TABLE employees (
    emp_no INTEGER  NOT NULL PRIMARY KEY,
    emp_title_id CHAR (5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR (20)   NOT NULL,
    last_name VARCHAR (20)  NOT NULL,
    sex CHAR (1) NOT NULL,
    hire_date DATE NOT NULL)
	
--Create title table
CREATE TABLE title (
    title_id CHAR (5) NOT NULL PRIMARY KEY,
    title VARCHAR (20) NOT NULL)

--Create salaries table
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL PRIMARY KEY,
    salary INTEGER NOT NULL)

-- Create the Department table
CREATE TABLE departments ( 
	dept_no CHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL)

-- Create the Dept Manager table
CREATE TABLE dept_manager ( 
	dept_no CHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL PRIMARY KEY)

-- create the dept employee
CREATE TABLE dept_employee (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no))
	
-- Add Constraints

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no)

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES title (title_id)

ALTER TABLE dept_manager ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no)

ALTER TABLE dept_manager ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no)


--Import in this order
-- #1-Title
-- #2-departments
-- #3-employees
-- #4-Salaries
-- #5-dept_manager
-- #6dept_employee

select * from title
select * from departments
Select * from employees
Select * from Salaries
select * from dept_manager
select * from dept_employee