CREATE database lab4; --1

CREATE TABLE Warehouses --2
(
    code SERIAL PRIMARY KEY,
    location_character_varying VARCHAR(255),
    capacity_integer INT
);

INSERT INTO Warehouses(location_character_varying, capacity_integer)
VALUES
    ('Chicago', 3),
    ('Chicago', 4),
    ('New York', 7),
    ('Los Angeles', 2),
    ('San Francisco', 8);

CREATE TABLE Boxes --2
(
    code_character VARCHAR(255),
    contents_character_varying VARCHAR(255),
    value_real INT,
    warehouse_integer INT
);

INSERT INTO Boxes(code_character, contents_character_varying, value_real, warehouse_integer)
VALUES
    ('0MN7', 'Rocks', 180, 3 ),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4 ),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;      --4

SELECT * FROM Boxes WHERE value_real > 150;     --5

SELECT DISTINCT contents_character_varying from Boxes;      --6

SELECT warehouse_integer, count(*) AS number_of_boxes        --7
FROM Boxes
GROUP BY warehouse_integer;

SELECT warehouse_integer, count(*) AS number_of_boxes   --8
FROM Boxes
GROUP BY warehouse_integer
HAVING COUNT(*) > 2;

INSERT INTO Warehouses(location_character_varying, capacity_integer)    --9
VALUES ('New York', 3);

INSERT INTO Boxes(code_character, contents_character_varying, value_real, warehouse_integer)    --10
VALUES ('H5RT', 'Papers', 200, 2 );

UPDATE Boxes    --11
SET value_real = value_real *0.85
WHERE value_real = (
    SELECT value_real FROM Boxes
    ORDER BY value_real DESC
    OFFSET 2 LIMIT 1
);

DELETE FROM Boxes WHERE value_real < 150;   --12

DELETE FROM Boxes   --13
USING Warehouses
WHERE Boxes.warehouse_integer = Warehouses.code
AND Warehouses.location_character_varying = 'New York'
RETURNING *;
