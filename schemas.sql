/* Schema
a schema is a namespace that contains various named 
database objects such as tables, views, indexes, data types, 
functions, and operators. Schemas help in organizing and managing
these objects efficiently, especially in databases with complex
structures and multiple users.

schema_name.object_name

Public schema
By default, PostgreSQL creates a schema named ‘public’ in every database. Objects created without specifying a schema are automatically placed in the ‘public’ schema. Therefore, the following statements are equivalent:

CREATE TABLE table_name(...);
and

CREATE TABLE public.table_name(...);

Schema Operations
The below operations is allowed by PostgreSQL:

1. Creating a Schema
To create a new schema, you use the ‘CREATE SCHEMA’ statement.

CREATE SCHEMA schema_name;
2. Renaming a Schema or Changing Its Owner
To rename a schema or change its owner, you use the ‘ALTER SCHEMA’ statement.

ALTER SCHEMA schema_name RENAME TO new_schema_name;
ALTER SCHEMA schema_name OWNER TO new_owner;
3. Dropping a Schema
To drop a schema, you use the ‘DROP SCHEMA’ statement. You can specify ‘CASCADE’ to drop all objects within the schema or ‘RESTRICT’ to ensure the schema is only dropped if it is empty:

DROP SCHEMA schema_name CASCADE;
DROP SCHEMA schema_name RESTRICT;
*/

CREATE SCHEMA IF NOT EXISTS marketting;
DROP SCHEMA marketting;

ALTER SCHEMA marketting RENAME TO marketing;