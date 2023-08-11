-- Exploring the Sakila Sample Database
-- Updated 2023.08.04 vlb
-- This script will help you learn foundational MySQL concepts by exploring the "sakila" database.

-- Display all available databases
SHOW DATABASES;

-- Select the "sakila" database (you must do this if you have numerous databases on the same server!)
USE sakila;

-- Display all tables in the selected database
SHOW TABLES;

-- Explore the "actor" table
-- Basic SELECT statement to retrieve all rows and columns from the "actor" table
SELECT * FROM actor;

-- Limit the number of rows returned using LIMIT
SELECT * FROM actor LIMIT 5;

-- Filtering using WHERE clause
SELECT * FROM actor WHERE first_name = 'Tom';

-- Sorting using ORDER BY
SELECT * FROM actor ORDER BY last_name ASC;

-- Aggregation using COUNT, GROUP BY, and HAVING
SELECT country_id, COUNT(*) AS actor_count FROM city GROUP BY country_id HAVING actor_count > 5;

-- Joining tables: Explore the "film" and "film_actor" tables
-- Inner Join to get actor names and their film details
SELECT a.first_name, a.last_name, f.title, f.release_year
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;

-- Left Join to get all actors and their films (if any)
SELECT a.first_name, a.last_name, f.title, f.release_year
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;

-- Inserting data into the "actor" table
INSERT INTO actor (first_name, last_name) VALUES ('John', 'Doe');

-- Updating data in the "actor" table
-- NOTE THE ERROR BELOW
UPDATE actor SET last_name = 'Smith' WHERE first_name = 'John';

-- Deleting data from the "actor" table
-- Did this run?  If not, why?
DELETE FROM actor WHERE first_name = 'John';

-- Conclusion
-- This script covered basic SQL operations like SELECT, LIMIT, WHERE, ORDER BY, GROUP BY, JOIN, INSERT, UPDATE, and DELETE.
-- The "sakila" database provides a great opportunity to learn and practice these concepts.


-- Bonus code below:
-- does this run? why not?
-- where SHOULD/COULD this be run
-- go try it there
import webbrowser
url = "https://bit.ly/451Ifpm"
webbrowser.open(url)



-- Now try this one
import webbrowser
url = "https://bit.ly/3OP26Tb"
webbrowser.open(url)