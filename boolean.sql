CREATE TABLE availability(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255),
    available BOOLEAN DEFAULT false
);
COMMENT ON TABLE availability IS 'Check if the dvd is available';
COMMENT ON COLUMN availability.name IS 'name of the dvd';
COMMENT ON COLUMN availability.available IS 'Available or not'

INSERT INTO availability (create_time, name, available) VALUES
('02-09-2023', 'Commando', FALSE),('03-06-2021', 'How to play', TRUE),
('07-06-2021', 'How to play a piano', '0'),('07-08-2021', 'How to play music','1');

SELECT * FROM availability WHERE available = TRUE;
SELECT * FROM availability;


SELECT * FROM availability WHERE NOT available; -- false
SELECT * FROM availability WHERE available;