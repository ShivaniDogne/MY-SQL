CREATE DEFINER=`root`@`localhost` TRIGGER `delete_cascade` BEFORE DELETE ON `movies` FOR EACH ROW begin
delete from rentals where movieid=old.id;
end