-- CASE - allowas to perfom conditional operations within the sql queries.
-- it evaluates a list of conditions and return results when the first condition is met

/* The Case general form
CASE 
    WHEN condition_1  THEN result_1
    WHEN condition_2  THEN result_2
    [WHEN ...]
    [ELSE result_n]
END
*/

/* The simple form
CASE expression
    WHEN value_1 THEN result_1
    WHEN value_2 THEN result_2 
    [WHEN ...]
    ELSE result_n
END;
*/

SELECT 
    SUM(
        CASE
            WHEN rental_rate = 0.99 THEN 1
        ELSE 0
        END
    ) AS "Mass",
    SUM(
        CASE
            WHEN rental_rate = 2.99 THEN 1
        ELSE 0
        END
    ) AS "Economic",
    SUM(
        CASE
        WHEN rental_rate = 4.99 THEN 1
        ELSE 0
        END
    ) AS "Luxury"
FROM film;

SELECT * FROM employee;

SELECT 
    SUM(
        CASE 
        WHEN LENGTH(employee_name) > 12 THEN 1
        ELSE 0
        END
    ) AS "longer_names",
    SUM(
        CASE
        WHEN LENGTH(employee_name) < 12 THEN 1
        ELSE 0
        END
        ) AS "shorter_names"
FROM employee;

SELECT 
    SUM(
        CASE 
        WHEN LENGTH(first_name) > 10 THEN 1
        ELSE 0
        END
    ) AS "longer_names",
    SUM(
        CASE
        WHEN LENGTH(last_name) < 8 THEN 1
        ELSE 0
        END
        ) AS "shorter_names"
FROM students;


SELECT 
    AVG(
        CASE 
        WHEN LENGTH(first_name) > 10 THEN 1
        ELSE 0
        END
    ) AS "longer_names",
    AVG(
        CASE
        WHEN LENGTH(last_name) < 8 THEN 1
        ELSE 0
        END
        ) AS "shorter_names"
FROM students;