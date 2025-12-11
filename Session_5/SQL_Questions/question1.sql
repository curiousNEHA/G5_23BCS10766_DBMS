CREATE TABLE Employees (
 emp_id INT PRIMARY KEY,
 name VARCHAR(50),
  dept_id INT,
  salary INT
);


CREATE TABLE Departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
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


select d.dept_name,count(e.name) as EmployeeCount,avg(e.salary) as AvgSalary,
(case when avg(e.salary) >= 60000 then 'High
Average'
when avg(e.salary) >= 59999 and avg(e.salary)<=50000 then 'Medium Average'
when avg(e.salary) < 50000 then 'Low Average'
else 'No employess'
end
) as Salary
from
Departments d
left join
Employees e
on e.dept_id = d.dept_id
group by d.dept_name


