CREATE TABLE Triangle (
	x INT,
	y INT,
	z INT,
	PRIMARY KEY (x, y, z)
);
 
INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);

select x,y,z,(case when
x+y > z and y+z > x and x+z > y
then 'Yes'
else 'No' end) as Triangle_formed
from Triangle


