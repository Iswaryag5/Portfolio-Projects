-- Query1: Select all the data from the customers table contained in the store database
USE sql_store;
SELECT * FROM customers                            -- Selecting all columns from the customers table
-- WHERE CUSTOMER_ID=1
order by first_name;                               -- Ordering the results by the first_name column

-- Query2: Extract last_name, first_name, points and compute points +10 column
USE sql_store;
SELECT last_name, first_name, points,              -- Selecting the last_name, first_name, and points columns from the customers table
        points + 10                                -- Adding 10 to the points column
FROM    customers;                                 -- From the customers table
    
-- Task1 : Using the Query 2 we created change the points to read times by 10 and plus 100 points.
USE sql_store;
SELECT last_name, first_name, points,               -- Selecting the last_name, first_name, and points columns from the customers table
       points * 10 + 100                            -- Calculating a new value based on points and adding 100
FROM   customers;                                   -- From the customers table

-- Task1 : Change the Query 2 code to create a discount factor so the table now shows a discount header and changing the (point + 10) *100
USE sql_store;
SELECT last_name, first_name, points,               -- Selecting the last_name, first_name, and points columns from the customers table
       (points + 10) * 100 AS discount_factor       -- Calculating a new value based on points, adding 10, and multiplying by 100, and aliasing it as 'discount_factor'
FROM   customers;                                   -- From the customers table
    
-- Task2 : Write a SQL query to return all the products in our database in the result set. I want you to show columns; name, unit price, 
-- 		   and new column called new price which is based on this expression, (unit price * 1.1 ). So what you are doing is increasing the 
--         product price of each by 10%. So with the query we want all the products the original price and the new  price.  
USE sql_store;
SELECT name, unit_price,                            -- Selecting the name and unit_price columns from the products table
       unit_price * 1.1 AS new_price                -- Calculating a new price by multiplying the unit_price by 1.1 and aliasing it as 'new_price'
FROM   products;                                    -- From the products table
 
-- Task3 : In this task create a new query to find all the customers with a birth date of > '1990-01-01'
USE sql_store;
SELECT * FROM customers                             -- Selecting all columns from the customers table
WHERE birth_date > '1990-01-01';                    -- Where the birth_date is greater than '1990-01-01'

-- Task4 : Select sql_inventory. Write a query to find out the name of the product with most amount in stock.
USE sql_inventory;
SELECT name FROM products                                               -- Selecting the name column from the products table
WHERE 
quantity_in_stock = (SELECT MAX(quantity_in_stock) FROM products);      -- Where the quantity_in_stock is equal to the maximum quantity_in_stock in the table

-- Task5 : Select sql_inventory. Write a query to find out the name of the most expensive product.
USE sql_inventory;
SELECT name AS Product_Name,                         -- Selecting the name from the products table and Alias for the name column
       unit_price AS Amount_in_stock                 -- Selecting the unit price from the products table and Alias for the unit_price column
FROM   products                                      -- From the products table
WHERE  unit_price =                                  -- Filtering where the amount in stock is equal to
    (SELECT MAX(unit_price) FROM products);          -- the maximum amount in stock from the products table

-- Task6 : Select sql_store. Write a query to find out the first name, last name, address and the birthdate of the oldest customer.
USE sql_store;
SELECT first_name, last_name, address, birth_date                          -- Selecting the first name, last name, address, birthdate columns
FROM  customers                                                            -- From the customers table
WHERE birth_date = (SELECT MIN(birth_date) FROM customers);                -- Where the birthdate is equal to the minimum birthdate in the table