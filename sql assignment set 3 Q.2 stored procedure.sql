CREATE DEFINER=`root`@`localhost` PROCEDURE `cancellation`()
BEGIN
insert into cancellations (orderstatus)
select status from orders where status='cancelled';


END