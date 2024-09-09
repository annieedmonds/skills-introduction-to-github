
-- Part 1 

-- List all countries in South America 
SELECT * FROM `country` WHERE Continent LIKE 'SOUTH AMERICA';

-- Find the population 'Germany'
SELECT Population FROM `country` WHERE Name LIKE 'GERMANY'; 

-- Retrieve all cities in the country 'Japan'
SELECT Name FROM `city` WHERE countryCode LIKE 'JAPAN'; 

-- Find the 3 most populated countries in the 'Africa' region 
SELECT country.Name, country.Population 
FROM country WHERE Continent LIKE 'Africa' 
ORDER BY Population DESC Limit 3; 

-- Retrieve the country and its life expectancy where the population is between 1 and 5 million 
SELECT Name, LifeExpectancy, Population FROM country WHERE Population > 1000000 AND Population < 5000000; 

-- List countries with an official language of 'French'
 SELECT country.Name FROM country
 JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
 WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- Retrieve all album titles by the artist 'AC/DC'
SELECT AlbumId, Title FROM Album WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Name = 'AC/DC'); 

-- Find the name and email of customers located in 'Brazil'
SELECT FirstName, LastName, Email FROM Customer WHERE Country LIKE 'Brazil'; 

-- List all playlists in the database 
SELECT Name FROM Playlist; 

-- Find the number of tracks in the 'Rock' genre 
SELECT COUNT(Name) AS TrackCount 
FROM Genre WHERE GenreId = (SELECT GenreId FROM Genre WHERE Name = 'Rock');

-- List all employees who report to 'Nancy Edwards'
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards'); 

-- Calculate the total sales per customer by summing the total amount in invoices 
SELECT CustomerId, SUM(Total) AS TotalSales 
FROM Invoice 
GROUP BY CustomerId
ORDER BY TotalSales DESC; 


-- Part 2 

-- Create the tables 
CREATE TABLE `Bagel`  
 ( 
  `BagelId` INT NOT NULL AUTO_INCREMENT, 
  `BagelType` VARCHAR(160) NOT NULL, 
   `BagelsSoldToday` Int NOT NULL, 
    `BagelPrice` NUMERIC(10,2) NOT NULL, 
  CONSTRAINT `PK_CreamCheese` PRIMARY KEY (`BagelId`) 
   ); 
    
CREATE TABLE `CreamCheese` 
 ( 
  `CreamCheeseId` INT NOT NULL AUTO_INCREMENT, 
  `CreamCheeseType` VARCHAR(160) NOT NULL, 
   `CreamCheesePrice` NUMERIC(10,2) NOT NULL, 
  CONSTRAINT `PK_CreamCheese` PRIMARY KEY (`CreamCheeseId`) 
   ); 
   
 CREATE TABLE `Customer`
 (
   `CustomerId` INT NOT NULL AUTO_INCREMENT, 
   `CustomerFirstName` VARCHAR(40) NOT NULL, 
   `CustomerLastName` VARCHAR(40) NOT NULL,
    `CustomerOrder` VARCHAR(100) NOT NUll, 
    `CustomerTotal` Numeric(10,2) NOT NULL, 
  	CONSTRAINT `PK_Customer` PRIMARY KEY (`CustomerID`)
     ); 
  
-- Insert tables    
INSERT INTO `Bagel` (`BagelType`, `BagelsSoldToday`, `BagelPrice`) VALUES 
('Plain', 120, 2.5), 
('Everything', 100, 3.0),  
('Blueberry', 75, 3.5),  
('Cinnamon Raisin', 50, 4.0), 
('Poppy Seed', 80, 3.75); 

INSERT INTO `CreamCheese` (`CreamCheeseType`, `CreamCheesePrice`) VALUES 
('Plain', 1.0), 
('Strawberry', 1.5), 
('Blueberry', 1.5), 
('Scallion', 2.0), 
('Jalapeno', 2.0); 

INSERT INTO `Customer` (`CustomerFirstName`, `CustomerLastName`, `CustomerOrder`, `CustomerTotal`) VALUES 
('Sally', 'Johnson', 'Plain Bagel with Plain Cream Cheese', 3.5 ),  
('Caroline', 'Smith', 'Everything Bagel with Scallion Cream Cheese', 5.0), 
('John', 'Davis', 'Poppy Seed Bagel with Plain Cream Cheese', 4.75 ),
('Katherine', 'Jones', 'Cinammon Raisin with Blueberry Cream Cheese', 5.5), 
('Charlie', 'Fields', 'Blueberry Bagel with Strawberry Cream Cheese', 5.0); 

-- Write queries 
-- Find the total number of bagels sold today
SELECT SUM(BagelsSoldToday) FROM Bagel; 

-- Find the total revenue of plain bagels sold today  
SELECT SUM(BagelPrice * BagelsSoldToday) FROM Bagel WHERE BagelType LIKE 'PLain'; 

-- List the first and last name of the customers with a total below 5 
SELECT CustomerFirstName, CustomerLastName FROM Customer WHERE CustomerTotal < 5 ORDER BY CustomerTotal DESC;
