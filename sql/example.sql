
-- Drop table if a previous run created it.
DROP TABLE IF EXISTS person;

-- Create a table
CREATE TABLE person (
    id INTEGER,
    name TEXT,
    height DOUBLE PRECISION
);

-- Populate the table.
INSERT INTO person ( id, name, height ) VALUES ( 1, 'Maria', 1.65 );
INSERT INTO person ( id, name, height ) VALUES ( 2, 'Steve, 1.71 );
INSERT INTO person ( id, name, height ) VALUES ( 3, 'Alex, 1.62 );

-- Three simple examples of querying the database.
SELECT * FROM person;
SELECT * FROM person WHERE height > 1.64;
SELECT COUNT(1) FROM person WHERE height < 1.70;

