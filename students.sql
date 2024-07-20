SELECT * from students LIMIT 100;

SELECT * FROM students WHERE first_name LIKE 'D%';
SELECT first_name, COUNT(first_name) FROM students WHERE first_name LIKE 'D%' GROUP BY first_name;

SELECT COUNT(last_name) FROM students WHERE first_name = 'Derek';

SELECT last_name, COUNT(first_name) FROM students WHERE last_name LIKE '%der' GROUP BY last_name;

SELECT first_name, last_name, COUNT(first_name) FROM students WHERE first_name = 'Alvin' and last_name = 'Harmon' GROUP BY first_name, last_name;

SELECT * FROM students ORDER BY LENGTH(last_name) DESC LIMIT 2 ;


SELECT * FROM students WHERE last_name LIKE '_her%';

SELECT * FROM students WHERE last_name LIKE '%e___';
SELECT * FROM students WHERE last_name LIKE '%e__';
SELECT * FROM students WHERE last_name LIKE '%e_';

-- Between
SELECT first_name, last_name FROM students WHERE LENGTH(first_name) BETWEEN 2 AND 10;

SELECT first_name, last_name, COUNT(first_name) FROM students
WHERE LENGTH(first_name) BETWEEN 10 AND 15 GROUP BY first_name, last_name;

-- date yyy-mm-dd format