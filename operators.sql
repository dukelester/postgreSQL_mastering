/*UNION operator
tool used to combine result sets from multiple queries into a single result set. It helps in consolidating data from different sources,
making it easier to analyze and report.
SELECT
    column_1,
    column_2
FROM
    table_name_1
UNION
SELECT
    column_1,
    column_2
FROM
    table_name_2;
*/

CREATE TABLE sales2020q1(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    amount VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE sales2020q2(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    amount VARCHAR(50),
    PRIMARY KEY (id)
);
INSERT INTO sales2020q1(name, amount)
VALUES
    ('Raju Kumar', '121232'),
    ('Nikhil Aggarwal', '254789'),
    ('Abhishek Kelenia', '365487');

INSERT INTO sales2020q2(name, amount)
VALUES
    ('Raju Kumar', '457264'),
    ('Nikhil Aggarwal', '365241'),
    ('Abhishek Kelenia', '759864');

-- Union to combine the data from two tables

SELECT * FROM sales2020q1 UNION SELECT * FROM sales2020q2;

SELECT * FROM sales2020q1 UNION ALL SELECT * FROM sales2020q2
ORDER BY name ASC, amount DESC;


SELECT first_name, last_name FROM students UNION 
SELECT first_name, last_name FROM employees;

