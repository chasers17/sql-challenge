--PART 1: DATA ENGINEERING

--create department table
CREATE TABLE departments(
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- Populate table
COPY departments FROM 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\departments.csv' DELIMITER ',' CSV HEADER;

--create department employees table
CREATE TABLE department_employees(
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Populate table
COPY department_employees FROM 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

-- Add serial id column to create primary key
ALTER TABLE department_employees ADD COLUMN id SERIAL;
ALTER TABLE department_employees ADD PRIMARY KEY (id);

-- Create department_managers table
CREATE TABLE dept_managers(
	dept_no VARCHAR (30) NOT NULL,
	emp_no VARCHAR (30) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--Populate table
COPY dept_managers FROM 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

--Create titles table
CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

--Populate table
COPY titles from 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\titles.csv' DELIMITER ',' CSV HEADER;

-- Create employees table
CREATE TABLE employees(
	emp_no VARCHAR(30) NOT NULL,
	emp_title VARCHAR(30) NOT NULL,
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) references titles (title_id)
);

--Populate table
COPY employees FROM 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\employees.csv' DELIMITER ',' CSV HEADER;

--Create salaries table
CREATE TABLE salaries(
	emp_no VARCHAR(30) NOT NULL,
	salary VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Populate table
COPY salaries FROM 'C:\Users\Chase\Data_Bootcamp\NU-VIRT-DATA-PT-02-2023-U-LOLC\02-Homework\09-SQL\Starter_Code\data\salaries.csv' DELIMITER ',' CSV HEADER;

