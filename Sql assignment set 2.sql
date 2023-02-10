use assignment;

/*1. select all employees in department 10 whose salary is greater than 3000. [table: employee]*/

SELECT 
    *
FROM
    employee
WHERE
    salary > 3000 AND deptno = 10;
    
    /*2. The grading of students based on the marks they have obtained is done as follows:

*/
SELECT 
    *
FROM
    students
WHERE
    marks BETWEEN 50 AND 60;
SELECT 
    *
FROM
    students
WHERE
    marks BETWEEN 80 AND 100;
    
    /*3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]*/
SELECT DISTINCT
    name, id
FROM
    city
WHERE
    id % 2 = 0;
    
    /*4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.
[table: station]

*/
SELECT 
    (COUNT(city) - COUNT(DISTINCT city)) AS difference
FROM
    station;
    
    /*a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

*/
SELECT DISTINCT
    city
FROM
    station
WHERE
    city LIKE ('a%') OR city LIKE ('e%')
        OR city LIKE ('i%')
        OR city LIKE ('o%')
        OR city LIKE ('u%');
	
/*b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates*/

SELECT DISTINCT
    city
FROM
    station
WHERE
    city LIKE ('%a%') OR city LIKE ('%e%')
        OR city LIKE ('%i%')
        OR city LIKE ('%o%')
        OR city LIKE ('%u%');
        
/*c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT
    city
FROM
    station
WHERE
    city NOT LIKE ('a%') OR city LIKE ('e%')
        OR city LIKE ('i%')
        OR city LIKE ('o%')
        OR city LIKE ('u%');
        
/*d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]

*/

SELECT DISTINCT
    city
FROM
    station
WHERE
    city NOT LIKE ('%a%')
        OR city LIKE ('%e%')
        OR city LIKE ('%i%')
        OR city LIKE ('%o%')
        OR city LIKE ('%u%');
        
/*6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]*/

SELECT 
    *
FROM
    emp
WHERE
    salary > 2000
        AND hire_date >= DATE_SUB(CURRENT_DATE,
        INTERVAL 36 MONTH)
ORDER BY salary DESC;

/*7. How much money does the company spend every month on salaries for each department? [table: employee]*/
SELECT 
    deptno, SUM(salary)
FROM
    employee
GROUP BY deptno;

/*8. How many cities in the CITY table have a Population larger than 100000. [table: city]*/

SELECT 
    COUNT(name), population
FROM
    city
WHERE
    population > 100000;
    
    /*9. What is the total population of California? [table: city]*/

select district , sum(population) from city where district= 'california';

/*10. What is the average population of the districts in each country? [table: city]*/
SELECT 
    countrycode, AVG(population)
FROM
    city
GROUP BY countrycode;

/*11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]


*/
select o.orderNumber,o.status,o.customerNumber,c.customerName,o.comments from orders as o left join customers as c on o.customerNumber=c.customerNumber where o.comments like '%disputed%';
