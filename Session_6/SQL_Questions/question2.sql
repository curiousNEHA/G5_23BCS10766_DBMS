CREATE TABLE UserProfile (
    user_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO UserProfile (user_ID, Name, Age, Email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');


UPDATE UserProfile
SET Email = 'duplicate email'
WHERE user_ID IN (
SELECT t1.user_ID
FROM UserProfile t1
JOIN UserProfile t2
ON t1.Email = t2.Email
 AND t1.user_ID < t2.user_ID
);


SELECT * FROM UserProfile;









