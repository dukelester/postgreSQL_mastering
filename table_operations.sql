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