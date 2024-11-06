
-- Create table person

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT UNIQUE NOT NULL,
);

-- Create a table department

CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    secretary_id INTEGER REFERENCES person(id) ON DELETE SET NULL -- secretary_id can be NULL, meaning no secretary
);

-- Add foreign key
ALTER TABLE person
ADD COLUMN department_id INTEGER NOT NULL,
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id);

INSERT INTO department (name) VALUES ('HR'), ('IT'), ('Marketing');

-- Populate the table.
INSERT INTO person (name, phone, department_id) VALUES ('Maria', '123-456-7890', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Steve', '234-567-8901', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Alex', '345-678-9012', 2);
INSERT INTO person (name, phone, department_id) VALUES ('Kostas', '123-456-7831', 1);
INSERT INTO person (name, phone, department_id) VALUES ('wdrtg', '123-456-78686', 1);
INSERT INTO person (name, phone, department_id) VALUES ('joe', '123-456-78923', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Col', '123-456-7867', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Li', '123-456-7859', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Fi', '123-456-7894', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Sam', '123-456-7898', 1);
INSERT INTO person (name, phone, department_id) VALUES ('George', '123-456-7855', 1);
INSERT INTO person (name, phone, department_id) VALUES ('Stella', '123-456-7877', 1);

-- Set Secretary to department 1 (HR)
UPDATE department SET secretary_id = 1 WHERE id = 1;

--Query 1
SELECT p.name AS person_name, p.phone AS person_phone, sec.phone AS secretary_phone FROM person p JOIN department d ON p.department_id = d.id LEFT JOIN person sec ON d.secretary_id = sec.id WHERE d.name = 'HR' AND p.id != d.secretary_id;

--Query 2
SELECT d.name AS department_name, COUNT(p.id) AS employee_count, sec.name AS secretary_name, sec.phone AS secretary_phone FROM department d LEFT JOIN person sec ON d.secretary_id = sec.id LEFT JOIN person p ON p.department_id = d.id GROUP BY d.id, d.name, sec.name, sec.phone;

--Query 3
SELECT d.name AS department_name, COUNT(p.id) AS employee_count, sec.name AS secretary_name, sec.phone AS secretary_phone FROM department d LEFT JOIN person sec ON d.secretary_id = sec.id LEFT JOIN person p ON p.department_id = d.id GROUP BY d.id, d.name, sec.name, sec.phone HAVING COUNT(p.id) > 10;