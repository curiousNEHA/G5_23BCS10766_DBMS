--Q1
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);


CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

SELECT d.dept_name, e.name AS emp_name,e.salary,
(SELECT AVG(salary)::Numeric(30,0)
FROM Employees
WHERE dept_id = e.dept_id
) AS dept_avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.emp_id =
(SELECT emp_id
FROM Employees e2
WHERE e2.dept_id = e.dept_id
ORDER BY ABS(e2.salary - (SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id)
), e2.salary DESC LIMIT 1
);
