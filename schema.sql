CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    emp_id INT,
    salary INT CHECK (salary > 0),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE performance (
    emp_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_year INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
