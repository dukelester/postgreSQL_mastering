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