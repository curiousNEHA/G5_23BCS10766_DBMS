--1---
create table client_masters(
client_id int primary key,
client_name varchar(20),
email varchar(40)
);
create table service_cataloges(
service_id int primary key,
service_name varchar(40),
hourly_rate int
);
CREATE TABLE invoice_detail (
    invoice_id INT PRIMARY KEY,
    client_id INT REFERENCES client_masters(client_id),
    service_id INT REFERENCES service_cataloges(service_id),
    hours_worked INT,
    discount_percent INT,
    invoice_date DATE
);

INSERT INTO client_masters (client_id, client_name, email) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Anita Verma', 'anita@gmail.com'),
(3, 'Karan Singh', 'karan@gmail.com');

INSERT INTO service_cataloges (service_id, service_name, hourly_rate) VALUES
(101, 'Web Development', 1200.00),
(102, 'Data Analysis', 1500.00),
(103, 'SEO Optimization', 800.00);

INSERT INTO invoice_detail (invoice_id, client_id, service_id, hours_worked, discount_percent, invoice_date) VALUES
(1001, 1, 101, 10, 10, '2025-01-05'),
(1002, 2, 102, 8,  5,  '2025-01-07'),
(1003, 3, 103, 12, 0,  '2025-01-10');

select * from invoice_detail;
select * from service_cataloges;
select * from client_masters;

--2------
CREATE VIEW VW_INVOICE_SUMMARY AS 
SELECT I.invoice_id,
I.invoice_date,
C.client_name,
S.service_name,
CAST(((S.hourly_rate * I.hours_worked) * (100 - I.discount_percent)) / 100 AS DECIMAL(10,2)) AS total
FROM invoice_detail I
JOIN client_masters C ON I.client_id = C.client_id
JOIN service_cataloges S ON I.service_id = S.service_id;


SELECT * FROM VW_INVOICE_SUMMARY

---3-----
CREATE  ROLE ARJUN
WITH LOGIN PASSWORD 'Neha@123'

GRANT SELECT ON VW_INVOICE_SUMMARY TO ARJUN

REVOKE SELECT ON VW_INVOICE_SUMMARY FROM ARJUN

SELECT CURRENT_USER
