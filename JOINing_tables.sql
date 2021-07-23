/*
JOINing Tables (in MySQL)
1. Inner Join
2. Left Join
3. Right Join
4. Self Join
5. Cross Join(no need to commen column)
*/


show databases;
use learndb1;
show tables;

/*INNER JOIN (select commen records only)*/
select * from movies;
select * from members;

/*id of movies and movieid of memebers are commen*/
select movies.id, movies.title, members.first_name, members.last_name
from movies inner join members
on movies.id = members.movieid;


/*LEFT JOIN (select all records from left table and commen record)*/
select * from movies;
select * from members;

select movies.id, members.first_name, members.last_name
from movies left join members
on movies.id = members.movieid;

select id, title, first_name, last_name
from movies left join members
on id = movieid 
order by id;            /*use order by*/

select id, title, ifnull(first_name,'-'), ifnull(last_name,'-')
from movies left join members
on id = movieid;               /* replace null with - */

select mv.id, mv.title, ifnull(mm.first_name, '-') as fname, ifnull(mm.last_name,'-') as lname
from movies as mv left join members as mm
on mv.id = mm.movieid
order by mv.id;                /*use alias names*/


/*RIGHT JOIN */
select * from movies;
select * from members;

select memid, first_name, last_name, id, title 
from movies right join members
on id = movieid;


/*CROSS JOIN(no need common column)*/
show tables;
select * from meals;
select * from drinks;

select mealname, drinkname
from meals cross join drinks;

select mealname, drinkname, rate  /*error is there*/
from meals cross join drinks;

select mealname, drinkname, meals.rate,drinks.rate
from meals cross join drinks;

select meals.mealname, drinks.drinkname, meals.rate + drinks.rate as Total
from meals cross join drinks;


/*SELF JOIN (using inner join only)*/

select * from myemp limit 10;
select emp_id, first_name, last_name, mgr_id
from myemp limit 10;

/*Q. Who is manegers of given emp_ids*/
select emp.emp_id, emp.first_name, emp.last_name, mgr.mgr_id, mgr.first_name, mgr.last_name
from myemp as emp join myemp as mgr
on emp.mgr_id = mgr.emp_id;














