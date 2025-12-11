CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

CREATE TABLE Subjects (
subject_name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50)
);

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

select s1.student_id,s1.student_name,e1.subject_name,count(e1.subject_name) as 
attended_exams
from(
select t1.student_id,t1.student_name,t2.subject_name
from Students t1
cross join
Subjects t2
) as s1
inner join
Examinations e1
on s1.student_id = e1.student_id
and s1.subject_name = e1.subject_name
group by s1.student_id,s1.student_name,e1.subject_name
order by student_id
