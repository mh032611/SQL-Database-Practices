USE classicmodels;

/* Find all french customers*/

/*
Show customers filter by country that matches france 
what values might be displayed in country field
*/


-- SELECT DISTINCT country 
-- FROM customer; 


-- SELECT *
-- FROM customers
-- WHERE country = 'france'
-- ORDER BY country;

/*Return the number of French customers*/
-- SELECT count(country)
-- FROM customers
-- WHERE country = 'france';

/*Find the first and last name on employees with the title "sales rep"*/

-- logic is to describe the table first to determine columns

-- DESC TABLE employees; -- information 
-- DESC employees; -- to find out information in the table 
-- /*This shows information about the columns (including one that may match something like 'job title'. you find jobTitle that matches that description*/

-- SELECT DISTINCT(jobTitle)
-- FROM employees; -- outputs all the distinct job titles 

-- SELECT firstName, lastName
-- FROM employees
-- WHERE jobTitle = 'sales rep';

/*NOT RIGHT ANSWER Because it doesnt answer the first and last name requirements*/
-- SELECT *
-- FROM employees
-- where jobTitle = 'Sales Rep';

/*List all the motorcycles sorted by product name*/
/*
1. What are all the 
2. 
3. 
*/

/*what table holds motorcycles?*/
/*"Exploration code"*/
-- SHOW TABLES; -- shows all tables in the database
-- DESC products;
-- SELECT distinct productName from products; -- does not show which ones are motorcycles

-- SELECT distinct productline from products; -- this is the right column! it shows 'motorcycles' 


-- SELECT *
-- FROM products
-- WHERE productlines = 'motorcycles'
-- ORDER BY productname;

/*This doesnt work. using left() doesnt work here*/
-- SELECT *
-- FROM products
-- WHERE productlines = 'motorcycles'
-- ORDER BY LEFT(ProductName, 5); -- The left (x, x) 

-- SELECT LEFT(productName,5)
-- SELECT RIGHT(productName,5)

/*EXERCISE: Sort the product names alphabetically Excluding the year prefix*/

/* The Code Below:

LOCATE(' ', productName): This function returns the position of the first occurrence of a space (' ') character in the productName column.

SUBSTRING(productName, LOCATE(' ', productName) + 1): This extracts a substring starting from the position after the first space, just like in the original code.

*/
-- /* Valerie's Solution */
-- SELECT productName
-- FROM products
-- ORDER BY SUBSTRING(productName, LOCATE(' ', productName) + 1);

-- /* Carolina's answer */
-- SELECT DISTINCT productName
-- FROM products
-- WHERE productLine='Motorcycles'
-- ORDER BY right(productName, length(productName)-5);

-- ---------------------------------------------------08/14/2023 Subqueries--------------------------------------------------------------------

SELECT p.productCode, p.productName, p.buyPrice FROM products p 
WHERE p.buyPrice > (SELECT AVG(pp.buyprice) FROM products pp)
ORDER BY buyPrice DESC;

-- SELECT AVG(pp.buyPrice) FROM products pp;

-- ------------------------

-- SELECT lastName, firstName, o.officeCode
-- FROM employees e
-- JOIN offices o USING (officeCode) -- when using "USING" you dont need to specify which table 
-- WHERE o.country = 'USA';

-- SELECT productname, buyprice
-- FROM products p1
-- WHERE buyprice > ( SELECT AVG(buyprice) FROM products 
-- 				   WHERE productline = p1.productline )
-- EXCEPT
-- SELECT productname, buyprice
-- FROM products p1
-- WHERE buyprice > ( SELECT AVG(buyprice) FROM products );













