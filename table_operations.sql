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