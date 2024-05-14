-- 1. Using count, get the number of cities in the USA.
USE world;
SELECT COUNT(Countrycode)                    -- Count the number of rows (cities)
FROM city                                    -- Selecting from the city table
WHERE Countrycode = 'USA';                   -- Filtering for cities in the USA

-- 2. Using ORDER BY, LIMIT, what country has the highest life expectancy?
USE world;
SELECT name, LifeExpectancy                  -- Select the country name and life expectancy
FROM   country                               -- From country table
ORDER BY LifeExpectancy DESC                 -- Order by life expectancy in descending order (highest first)
LIMIT 1;                                     -- Limit the result to only one row (the country with the highest life expectancy)

-- 3. Select 25 cities around the world that start with the letter 'F' in a single SQL query.
USE world;
SELECT * FROM  city                          -- Selecting all columns from city table
WHERE Name LIKE 'F%'                         -- Filtering for cities that start with the letter 'F'
LIMIT 25;                                    -- Limit the result to 25 rows

-- 4. Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
USE world;
SELECT Id, Name, Population                  -- Select the Id, Name, Population column
FROM city                                    -- Selecting from the city table
LIMIT 10;                                    -- Limit the result to the first 10 rows

-- 5.Create a SQL statement to display columns Id, Name, Population from the city table and limit results to rows 31-40.
SELECT Id, Name, Population                  -- Select the Id, Name, and Population columns
FROM city                                    -- From the city table
ORDER BY Id                                  -- Order the results by the Id column
LIMIT 30, 10;                                -- Limit the result set to 10 rows starting from the 31st row

-- 6. Create a SQL statement to find only those cities from city table whose population is larger than 2000000.
USE world;
SELECT * FROM city                           -- Select all columns from the city table
WHERE Population > 2000000;                  -- Filter for cities with a population larger than 2,000,000

-- 7. Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
USE world;
SELECT Name FROM city                                 -- Select city name from the city table
WHERE Name LIKE 'Be%';                                -- Filter for city names that begin with "Be" prefix

-- 8. Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
USE world;
SELECT * FROM city                                    -- Select all columns from the city table
WHERE Population BETWEEN 500000 AND 1000000;          -- Filter for cities with population between 500,000 and 1,000,000

-- 9. Create a SQL statement to display all cities from the city table sorted by Name in ascending order.
USE world;
SELECT * FROM city
ORDER BY Name ASC;

-- 10. Create a SQL statement to find a city with the lowest population in the city table.
USE world;
SELECT * FROM city                                       -- Select all columns from the city table
ORDER BY Population ASC                                  -- Order the cities by population in ascending order (lowest first)
LIMIT 1;                                                 -- Limit the result to only one row (the city with the lowest population)

-- 11.Create a SQL statement to find a country with the largest population in the country table.
SELECT * FROM country
ORDER BY Population DESC
LIMIT 1;

------------------------------------- Bonus Tasks ------------------------------------------
-- Bonus Task1 : Create a SQL statement to find the capital of Spain (ESP).
USE world;
SELECT city.Name AS capital                                 -- Select the city name from the city table and alias it as 'capital'
FROM city                                                   -- Selecting from the city table
JOIN 
    country ON city.CountryCode = country.Code              -- Joining the city table with the country table based on the CountryCode
WHERE 
    country.Code = 'ESP' AND country.Capital = city.ID;     -- Filtering for the country code 'ESP' and matching the city ID with the capital ID in the country table


-- Bonus Task2: Create a SQL statement to find the country with the highest life expectancy.
SELECT Name, LifeExpectancy                                 -- Select the country name and life expectancy
FROM country                                                -- From country table
ORDER BY LifeExpectancy DESC                                -- Order the results by life expectancy in descending order
LIMIT 1;                                                    -- Limit the result set to only one row

 
-- Bonus Task3 : Create a SQL statement to find all cities from the Europe continent.
USE world;
SELECT city.Name AS city_name                                -- Select the city name from the city table and alias it as 'city_name'
FROM city                                                    -- Selecting from the city table
JOIN 
    country ON city.CountryCode = country.Code               -- Joining the city table with the country table based on the CountryCode
WHERE 
    country.Continent = 'Europe';                            -- Filtering for countries in the Europe continent
    
-- Bonus Task4: Create a SQL statement to find the most populated city in the city table. 
SELECT Name, population                                      -- Select the city name and its population
FROM city                                                    -- From the city table
WHERE population = (SELECT MAX(population) FROM city);       -- Filter rows where the population equals the maximum population in the city table
    
    

  


