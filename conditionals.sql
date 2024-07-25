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

-- COALESCE  -> used to handle the NULL values in the database

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    product VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC
);

INSERT INTO items (product, price, discount)
VALUES
    ('A', 100, 10),
    ('B', 1500, 23),
    ('C', 300, 6),
    ('D', 6000, NULL);

SELECT * FROM items;

SELECT product, (price - discount) as net_price from items;

ALTER table items ADD COLUMN quantity INTEGER;

UPDATE items SET quantity = 20 WHERE price = 6000;
UPDATE items SET quantity = 30 WHERE price = 300;
UPDATE items SET quantity = 70 WHERE price = 100;
UPDATE items SET quantity = 15 WHERE price = 1500;

SELECT * FROM items;

SELECT *, (price * quantity) as total_cost FROM items;

SELECT product, (price - COALESCE(discount, 0)) as net_price FROM items;
