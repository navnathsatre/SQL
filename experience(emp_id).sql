CREATE DEFINER=`root`@`localhost` FUNCTION `experience`(eid integer) RETURNS int
BEGIN
	 declare l_exp integer default 0;
     select year(now()) - year(hire_date) into l_exp
     from myemp where emp_id = eid;
     
RETURN l_exp;
END