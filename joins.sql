/* JOIN is used to combine data or rows from one or more tables based on a common field.
-- Foregin keys and the primary key
Types of JOINS
    Inner Join
    Left Join
    Right Join
    Full Outer Join
*************
Special Joins
*************
Natural JOIN
Cross JOIN
Self JOIN

*/

CREATE Table zoo (
    id INT  PRIMARY KEY,
    animal VARCHAR(90) NOT NULL
);

CREATE TABLE zoo_two (
    id INT PRIMARY KEY,
    animal VARCHAR(100) NOT NULL
);

INSERT INTO zoo (id, animal) VALUES 
(1, 'Elephant'), (2, 'Lion'), (3, 'Tiger'), (4, 'Wolf');
SELECT * FROM zoo;


INSERT INTO zoo_two (id, animal) VALUES
(1, 'Zebra'), (2, 'Lion'), (3, 'Cat'), (4, 'Tiger');

SELECT * FROM zoo_two;

-- Inner Join -> Joins the left table with the right table using the values in a common column

SELECT zoo.id id_a, zoo.animal animal_a, zoo_two.id id_b, zoo_two.animal animal_b
FROM zoo
INNER JOIN zoo_two ON zoo.animal = zoo_two.animal;

-- Left Join

SELECT zoo.id, zoo.animal, zoo_two.id, zoo_two.animal
FROM zoo LEFT JOIN zoo_two ON zoo.animal = zoo_two.animal;


-- Right Join

SELECT zoo.id, zoo.animal, zoo_two.id, zoo_two.animal FROM zoo
RIGHT JOIN zoo_two ON zoo.animal = zoo_two.animal;

-- full outer join
SELECT zoo.id, zoo.animal, zoo_two.id, zoo_two.animal FROM zoo
FULL JOIN zoo_two ON zoo.animal = zoo_two.animal;

/*  LEFT JOIN
Combining tow or more tables.
Returns matching tables columns from the left table and right table
-
sytanx


SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
LEFT JOIN table2
ON table1.matching_column = table2.matching_column;

table1: The primary table from which you want to select data.
table2: The secondary table that you want to join with the primary table.
matching_column: The common column between the two tables on which the join condition is based.


*/

SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE
    inventory.film_id IS NULL;

SELECT
    film.film_id,
    film.title,
    inventory_id
FROM
    film
LEFT JOIN inventory ON inventory.film_id = film.film_id;


/* INNER JOIN keyword selects all rows from both the 
tables as long as the condition satisfies
Syntax:
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
INNER JOIN table2
ON table1.matching_column = table2.matching_column;


table1: First table.
table2: Second table
matching_column: Column common to both the tables.

*/

SELECT * FROM customers;

-- names with d
SELECT * FROM students;
SELECT * FROM names_with_d;


SELECT students.id id, students.first_name name, students.last_name
FROM students
LEFT JOIN names_with_d ON students.first_name = names_with_d.first_name;


SELECT students.id, students.first_name, students.last_name
FROM students
INNER JOIN students_start_with_d ON students.last_name = students_start_with_d.first_name;


SELECT students.id, students.first_name, students.last_name
FROM students
INNER JOIN students_start_with_d ON students.last_name = students_start_with_d.first_name
WHERE students.last_name LIKE '%n';


SELECT students.id, students.first_name, students.last_name
FROM students
INNER JOIN students_start_with_d ON students.last_name = students_start_with_d.first_name
WHERE students.last_name LIKE '%n';

-- joining three tables
SELECT * FROM my_students;

SELECT students.id, students.first_name, students.last_name
FROM students
INNER JOIN students_start_with_d ON students.first_name = students_start_with_d.first_name
INNER JOIN names_with_d ON students_start_with_d.last_name = names_with_d.last_name;


/*
FULL OUTER JOIN, also known as FULL JOIN, combines the results of both LEFT JOIN and RIGHT JOIN. This join type retrieves
all rows from both tables involved, including unmatched rows where applicable, filling in NULL values for columns that
do not have a match.
SELECT table1.column1, table1.column2, table2.column1, ....
FROM table1 
FULL JOIN table2 ON table1.matching_column = table2.matching_column;

*/

SELECT * FROM employees;

SELECT *
FROM students s
FULL OUTER JOIN employees e on e.first_name = s.first_name;


/* SELF JOIN 
is used to join a table with itself. It comes in handy when comparing 
the column of rows within the same table.
Syntax:
SELECT column_list
FROM table_name T1
INNER JOIN table_name T2 ON join_predicate;

or,

Syntax:
SELECT column_list
FROM table_name T1
LEFT JOIN table_name T2 ON join_predicate;

or,

Syntax:
SELECT column_list
FROM table_name T1
RIGHT JOIN Table_name T2 ON join_predicate;
*/

SELECT e.first_name || ' ' || e.last_name,
m.first_name || ' ' || m.last_name
FROM
employees e
INNER JOIN employees m ON m.employee_id = e.employee_id;