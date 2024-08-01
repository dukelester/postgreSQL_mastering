/* Use roles to represent user accounts

*/

-- Create role

CREATE ROLE role_1;

CREATE ROLE user_one login PASSWORD 'duke2030';

CREATE ROLE nikhil superuser login PASSWORD 'duke2030';

create role lester superuser login password 'lester2030';

CREATE ROLE api login PASSWORD 'securepass1' CONNECTION LIMIT 1000;

-- ALTER ROLE
-- ALTER ROLE role_name [WITH] option;

CREATE ROLE ravi login PASSWORD 'geeks12345';

ALTER ROLE ravi superuser;

ALTER ROLE ravi VALID UNTIL '2024-10-08';

ALTER ROLE ravi CREATEDB;

ALTER ROLE ravi createrole;
ALTER ROLE ravi CONNECTION LIMIT 20000;
-- DROP ROLE
-- DROP ROLE [IF EXISTS] target_role;

DROP ROLE if EXISTS test;

DROP ROLE if EXISTS role_1;

DROP ROLE if EXISTS user_one, nikhil;

-- GRANT
-- GRANT statement is a powerful tool used to assign privileges to a role, allowing it to alter database objects like tables, views, functions, and more.
/* Syntax
GRANT privilege_list | ALL 
ON  table_name
TO  role_name;
*/

CREATE ROLE anshul login PASSWORD 'duke2030';


CREATE Table players (
    player_id INT generated always as identity,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(player_id)
);

SELECT * FROM players;

-- grant select prevellages

GRANT SELECT ON players to anshul;
INSERT INTO players(first_name, last_name, email, phone)
VALUES('raju', 'kumar', 'raju.kumar@geeksforgeeks.org', '408-111-2222');


GRANT INSERT, UPDATE, DELETE ON players TO anshul;

INSERT INTO players(first_name, last_name, email, phone)
VALUES('kenny', 'mokie', 'jas.kumar@lester.org', '408-333-2222');

INSERT INTO players(first_name, last_name, email, phone)
VALUES('mokie', 'mary', 'mary.jase@lester.org', '408-787-2292');

CREATE ROLE dlester login PASSWORD 'lester';