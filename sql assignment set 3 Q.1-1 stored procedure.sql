CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(month1 varchar (25),year1 int)
BEGIN
select orderNumber,orderDate,status from orders
where year(orderdate)=year1 and 
left(monthname(orderdate),3)=month1;

END