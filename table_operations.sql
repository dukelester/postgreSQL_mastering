-- Table Operations, create, update, delete, alter etc

-- create table
/*
CREATE TABLE table_name (
    column_name TYPE column_constraint,
    table_constraint table_constraint
) INHERITS existing_table_name;

*/

CREATE Table account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    created_on DATE NOT NULL,
    last_login TIMESTAMP NOT NULL
);

CREATE TABLE role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_role (
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    grant_date TIMESTAMP without time zone,
    PRIMARY KEY (user_id, role_id),
    constraint account_role_role_id_fkey FOREIGN KEY (role_id)
    REFERENCES role (role_id) match simple on update no action on delete
    no action,
    CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES account (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- SELECT INTO CLAUSE

/* SELECT
    column_list 
INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
FROM
    table_name
WHERE
    condition;
*/


SELECT first_name, last_name INTO Table names_with_d from students
WHERE first_name LIKE 'D%' ORDER BY first_name;

SELECT * FROM names_with_d;

SELECT first_name, last_name INTO temp TABLE names_with_m 
from students WHERE LENGTH(last_name) > 10 ORDER BY first_name;

SELECT * from names_with_m;

SELECT first_name, last_name INTO temp TABLE names_ending_with_e
from students WHERE LENGTH(last_name) > 10 and first_name LIKE '%__e' ORDER BY first_name;


SELECT * FROM names_ending_with_e;

-- Creating a sequence

CREATE SEQUENCE my_sequence INCREMENT 5 START 10;

SELECT nextval('my_sequence');

CREATE SEQUENCE three INCREMENT -1 MINVALUE 1 MAXVALUE 3 START 3 CYCLE;

SELECT nextval('three');

CREATE SEQUENCE range_values INCREMENT 10 MINVALUE 20 MAXVALUE 900 CYCLE;

SELECT nextval('range_values');

-- create a sequence asociated with a table column

CREATE Table purchase_details(
    purchase_id SERIAL,
    item_id INT NOT NULL,
    product_id INT,
    product_name TEXT NOT NULL,
    price DECIMAL(10, 2)  NOT NULL,
    PRIMARY KEY(purchase_id, item_id)
);

-- Create a sequence associated with the item id

CREATE SEQUENCE purchase_item_id START 10 INCREMENT 10 MINVALUE 10
OWNED BY purchase_details.item_id;

-- Insert data into the table
INSERT INTO 
    purchase_details(purchase_id, item_id, product_name, price)
VALUES
    (100, nextval('purchase_item_id'), 'DVD Player', 100),
    (100, nextval('purchase_item_id'), 'Android TV', 550),
    (100, nextval('purchase_item_id'), 'Speaker', 250);

SELECT * FROM purchase_details;

-- ALTER TABLE
-- Syntax: ALTER TABLE table_name action;

CREATE Table link(
    link_id SERIAL PRIMARY KEY,
    link_name VARCHAR(500) NOT NULL,
    url VARCHAR(1024) NOT NULL UNIQUE
);


ALTER TABLE link ADD COLUMN active_link BOOLEAN;
ALTER Table link add COLUMN is_visited BOOLEAN DEFAULT false;

-- Rremove the active link column

ALTER TABLE link DROP active_link;

ALTER Table link RENAME link_name to link_title;

ALTER Table link ADD COLUMN target VARCHAR(12);


ALTER TABLE link alter COLUMN target set DEFAULT '_blank';

INSERT INTO link (link_title, url)
VALUES('PostgreSQL Tutorial', 'https://www.geeksforgeeks.org/');
SELECT * FROM link;

-- ADD COLUMN
-- ALTER TABLE table_name
-- ADD COLUMN new_column_name data_type;

CREATE table village (
    village_id SERIAL PRIMARY KEY,
    village_name VARCHAR(200)
);

ALTER Table village ADD COLUMN district VARCHAR;
ALTER Table village ADD COLUMN zone VARCHAR(100);

ALTER Table village ADD COLUMN country VARCHAR(355);
ALTER Table village ADD COLUMN market VARCHAR(200);

SELECT * FROM village;

CREATE TABLE cars(
    car_id SERIAL PRIMARY KEY,
    car_name VARCHAR NOT NULL
);

ALTER Table cars ADD COLUMN model VARCHAR(300) DEFAULT 'toyota';

SELECT * FROM cars;

-- Drop column
-- alter table table_name drop column column_name

CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE categories(
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id serial PRIMARY KEY,
    title VARCHAR NOT NULL,
    isbn VARCHAR NOT NULL,
    published_date DATE NOT NULL,
    description VARCHAR,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);


SELECT * FROM publishers;

SELECT * FROM books;


ALTER TABLE books DROP COLUMN isbn;

SELECT * FROM books;

--  Rename Table
-- alter table table_name rename to new_name;

ALTER TABLE books RENAME TO my_books;


SELECT * FROM my_books;


-- Drop table
-- Drop table if exists table_name;

DROP Table if EXISTS table1;

SELECT * FROM "students";

DROP TABLE IF EXISTS my_books;

SELECT * FROM my_books;

-- Truncate Table to remoe data from large tables quickly
-- Truncate is more efficient than delete for a large table
-- Truncate table table_name;

SELECT * FROM students;


TRUNCATE TABLE link;

SELECT * FROM link;

-- Copy table
-- create table new_table as table old_table

CREATE TABLE my_students AS Table students;

SELECT * FROM my_students;
CREATE TABLE profile as table account;

-- Create with no data
CREATE TABLE other_studenst as table students with no data;

SELECT * FROM other_studenst;

ALTER TABLE other_studenst RENAME TO other_students;

-- Using the where clause

CREATE TABLE students_start_with_d as select * from students where first_name like 'D%';

SELECT * FROM students_start_with_d;

DROP Table students_start_with_d;


-- comparing tables
-- Comparison using EXCEPT and UNION operators

CREATE TABLE foo(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200)
);

INSERT INTO foo (name) VALUES
    ('foo'),('i am foo'), ('foo foo')
;

CREATE TABLE bar (
    id SERIAL PRIMARY KEY,
    name VARCHAR(230)
);

INSERT INTO bar (name) VALUES
    ('bar'),('i am bar'), ('bar bar')
;



