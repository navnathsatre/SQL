CREATE PROCEDURE `proc_elseif` (x integer)
BEGIN
    if x > 10 then 
    select 'Number is greater than TEN' as message ;
    elseif x < 10 then 
    select 'Number is less than TEN' as message;
    else
    select ' number is TEN' as message;
    end if;
END