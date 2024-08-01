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

-- INTERSECT Operator
/*
used to combine two or more result sets returned by SELECT statements and return the
common data among the tables into a single result set. This is useful for identifying
overlapping data between tables.
SELECT
    column_list
FROM A
INTERSECT
SELECT
    column_list
FROM B;
*/

CREATE TABLE agent(
    agent_id serial PRIMARY KEY,
    agent_name VARCHAR (255) NOT NULL
);
CREATE TABLE op_CHI(
    agent_id INT PRIMARY KEY,
    active_date DATE NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES agent (agent_id)
);
CREATE TABLE op_PAk(
    agent_id INT PRIMARY KEY,
    active_date DATE NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES agent (agent_id)
);
INSERT INTO agent(agent_name)
VALUES
    ('Tiger'),
    ('James Bond'),
    ('Jason Bourne'),
    ('Ethan Hunt'),
    ('Ajit Doval'),
    ('Rowdy Rathore'),
    ('Milkha Singh'),
    ('Tom Hanks'),
    ('Sabana'),
    ('Razia Sultan');

INSERT INTO op_chi
VALUES
    (1, '2000-02-01'),
    (2, '2001-06-01'),
    (5, '2002-01-01'),
    (7, '2005-06-01');

INSERT INTO op_pak
VALUES
    (9, '2000-01-01'),
    (2, '2002-06-01'),
    (5, '2006-06-01'),
    (10, '2005-06-01');

SELECT agent_id FROM op_chi
INTERSECT
SELECT agent_id FROM op_pak;

SELECT agent_id FROM op_chi
INTERSECT
SELECT agent_id FROM op_pak
ORDER BY agent_id;
