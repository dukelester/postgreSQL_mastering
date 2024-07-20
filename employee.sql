CREATE TABLE employee (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    employee_name VARCHAR(200),
    employee_phone VARCHAR(12),
    employee_salary NUMERIC(6, 3),
    is_active BOOLEAN DEFAULT false,
    employee_start_date DATE
);

INSERT INTO employee (employee_name, employee_phone, employee_salary, employee_start_date, is_active)
VALUES
('duke lester', '0799443070', 670.99672, '2023-04-01', TRUE),
('Jhames lester', '0700943070', 670.99672, '2023-04-01', TRUE),
('Keny Mogusu', '078775625', 994.2234, '2024-06-01', FALSE),
('Jane Kevta', '078452223', 872.89833, '2023-03-01', TRUE);

SELECT * FROM employee;


CREATE TABLE team_schedule (
    id serial PRIMARY KEY,
    team_name VARCHAR NOT NULL,
    clock_in_time TIME NOT NULL,
    clock_out_time TIME NOT NULL
);

INSERT INTO team_schedule(team_name, clock_in_time, clock_out_time)
VALUES
    ('Marketing', '09:34:00', '18:00:00'),
    ('Sales', '10:00:00', '19:00:00'),
    ('Mentors', '09:00:00', '18:00:00'),
    ('Software', '11:00:00', '20:00:00'),
    ('Software', '11:00:00', '20:00:00'),
    ('Software', '11:00:00', '20:00:00'),
    ('Software', '11:00:00', '20:00:00'),
    ('Content', '10:00:00', '19:00:00');


SELECT team_name, COUNT(*) from team_schedule  GROUP BY team_name;

SELECT * FROM team_schedule;


SELECT team_name, COUNT(*) from team_schedule GROUP BY team_name
HAVING COUNT(*) > 3;

SELECT DISTINCT team_name from team_schedule;


SELECT team_name from team_schedule UNION SELECT employee_name from employee;

SELECT employee_name, employee_salary from employee ORDER BY employee_salary;

SELECT employee_salary, COUNT(*) from employee GROUP BY employee_salary;


SELECT * FROM team_schedule ORDER BY team_name ASC;

SELECT team_name, LENGTH(team_name) from team_schedule ORDER BY LENGTH(team_name) DESC;


SELECT clock_in_time, clock_out_time from team_schedule WHERE team_name = 'Software';


SELECT employee_name, employee_phone FROM employee where employee_name ='duke lester' AND employee_salary > 600;

SELECT employee_name, employee_phone, employee_start_date FROM employee WHERE
employee_name = 'duke' OR employee_salary > 650;

SELECT employee_name, employee_phone FROM employee WHERE employee_name IN (
    'duke lester', 'james kingori', 'martin mngeshi', 'Keny Mogusu' 
);


-- Like
SELECT * FROM employee WHERE employee_name LIKE 'K%' or employee_name LIKE 'd';

-- between

SELECT * from employee where employee_salary BETWEEN 300 AND 700;

SELECT * FROM employee WHERE  employee_name LIKE 'J%' OR LENGTH(employee_name) BETWEEN 12 and 30;

-- not equal to

SELECT * from employee WHERE employee_salary != 0;

SELECT employee_name, employee_phone, employee_salary FROM employee
WHERE LENGTH(employee_name) > 34 AND LENGTH(employee_phone) = 12 or employee_salary != 994.223;

-- Fetch
SELECT * FROM employee WHERE employee_name in ('duke lester', 'jane', 'kamau thiongo' ) ORDER  BY employee_name LIMIT 2 ;

-- Using the subquery
SELECT * FROM employee WHERE employee_name in (SELECT employee_name from employee ) ORDER BY employee_name LIMIT 2 ;



SELECT * FROM employee; 