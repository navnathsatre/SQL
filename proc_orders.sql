CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_orders`()
BEGIN
   declare l_pcode varchar(15);
   declare l_pvendor varchar(50);
   declare l_qty, finished integer default 0;
   declare prod_cur cursor for select pcode, pvendor, qtyinStock from products;
   declare continue handler for NOT FOUND
   begin
       set finished = 1;
   end;
open prod_cur;
  prodloop:LOOP
      fetch prod_cur into l_pcode, l_pvendor, l_qty;
      if finished = 1 then
         leave prodloop;
      end if;
   
     if l_qty < 2000 then
        insert into orders (product_code, vendor, status)
        value(l_pcode, l_pvendor, 'Order Immediately');
     elseif l_qty between 2000 and 5000 then
        insert into orders (product_code, vendor, status)
        value(l_pcode, l_pvendor, 'Needed soon');
     end if;
     
  END LOOP prodloop;
close prod_cur;
select 'Process completed' as Message;
END