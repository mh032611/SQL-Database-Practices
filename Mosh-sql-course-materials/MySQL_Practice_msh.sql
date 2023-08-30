-- https://www.youtube.com/watch?v=7S_tz1z_5bA&
-- USE sql_inventory;

-- SELECT 
-- 	name, 
--     unit_price,
--     (unit_price*1.1) AS new_price
-- FROM products;

----------------------------------------------------------------------------
USE store;

-- SELECT *
-- FROM customers
-- WHERE points > 3000;

-- SELECT *
-- FROM customers
-- WHERE state = 'VA';

-- SELECT *
-- FROM customers
-- WHERE state != 'VA';

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01'; -- 'year-month-date'

-- exercise: get the orders placed this year
-- USE store;

-- SELECT *
-- FROM orders
-- WHERE order_date > '2019-01-01';

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01' OR (points > 1000 AND state = 'va');
-- -- AND operator always executes before OR operator.
-- -- But you can use parenthesis to increase precedence. 

-- SELECT *
-- FROM customers
-- WHERE (birth_date > '1990-01-01' OR points > 1000);

-- SELECT *
-- FROM customers
-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000); -- WHERE NOT chooses all except

-- SELECT *
-- FROM customers
-- WHERE NOT (birth_date <= '1990-01-01' AND points <= 1000);
-- -- use opposite opperators and conditionals to see same results as previous for WHERE NOT 
-- -- (<=) is the opposite of (>) 
-- -- (AND is the opposite of OR) 

-- EXERCISE: FROM the order_items table, get the items for order #6, where the total price is greater than 30

-- USE store;
-- -- SELECT *,
-- --     (unit_price*quantity) AS total_price
-- -- FROM order_items
-- -- WHERE (unit_price*quantity) > 30 AND order_id = 6;

-- SELECT *
-- FROM customers
-- WHERE state = 'va' OR state = 'ga' or state = 'fl';
-- -- Use 'IN' as another way to write this to make it cleaner is:
-- SELECT *
-- FROM customers
-- WHERE state IN ('va', 'fl', 'ga');

-- -- NOT IN for those not included in the list elements
-- SELECT *
-- FROM customers
-- WHERE state NOT IN ('va', 'fl', 'ga');

-- -- EXERCISE: Return products with quantity in stock equal to 49,38,72
-- SELECT *
-- FROM products
-- WHERE quantity_in_stock IN ('49', '38', '72');

-- ---------------------- Between Operator timestamp:55:05 ----------------------------
-- SELECT *
-- FROM customers
-- WHERE points >= 1000 and points <= 3000;
-- -- using Between operator
-- SELECT *
-- FROM customers
-- WHERE points BETWEEN 1000 AND 3000;
-- -- Same thing

-- -- EXERCISE: Return customers born between 1/1/1990 and 1/1/2000
-- SELECT *
-- FROM customers
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- -- The LIKE Operator
-- -- How to retrieve rows that match a specific pattern
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b%'; -- will get all last names that start with 'b'. Also not case sensitive. 
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'brush%'; -- will get all last names that start with 'brush' 

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE '%b%'; -- will get all last names that start with ANY number of characters before or after 'b'. Also not case sensitive. 
-- -- This returns all last names containing a 'b'

-- Get all customers whose last name end with 'y'
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE '%y'; -- will get all last names that end with 'y'

-- using underscore means to retrieve last names with exactly that many of characters (in this case its 2) and ends with y
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE '_y'; -- returns no results because there arent any 2 character last names that end with y

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE '_____y'; -- return last_name results with 6 characters, ending with y

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'B____y'; -- returns last names that start with b and end with y

-- % means any number of characters
-- _ means single character

/* 
EXERCISE: Get the customers whose 
- addresses contain TRAIL or AVENUE
- phone numbers end with 9
*/
-- SELECT *
-- FROM customers
-- WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

-- SELECT *
-- FROM customers
-- WHERE phone LIKE '%9';

-- -- get customers whos phone numbers dont end in 9
-- SELECT *
-- FROM customers
-- WHERE phone NOT LIKE '%9';

-- ------------------ REGEX EXPRESSIONS -----------------------------
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE '%field%';
-- /* Is the same as */
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field';
-- /* REGEXP can use ^ to indicate beginning of a string and % for end of string */
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP '^field'; -- ^ to represent beginning of string. 
-- -- theres nobody's last name starts with 'field'
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field$'; -- $ to represent end of a string

-- /* Find field or mac in their last name */
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field|mac';

-- /* Find last names that END WITH 'field' or contain 'mac' or contain 'rose' in their last name */
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field$|mac|rose';

-- /* Find last names that contain an 'e' */
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'e';

-- /* Find last names that contain any of [gim] and 'e' to make 'ge', 'ie', 'me'*/
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP '[gim]e'; -- last name containing 'ge', 'ie', 'me'

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'e[fmq]'; -- last name containing 'ef', 'em', 'eq'

-- /* supply a range of characters in brackets*/
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP '[a-h]e'; -- range from a-h + e

/* -------------------SUMMARY for REGEXP-------------------------------
-- ^ beginning
-- $ end
-- | logical or 
-- [abcd]
-- [a-f] 
*/

/*
EXERCISE: Get the customers whose
- first names are ELKA or AMBUR
- last names end with EY or ON
- last names start with MY or contains SE 
- last names contain B followed by R or U 
*/
-- USE store;

-- SELECT *
-- FROM customers
-- WHERE first_name REGEXP 'ELKA|ambur'; 
-- /* REMEMBER TO PUT IT ALL IN ONE STRING INCLUDING THE '|'. 
-- ALSO REMEMBER THAT THE PARENTHESIS ARE ENTIRELY OPTIONAL. NOT CASE SENSITIVE*/

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP ('EY$|ON$');

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP ('^my|se');

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP ('b[ru]');

----------------------------------- THE IS NULL Operator (ts: 1:11)-------------------------
/* How to look for records that are missing an attribute */

-- SELECT *
-- FROM customers
-- WHERE phone IS NULL; -- result shows only one customer that doesn't have a phone number

-- SELECT *
-- FROM customers
-- WHERE phone IS NOT NULL; -- result shows customers that DO have a phone number

/* EXERCISE: get the orders that are not shipped */
-- SELECT *
-- FROM orders
-- WHERE shipped_date IS NULL;

----------------------------------- The ORDER BY clause (ts: 1:14)-------------------------
-- /* How to sort data in your SQL queries*/
-- /* Data is sorted by primary key by default*/

-- SELECT *
-- FROM customers
-- ORDER BY first_name; -- sorted in ascending order

-- SELECT *
-- FROM customers
-- ORDER BY first_name DESC; -- sorted in descending order

-- /*Sorting Data by multiple columns*/
-- /*Sort columns by State, then within each state, sort them by first_name*/
-- SELECT *
-- FROM customers
-- ORDER BY state, first_name; -- sorted by state, then sorted by first name

-- /* sorting in desc order */
-- SELECT *
-- FROM customers
-- ORDER BY state DESC, first_name DESC; -- sorted in descending order

-- /*ONE GREAT THING ABOUT MYSQL IS THAT YOU CAN ORDER BY COLUMNS EVEN IF NOT INCLUDED IN THE SELECT CLAUSE*/

-- SELECT first_name, last_name
-- FROM customers
-- ORDER BY birth_date;

--  /* SORTING BY AN ALIAS */
--  SELECT first_name, 
-- 		last_name, 
-- 		10 AS points
--  FROM customers
--  ORDER BY points, first_name;
--  
--  /*Sorting by the order of the columns in the SELECT statement (1st and 2nd)*/
--   SELECT first_name, 
-- 		last_name, 
-- 		10 AS points
--  FROM customers
--  ORDER BY 1, 2;
--  /* This is actually sorting by the first_name and last_name. BUT YOU SHOULD AVOID IT 
--  BECAUSE IT IS BAD PRACTICE. COLUMN POSITIONING MAY CHANGE IN THE SELECT STATEMENTS IF 
--  YOU ALTER IT BY ADDING A NEW COLUMN*/
-- /*ALWAYS SORT BY COLUMN NAMES!*/

/*EXERCISE : using order_items table, items are sorted based on total price. write a query that sorts using order_id 2 and total price in descending order*/

-- SELECT *, 
-- 	(unit_price*quantity) AS total_price
-- FROM order_items
-- WHERE order_id = 2
-- ORDER BY order_id DESC, total_price DESC;  

-- /*Mosh's Solution*/
-- SELECT *, 
-- 	(unit_price*quantity) AS total_price
-- FROM order_items
-- WHERE order_id = 2
-- ORDER BY total_price DESC; 

----------------------------------- The LIMIT clause (ts: 1:21)-------------------------
/*How to limit the number of results to your query*/
-- SELECT *
-- FROM customers
-- LIMIT 3; -- this returns only the first 3 customers 

-- SELECT *
-- FROM customers
-- LIMIT 300; -- if you put a number greater than the number of rows, it just prints all the results. In this case you get all 10 customers in the table 


-- SELECT *
-- FROM customers
-- LIMIT 6, 3; -- print page 3 (skip the first 6 records, and prints 3 of the following records (7-9)
/*
-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-9
*/
/*Exercise: Get the top 3 loyal customers (customers with more points than anyone else) */
-- SELECT *
-- FROM customers
-- ORDER BY points DESC
-- LIMIT 3; 
/* LIMIT CLAUSE ALWAYS COMES AT THE END */

----------------------------------- Inner Joins (ts: 1:24)-------------------------
/*selecing columns from multiple tables*/

-- SELECT order_id, first_name, last_name
-- FROM orders
-- JOIN customers 
-- 	ON  orders.customer_id = customers.customer_id;

-- USE STORE;

-- SELECT order_id, orders.customer_id, first_name, last_name  -- orders.customer_id is used because there is a customer_id column in both tables. so you have to specify which table you are referring to. You can choose either table, because they both refer to the same value, so it doesn't matter
-- FROM orders
-- JOIN customers
-- 	ON orders.customer_id = customers.customer_id; 

-- /* Using Aliases for cleaner code */
-- SELECT order_id, o.customer_id, first_name, last_name
-- FROM orders o -- you are now declaring the 'orders' table as 'o'
-- JOIN customers c -- you are now declaring the 'customers' table as 'c'
-- 	ON o.customer_id = c.customer_id; 

/*EXERCISE: Join the order_items table with the products table, so for each order return the product_id and its name followed by the quantity and the unit price from the order_items table. and use aliases to simply your code */
-- USE store;
-- SELECT *
-- FROM order_items o
-- JOIN products p
-- 	ON o.product_id = p.product_id
-- ORDER BY o.order_id;


-- SELECT 
-- 	oi.order_id,
-- 	oi.product_id, 
--     name,
--     quantity, 
--     oi.unit_price -- this is the price at the time of placing the order. the u
-- FROM order_items oi
-- JOIN products p
-- 	ON oi.product_id = p.product_id
-- ORDER BY oi.order_id;

----------------------------------- Joining across Databases (ts: 1:33)-------------------------
/*join "products table" from the sql_inventory database and sql_store databases have a "products* table. They both have the same columns and the same data*/


----------------------------------- Self Joins -------------------------------------------------
/*Join a table with itself*/
/*Use sql_hr database and combine the 'employees' and 'offices' tables* so that we can join each employee with their manager*/

----------------------------------- Joining Multiple Tables (ts: 1:40) -------------------------------------------------
/* */
-- USE sql_store;
-- SELECT 
-- 	o.order_id, 
--     o.order_date, 
--     c.first_name, 
--     c.last_name, 
--     os.name AS status
-- FROM orders o
-- JOIN customers c
-- 	ON o.customer_id = c.customer_id
-- JOIN order_statuses os
-- 	ON o.status = os.order_status_id;

/*EXERCISE */

----------------------------------- Outer Joins (ts: 1:53) ----------------------------------------------
-- the table mentioned in FROM is the left table. and the JOIN table is the right table. 
-- USE store;
-- SELECT
-- 	c.customer_id,
--     c.first_name,
--     o.order_id
-- FROM customer c
-- JOIN orders o
-- 	ON c.customer_id = o.customer.id
-- ORDER BY c.customer_id;



/*Exercise*/

-- -------------------------------The USING clause ----------------------------
/*keyword that can be used if column names in two tables you want to join, are the same*/
/* ex. USING (shipper_id) is the same as ON o.shipping_id = p.shipping_id */

-- -------------------------------The UNION opperator ts: 2:18 ----------------------------
SELECT *
FROM orders;




SELECT first_name
FROM archived_orders
UNION
SELECT name
FROM shippers


