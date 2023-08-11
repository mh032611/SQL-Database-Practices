-- SELECT *
-- FROM customers
-- WHERE country = 'Germany'
-- limit 5 ; 

-- SELECT
--     COUNT(City) - COUNT( distinct City) AS DIFFRENCE
-- FROM customers;

INSERT into customers VALUES
(497, 'Jenny','Jenny','Jones','917-433-2828','12 Mockingbird Lane', 
NULL,'Omaha','NE','54550','USA',1056,2000.00);

SELECT *
FROM customers
WHERE customerNumber = 498;

-- Difference Between Column level and table level constraints 

-- CREATE TABLE user(
-- 	user_id NUMBER CONSTRAINT USERS_PK
-- 	PRIMARY KEY (user-id) 
-- )
-- 	column-level 
--     (Named & unnamed)
--     
--     table-level 




