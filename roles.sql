/* Use roles to represent user accounts

*/

-- Create role

CREATE ROLE role_1;

CREATE ROLE user_one login PASSWORD 'duke2030';

CREATE ROLE nikhil superuser login PASSWORD 'duke2030';

create role lester superuser login password 'lester2030';

CREATE ROLE api login PASSWORD 'securepass1' CONNECTION LIMIT 1000;
