-- Employee details with department & salary

SELECT e.name, d.dept_name, s.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;


--Average salary per department

SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;


--Top 3 highest-paid employees 

SELECT name, salary
FROM (
    SELECT e.name, s.salary,
           DENSE_RANK() OVER (ORDER BY s.salary DESC) AS rnk
    FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
) ranked
WHERE rnk <= 3;


--Best performing employees

SELECT e.name, AVG(p.rating) AS avg_rating
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY e.name
HAVING AVG(p.rating) >= 4;


--Employees earning above company average

SELECT e.name, s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.salary > (SELECT AVG(salary) FROM salaries);
