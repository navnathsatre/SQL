CREATE DEFINER=`root`@`localhost` PROCEDURE `exception`(cid integer, amt integer)
BEGIN         -- exit (we can put also)
    declare  continue handler for sqlexception
       begin
          select 'Exception Happened0' as message;
       end;
	
    -- Procedure Begine
    insert into payments values(cid, amt);
  --  select 'payment made' as message;
       if cid = 100 then
       select*from ttt;
       end if;
    select 'Process completed' as message;
END