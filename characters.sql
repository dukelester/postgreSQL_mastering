CREATE TABLE dvd_details (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    dvd_name CHAR(90),
    dvd_serial INTEGER
);

INSERT INTO dvd_details (dvd_name, dvd_serial) VALUES ('Jason Mwaibe', 3673737),
('the kimberly', 9063), ('The black road', 8383);

SELECT * FROM dvd_details;

CREATE TABLE family_names (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    family_name VARCHAR(90),
    location VARCHAR(100),
    members INTEGER
);

INSERT into family_names (family_name, location, members) VALUES
('The njugunas', 'Kiambu', 4), ('the Royals', 'Nairobi', 7),
('The Kims', 'Thika', 6);


SELECT * FROM family_names where members > 3;
SELECT * FROM family_names LIMIT 2;