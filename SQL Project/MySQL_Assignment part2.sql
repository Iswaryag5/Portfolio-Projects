-- Task1 : Using count, get the number of cities in the USA.
USE world;
SELECT COUNT(Countrycode)                    -- Count the number of rows (cities)
FROM city                                    -- Selecting from the city table
WHERE Countrycode = 'USA';                   -- Filtering for cities in the USA

-- Task2 : Find out what the population and average life expectancy for people in Argentina (ARG) is.
-- Selecting the population and average life expectancy for Argentina (ARG)
USE world;
SELECT code,
       AVG(LifeExpectancy),                  -- Calculating the average life expectancy
       SUM(population)                       -- Calculating the total population
FROM  country                                -- From'country' table containing countries data
WHERE code = 'ARG';                          -- Filtering for Argentina (ARG)

-- Task3 : Using ORDER BY, LIMIT, what country has the highest life expectancy?
USE world;
SELECT name, LifeExpectancy                  -- Select the country name and life expectancy
FROM   country                               -- From country table
ORDER BY LifeExpectancy DESC                 -- Order by life expectancy in descending order (highest first)
LIMIT 1;                                     -- Limit the result to only one row (the country with the highest life expectancy)

-- Task4 : Select 25 cities around the world that start with the letter 'F' in a single SQL query.
USE world;
SELECT * FROM  city                          -- Selecting all columns from city table
WHERE Name LIKE 'F%'                         -- Filtering for cities that start with the letter 'F'
LIMIT 25;                                    -- Limit the result to 25 rows

-- Task5 : Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
USE world;
SELECT Id, Name, Population                  -- Select the Id, Name, Population column
FROM city                                    -- Selecting from the city table
LIMIT 10;                                    -- Limit the result to the first 10 rows

-- Task6 : Create a SQL statement to find only those cities from city table whose population is larger than 2000000.
USE world;
SELECT * FROM city                           -- Select all columns from the city table
WHERE Population > 2000000;                  -- Filter for cities with a population larger than 2,000,000

-- Task7 : Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
USE world;
SELECT Name FROM city                                 -- Select city name from the city table
WHERE Name LIKE 'Be%';                                -- Filter for city names that begin with "Be" prefix

-- Task8 : Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
USE world;
SELECT * FROM city                                    -- Select all columns from the city table
WHERE Population BETWEEN 500000 AND 1000000;          -- Filter for cities with population between 500,000 and 1,000,000

-- Task9 : Create a SQL statement to find a city with the lowest population in the city table.
USE world;
SELECT * FROM city                                       -- Select all columns from the city table
ORDER BY Population ASC                                  -- Order the cities by population in ascending order (lowest first)
LIMIT 1;                                                 -- Limit the result to only one row (the city with the lowest population)

------------------------------------- Bonus Tasks ------------------------------------------
-- Bonus Task1 : Create a SQL statement to find the capital of Spain (ESP).
USE world;
SELECT city.Name AS capital                                 -- Select the city name from the city table and alias it as 'capital'
FROM city                                                   -- Selecting from the city table
JOIN 
    country ON city.CountryCode = country.Code              -- Joining the city table with the country table based on the CountryCode
WHERE 
    country.Code = 'ESP' AND country.Capital = city.ID;     -- Filtering for the country code 'ESP' and matching the city ID with the capital ID in the country table

-- Bonus Task2 : Create a SQL statement to list all the languages spoken in the Caribbean region.
USE world;
SELECT DISTINCT cl.Language                               -- Selecting distinct languages from the CountryLanguage table
FROM CountryLanguage cl                                   -- Selecting from the CountryLanguage table
JOIN 
    Country c ON cl.CountryCode = c.Code                  -- Joining with the Country table based on the CountryCode
WHERE 
    c.Region = 'Caribbean';                               -- Filtering for countries in the Caribbean region
    
-- Bonus Task3 : Create a SQL statement to find all cities from the Europe continent.
USE world;
SELECT city.Name AS city_name                                -- Select the city name from the city table and alias it as 'city_name'
FROM city                                                    -- Selecting from the city table
JOIN 
    country ON city.CountryCode = country.Code               -- Joining the city table with the country table based on the CountryCode
WHERE 
    country.Continent = 'Europe';                            -- Filtering for countries in the Europe continent



