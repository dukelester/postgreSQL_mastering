/* IF STATEMENT
IF statement executes `statements` if a condition is true.
If the condition evaluates to false, the control is passed
to the next statement after the END IF part.

if condition then staements end if;
*/

DO $$
DECLARE
  a integer := 10;
  b integer := 20;
BEGIN 
  IF a > b THEN
    RAISE NOTICE 'a is greater than b';
  END IF;

  IF a < b THEN
    RAISE NOTICE 'a is less than b';
  END IF;

  IF a = b THEN
    RAISE NOTICE 'a is equal to b';
  END IF;
END $$;

DO $$
DECLARE
   a integer := 10;
   b integer := 10;
BEGIN 
  IF a > b THEN 
     RAISE NOTICE 'a is greater than b';
  ELSIF a < b THEN
     RAISE NOTICE 'a is less than b';
  ELSE
     RAISE NOTICE 'a is equal to b';
  END IF;
END $$;

CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
   RETURNS VARCHAR(50) AS $$
DECLARE 
    rate   NUMERIC;
    price_segment VARCHAR(50);
BEGIN
      -- get the rate based on film_id
    SELECT INTO rate rental_rate 
    FROM film 
    WHERE film_id = p_film_id;
        
     CASE rate
    WHEN 0.99 THEN
            price_segment = 'Mass';
    WHEN 2.99 THEN
            price_segment = 'Mainstream';
    WHEN 4.99 THEN
            price_segment = 'High End';
    ELSE
        price_segment = 'Unspecified';
    END CASE;
    
   RETURN price_segment;
END; $$
LANGUAGE plpgsql;

SELECT get_price_segment(123) AS "Price Segment";