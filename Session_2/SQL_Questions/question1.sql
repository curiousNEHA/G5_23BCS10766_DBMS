CREATE TABLE person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

INSERT INTO person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

delete from person
where id in
(select p1.id
from
person p1
join
person p2
on p1.id > p2.id and p1.email = p2.email)

