-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/iH9lTo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Updated code with PRIMARY KEYS and FOREIGN KEYS to use in pgAdmin

CREATE TABLE titles (
    title_id VARCHAR(6) NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(6) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Original code from QuickDBD

-- CREATE TABLE "departments" (
--     "dept_no" VARCHAR(4)   NOT NULL,
--     "dept_name" VARCHAR(255)   NOT NULL
-- );

-- CREATE TABLE "dept_emp" (
--     "emp_no" INT   NOT NULL,
--     "dept_no" VARCHAR(4)   NOT NULL
-- );

-- CREATE TABLE "dept_manager" (
--     "dept_no" VARCHAR(4)   NOT NULL,
--     "emp_no" INT   NOT NULL
-- );

-- CREATE TABLE "employees" (
--     "emp_no" INT   NOT NULL,
--     "emp_title_id" VARCHAR(6)   NOT NULL,
--     "birth_date" DATE   NOT NULL,
--     "first_name" VARCHAR(255)   NOT NULL,
--     "last_name" VARCHAR(255)   NOT NULL,
--     "sex" CHAR(1)   NOT NULL,
--     "hire_date" DATE   NOT NULL
-- );

-- CREATE TABLE "salaries" (
--     "emp_no" INT   NOT NULL,
--     "salary" INT   NOT NULL
-- );

-- CREATE TABLE "titles" (
--     "title_id" VARCHAR(6)   NOT NULL,
--     "title" VARCHAR(255)   NOT NULL
-- );

-- ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "dept_emp" ("dept_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no_dept_no" FOREIGN KEY("emp_no", "dept_no")
-- REFERENCES "dept_manager" ("emp_no", "dept_no");

-- ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "salaries" ("emp_no");

-- ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
-- REFERENCES "titles" ("title_id");

