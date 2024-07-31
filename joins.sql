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

