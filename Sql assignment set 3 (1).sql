use assignment;

/*1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 

*/
call order_status(2005,11);

/*2. Write a stored procedure to insert a record into the cancellations table for all cancelled orders.*/
/*/*a.	Create a table called cancellations with the following fields

*/

CREATE TABLE cancellations (
    id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    customerNumber INT,
    orderNumber INT,
    FOREIGN KEY (customerNumber)
        REFERENCES customers (customerNumber),
    FOREIGN KEY (orderNumber)
        REFERENCES orders (orderNumber),
    comments VARCHAR(255)
);
 select * from cancellations;

 /*b. Read through the orders table . If an order is cancelled, then put an entry in the cancellations table.

*/

 alter table cancellations add column orderstatus varchar(255);
 insert into cancellations (customerNumber,orderNumber,comments)
 select customerNumber,orderNumber,comments from orders;
call cancellation();

/*3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum
*/



CREATE TABLE payment (
    purchase_status VARCHAR(255),
    amount NUMERIC,
    customernumber INT,
    FOREIGN KEY (customernumber)
        REFERENCES customers (customerNumber)
);
set global log_bin_trust_function_creators = 1;

/*b. Write a query that displays customerNumber, customername and purchase_status from customers table.*/

SELECT 103 AS customerNumber, PUR1_STAT(103) AS purchase_status;

SELECT 
    c.customerNumber, c.customerName, p.purchase_status
FROM
    customers AS c
        INNER JOIN
    payment AS p ON c.customerNumber = p.customernumber;
/*4. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

*/


/*5. Select the first name of the employee who gets the third highest salary. [table: employee]*/


SELECT 
    fname, salary
FROM
    employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

/*6. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]*/
select empid,salary,rank() over (order by salary desc) salary_rank from employee;

