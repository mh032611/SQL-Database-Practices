USE classicmodels;


-- find customers with the hightest total amount in payments
-- corroborate with finance dept assumptions 

-- SELECT sum(amount), customerNumber, count(checkNumber)
-- FROM payments
-- GROUP BY customerNumber
-- ORDER BY sum(amount) DESC;

-- ---------------------------------------------------------------

-- SELECT sum(amount), customerNumber, count(checkNumber)
-- FROM payments
-- WHERE month(paymentDate) < month(current_date())
-- GROUP BY customerNumber
-- ORDER BY sum(amount) DESC
-- LIMIT 5; 

-- Problem 1: Who reports to Mary Patterson? (easy!)
-- What is mary pattersons primary key?

/*
1. Find table containing columns containing mary pattersons name and primary key
2. Find table containing information regarding who they report to
3. 
*/

SELECT *
FROM employees
WHERE reportsTo in (SELECT employeeNumber FROM employees WHERE firstName = "MARY" AND lastName = "PATTERSON");

SELECT employeeNumber, CONCAT (firstName, " " ,lastName) AS employees, reportsTo
FROM employees
WHERE reportsTo in (SELECT employeeNumber FROM employees WHERE firstName = "MARY" AND lastName = "PATTERSON");

/*Fube Solution using an innner Join*/
SELECT
    e.employeeNumber, e.firstName, e.lastName
FROM
    employees AS e
JOIN
    employees AS ee ON e.reportsTo = ee.employeeNumber
WHERE
    ee.firstName = 'Mary' AND ee.lastName = 'Patterson';


-- Problem 2: Which payments in any month and year are more than twice the average for that month and year (ie looking for anomalous payments that may be entered wrong or an unusually large order, etc?

/*
Explanation:
-- We retrieve payments that are more than twice the average payment for the same month and year.
-- We use the "payments" table twice, joining them based on the year and month of paymentDate.
-- The GROUP BY groups payments by paymentDate and amount.
-- The HAVING clause filters out payments where the amount is more than twice the average amount for that month and year.
-- The ORDER BY clause orders the results by paymentDate.
*/
-- YEAR(paymentDate) AS payment_year, MONTH(paymentDate) AS PaymentMonth, 

SELECT p.paymentDate, p.amount, ROUND(AVG(p2.amount), 2) as avg_amount, ROUND(2*(AVG(p2.amount)), 2) as twice_of_average
FROM payments p 
JOIN payments p2 
ON YEAR(p.paymentDate) = YEAR(p2.paymentDate) AND MONTH(p.paymentDate) = MONTH(p2.paymentDate) 
GROUP BY p.paymentDate, p.amount -- IN ORDER TO USE HAVING YOU NEED TO HAVE A GROUP BY STATEMENT
HAVING p.amount > 2*(avg_amount)
ORDER BY p.paymentDate;


-- ----------------------- Valerie's Solution




-- Problem 3: Report for each product, the percentage value of its stock on hand as a percentage of the stock on hand for the product line. NOTE: this one is going to take some assumptions on your part!  Be sure to document your thoughts in markdown cells or Python comments.  This is good practice for the expectations in your Capstone at the end of class.

/*
1. Find which table has the following columns; productcode, productline, quantityinstock
2. Calculate the sum of the stock for each product line 
3. use the stock of each (product)/sum (stock product line)
4. Select the product code, product name, and percentage of each stock relative to product line. 
*/

SELECT p1.productCode, p1.productname, p1.productLine, p1.quantityInStock, sum_quant_in_stock)) * 100 AS relative_stock
FROM products p1
JOIN 
(SELECT productline, quantityInStock/SUM(quantityinStock) AS sum_quant_in_stock
FROM products
GROUP BY productLine)

p2 ON p1.productline = p2.productline; 

-- Problem 4: For orders containing more than two products, report those products that constitute more than 50% of the value of the order.

-- Select all from orderdetails table.
-- group by order having more than 2 products
-- find orders in which ONE product constitutes more than 50% of the total value of the order. 
-- output should be the order number in one column along with the product in question

/*Valerie's Solution*/
SELECT
    o.orderNumber,
    od.productCode,
    p.productName,
    SUM(od.quantityOrdered * od.priceEach) AS total_value,
    SUM(od.quantityOrdered * od.priceEach) / o.orderTotal AS percentage_of_order
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY o.orderNumber, od.productCode
HAVING COUNT(*) > 2 AND SUM(od.quantityOrdered * od.priceEach) / o.orderTotal > 0.5
ORDER BY o.orderNumber, percentage_of_order DESC;

/*alternative*/
SELECT productName FROM Products WHERE productCode IN
(SELECT productCode FROM OrderDetails O
		WHERE quantityOrdered*priceEach > .5*
	(SELECT sum(quantityOrdered*priceEach) FROM OrderDetails
					WHERE OrderDetails.orderNumber = O.orderNumber
GROUP BY O.orderNumber HAVING count(*) > 2));

/*alternative*/
SELECT productName
FROM Products
WHERE productCode IN (
    SELECT O.productCode
    FROM OrderDetails O
    JOIN (
        SELECT orderNumber,
               SUM(quantityOrdered * priceEach) AS orderValue
        FROM OrderDetails
        GROUP BY orderNumber
        HAVING COUNT(*) > 2
    ) AS OrdersWithMoreThanTwoProducts ON O.orderNumber = OrdersWithMoreThanTwoProducts.orderNumber
    WHERE O.quantityOrdered * O.priceEach > 0.5 * OrdersWithMoreThanTwoProducts.orderValue
);
