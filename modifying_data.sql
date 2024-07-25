-- Insert  > adds new rows to a database
-- INSERT INTO table_name(column1, column2, ...) VALUES (value1, value2, ...)

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    phone VARCHAR UNIQUE,
    manager_id INT,
    email VARCHAR UNIQUE NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES
    employees (employee_id) on delete CASCADE
    
);


SELECT * FROM employees;

INSERT INTO employees 
(employee_id, first_name, last_name, phone, manager_id, email) 
VALUES
(1, 'duke', 'lester', '073424522', 1, 'lester4@gmail.com'),
(33, 'kenny', 'matyser', '073044522', 1, 'lester34@gmail.com'),
(45, 'kims', 'mark', '078393522', 5, 'jester334@gmail.com'),
(5, 'janes', 'master', '070924522', 6, 'eight@gmail.com'),
(6, 'mathews', 'jester', '0790424522', 5, 'makr4@gmail.com');

SELECT * FROM employees;

