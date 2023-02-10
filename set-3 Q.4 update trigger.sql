CREATE DEFINER=`root`@`localhost` TRIGGER `update_cascade` BEFORE UPDATE ON `movies` FOR EACH ROW begin
update rentals set  movieid=new.id where movieid=old.id;
end