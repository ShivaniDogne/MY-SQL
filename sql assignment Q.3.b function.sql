CREATE DEFINER=`root`@`localhost` FUNCTION `pur1_stat`(cid int ) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare stat varchar(20);
declare credit numeric;
set credit = (select sum(amount) from payments where customerNumber=cid);
if credit > 50000 then set stat='Platinum';
elseif (credit >= 25000 and 
credit <= 50000) then set stat = 'gold';
elseif credit<25000 then set stat = 'Silver';
end if; 

RETURN 1;
END