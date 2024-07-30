/*
Properties of Transaction
Now let’s see the ACID properties of a transaction:

Atomicity – This property ensures that all the transactions are complete. It follows all or none property
i.e the transaction should not be partially completed.
Consistency – This property ensures that all the transactions are consistent 
i.e after committing the transaction those changes are properly updated in the database or not.
Isolation – When two transactions are running then both the transactions will have their own privacy
 i.e one transaction won’t disturb another transaction.
Durability – This property ensures that even at the time of system failures the committed data in database is secure i.e 
permanently.

Begin, commit, rollback
*/

CREATE TABLE BankStatements(
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR NOT NULL,
    balance INT
);

SELECT * FROM bankstatements;

INSERT INTO bankstatements (customer_id, full_name, balance) VALUES
(1, 'Justin Kiamu', 200),(2, 'Kites Miranda', 300),
(3, 'Markie Kianje', 700);

SELECT * FROM bankstatements;

/*1. BEGIN
BEGIN command is used to initiate a transaction.
To start a transaction we should give BEGIN command at first if 
we don’t give it like that then the database cant able recognizes 
the transaction.
*/

BEGIN; -- initiate a transaction

    INSERT INTO bankstatements (
        customer_id,
        full_name,
        balance
    ) VALUES (
        8, 'Priya Chetri', 790
    );
COMMIT;

SELECT * FROM bankstatements;

-- Commit used to save changes and reflect to the database

BEGIN;

    UPDATE bankstatements SET balance = balance - 200
    WHERE customer_id = 1;

    SELECT customer_id, full_name, balance FROM bankstatements;
    
    UPDATE bankstatements SET balance = balance + 700 WHERE customer_id = 2;
    
COMMIT;


SELECT customer_id, full_name, balance FROM bankstatements;

--  ROLLBACK
-- ROLLBACK command is used to undo the changes done in transactions. 

BEGIN;

DELETE FROM bankstatements WHERE customer_id = 2;

SELECT customer_id, full_name, balance FROM bankstatements;
UPDATE bankstatements SET balance = 90000 WHERE customer_id = 2;

ROLLBACK;

SELECT customer_id, full_name, balance FROM bankstatements;

-- primary Key -> a column which is used to identify a row in a table uniquely
-- combines the not null constraint and unique constraint
-- each table can have only one primary key


CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    price INTEGER
);


INSERT INTO books (book_id, title, price) VALUES
(1, 'The algebra', 300),
(2, 'Calculus 3', 3400),
(3, 'AI and machine learning', 800);


SELECT * FROM books;

CREATE TABLE vendors (
    name VARCHAR(90)
);

INSERT INTO vendors (name) VALUES 
    ('Microsoft'),('Google'), ('Lester Enterprises');


ALTER TABLE vendors ADD COLUMN vendor_id SERIAL PRIMARY KEY;
ALTER TABLE vendors DROP COLUMN vendor_id;

ALTER TABLE vendors ADD COLUMN vendor_id bigserial PRIMARY KEY;

SELECT * FROM vendors;


/* FOREIGN KEY
A column which uniquely identifies a row in a different table
Table with the foreign key is the child table or refrencing table.
while the table being refrenced is the parent table.
A table can have multiple foreign keys.

syntax:
FOREIGN KEY (column) REFERENCES parent_table (table_name)
*/

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS contacts;

CREATE TABLE customers(
    customer_id INT generated always as identity,
    customer_name VARCHAR NOT NULL,
    PRIMARY KEY(customer_id)
);


CREATE TABLE contacts(
    contact_id INT generated always as identity,
    customer_id INT,
    contact_name VARCHAR NOT NULL,
    phone VARCHAR,
    email VARCHAR(100),
    PRIMARY KEY(contact_id),
    constraint fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers(customer_name)
VALUES('GeeksforGeeks org'),
      ('Dolphin LLC');       
       
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES (1, 'Raju kumar', '(408)-111-1234', 'raju.kumar@geeksforgeeks.org'),
               (1, 'Raju kumar', '(408)-111-1235', 'raju.kumar@bluebird.dev'),
               (2, 'Nikhil Aggarwal', '(408)-222-1234', 'nikhil.aggarwalt@geeksforgeeks.org');
               
CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
    contact_id INT GENERATED ALWAYS AS IDENTITY,
    customer_id INT,
    contact_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(contact_id),
    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id) 
    REFERENCES customers(customer_id)
    ON DELETE SET NULL
);

INSERT INTO customers(customer_name)
VALUES('GeeksforGeeks org'),
    ('Dolphin LLC');       

INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1, 'Raju Kumar', '(408)-111-1234', 'raju.kumar@geeksforgeeks.org'),
    (1, 'Raju Kumar', '(408)-111-1235', 'raju.kumar@bluebird.dev'),
    (2, 'Nikhil Aggarwal', '(408)-222-1234', 'nikhil.aggarwal@geeksforgeeks.org');


SELECT * FROM customers;

DELETE FROM customers WHERE customer_id = 1;


-- Check Constraint

-- used to check if a value in a column meets a condition (uses boolean)
-- syntax: variable_name data_type CHECK(expression)

DROP TABLE owners;
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(100),
    birth_date DATE CHECK (birth_date > '1990-01-01'),
    joined_date DATE CHECK (joined_date > birth_date),
    salary NUMERIC CHECK (salary > 0)
);


INSERT INTO owners (first_name, last_name, birth_date, joined_date, salary)
VALUES (
    'mikey', 'mikey', '1994-01-01', '2024-02-09', 78000
);

SELECT * FROM owners;

