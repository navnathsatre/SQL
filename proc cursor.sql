CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cursor`()
BEGIN
   declare l_aid, finished  integer default 0;
   declare l_name varchar(60);
   declare auth_cur cursor for select authorid, name from authors where authorid < 5;
   declare continue handler for NOT FOUND
   begin
       set finished = 1;
   end;
   
   open auth_cur;
   
   authloop: LOOP
   fetch auth_cur into l_aid, l_name;
   
        if finished = 1 then
          leave authloop;
		end if;
   select concat(l_name, ' is author number ', l_aid) as message;
         
   END LOOP authloop;
   close auth_cur;
END