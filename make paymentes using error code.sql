CREATE DEFINER=`root`@`localhost` PROCEDURE `make_payment`(cid integer, amt integer)
BEGIN         -- exit (we can put also)
    declare AmountNull condition for 1048;
    declare  continue handler for 1048   
       begin
           insert into fraud (client_id, message, tot) 
           values (cid, 'Fraudulent Transaction', now());
       end;
	declare continue handler for 1146
       begin
           select 'Wrong Table' as message;
       end;
    -- Procedure Begine
    insert into payments values(cid, amt);
    select 'payment made' as message;
       if cid = 100 then
       select*from ttt;
       end if;
    select 'Process completed' as message;
END