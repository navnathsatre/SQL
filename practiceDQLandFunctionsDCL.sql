/*DQL: Data Query Language*/
/*Read Only (in Table)*/
/*SELECT*/

--------------------------------------------------------------------------------------------
/*DCL: Data Control Language*/
/*Permissions (Not for Developers)*/
/*GRANT
  REVOKE*/
/*Example queres
grant read on students to dev101;
grant write on students to dev101;
revoke write from dev101 on students;
*/
---------------------------------------------------------------------------------------------

/*select <col name or evevything (*)>
        CONCAT( _____ )
        DISTINCT 
        MAX ( )
        MIN ( )
        SUM ( )
        AVG ( )
        COUNT ( )
        STDDEV ( )
*/
/*select _________ from <col name> LIMIT
                                   WHERE <conditions> , BETWEEN  AND, IN, NOT IN 
                                   LIKE <_%> <%_%> <%_> <A___>
                                   GROUP BY
                                   ORDER BY
*/

show databases;
use learndb;
show tables;

select*from myemp;
select*from myemp limit 5;  /*To show first 5 records*/

select*from myemp limit 2, 6;   /*limit(start, till)*/

select first_name, last_name, salary from myemp limit 10; /*selcting perticular columns*/

select first_name, last_name, salary, salary*0.15 from myemp limit 8;  /*derived col from existing col*/

select first_name, last_name, salary, salary*0.15 as bonus from myemp limit 7; /*alias name for col*/

select first_name as fname, last_name as lname, salary, salary as bonus from myemp limit 6; /*for any col we give alias name*/

/*CONCAT*/
select concat(first_name,' ',last_name),salary from myemp limit 5; /*we can not give alias name in parameter*/

select concat(first_name,' ',last_name) as EmpNmae ,salary from myemp limit 5;



select*from myemp limit 8;
select dep_id from myemp;

/*DISTINCT*/
select distinct dep_id from myemp;  /*uniques from col*/

select distinct job_id from myemp;

show table status;  /*To check detials about tables*/
show tables;

select*from person;

insert into person values(6,'Tom','Cruise');
select*from person;

select distinct fname from person;

select distinct lname from person;

select distinct fname, lname from person; /*All possible combinations*/

/*WHERE*/
select*from myemp;

select*from myemp where dep_id = 60;

select*from myemp where salary >=10000;

select*from myemp where job_id <> 'SA_MAN';  /*not equal to*/
select*from myemp where dep_id != 50;   /*not equal to*/

show tables;

select*from patients;
desc patients;
insert into patients values(3,'jone',null,now());
select*from patients;

select*from patients where dob = null;  /*not selected or no output*/

select*from patients where dob is null; /*currect way*/
select*from patients where dob is not null;

select*from myemp where salary between 10000 and 15000; /*multiple conditions(clause) can apply*/

select*from patients where dob <=> null; /*is equal to sign*/

/*LIKE*/
/*
  '%'-->matches any no. of charactors
  '_'-->matches one charactor only
*/

/*preferences--> NOT --> AND --> OR*/

select*from myemp;
select*from myemp where first_name like 'J%';  /*at first*/
select*from myemp where first_name like '%a';  /*at last*/
select*from myemp where first_name like '%c%'; /*at anywhere*/

select*from myemp where first_name like 'j____'; /*only perticular*/

select*from myemp where dep_id = 50 and salary > 5000; /*both are true*/

select*from myemp where dep_id = 60 or salary >15000;  /*either one true*/

select*from myemp where dep_id = 60 or dep_id = 40 or dep_id = 90; /*multiple at a time*/
select*from myemp where dep_id IN(60,40,90);  /*same as above(insted of or)*/
select*from myemp where dep_id NOT IN (60,40,90);  /*excluding*/

select*from myemp where dep_id = 60 and dep_id = 90;  /*NOT working*/


/*FUNCTIONS IN SQL (it is row level functions)*/

/*multiple inputs and 1 outputs per row*/
select first_name, last_name, concat(first_name,' ',last_name) as Bonus from myemp limit 10;

/*group or aggregate there is 1 output as group*/

select max(salary) from myemp;
select min(salary) from myemp;
select sum(salary) from myemp;
select avg(salary) from myemp;
select count(salary) from myemp;
select stddev(salary) from myemp;

/*GROUP BY*/
/*Q. Take max salary from each dep_id*/
select dep_id, max(salary) from myemp group by dep_id;

/*Q. Take min salary from each dep_id*/
select dep_id, min(salary) from myemp group by dep_id;

/*Q. Take avg salary from each dep_id*/
select dep_id, avg(salary) from myemp group by dep_id;

/*Q. Take min salary from each dep_id and each mgr_id*/
select dep_id, mgr_id, min(salary) from myemp group by dep_id, mgr_id;  /*group within group*/

/*ORDER BY*/
select*from myemp order by first_name; /*default asc*/
select*from myemp order by salary desc;

select*from myemp order by hire_date;

select distinct dep_id from myemp order by dep_id;

select*from myemp order by last_name, first_name;  /*NOT working*/
select*from myemp order by left(last_name, 1), first_name; /*But not good way*/

select dep_id, mgr_id from myemp order by dep_id, mgr_id;
select dep_id, mgr_id from myemp order by dep_id desc, mgr_id;


select*from patients;
select adddate(dob, interval 20 day) from patients;


