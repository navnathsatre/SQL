/*DQL Commands (read)
              SELECT 
*/

show tables;
select * from myemp;

select * from myemp limit 10;   /*limit*/

select first_name, last_name, mgr_id from myemp limit 5;

select distinct dep_id from myemp; /*distinct*/

select count(distinct dep_id) from myemp; /*count()*/

select distinct job_id from myemp;

show tables;
select * from person;
insert into person values(6,'Tom','Cruise');
select * from person;

select distinct fname from person;
select distinct lname from person;

select distinct fname, lname from person;  /*distinct combinations*/

select * from myemp;

select * from myemp order by last_name; /*order by*/

select * from myemp order by last_name desc; /*desc*/

select * from myemp order by HIRE_DATE;

/*Operators is part of WHERE clause*/

select * from myemp where EMP_ID = 100; /*where*/

select * from myemp where SALARY >= 10000;/*uncluding 10000*/

select * from myemp where SALARY > 10000; /*excluding 10000*/

select * from myemp where JOB_ID != 'st_clerk';

select * from myemp where SALARY between 10000 and 15000; /*10000 and 15000 include*/

select * from myemp where HIRE_DATE >='2000-01-01';
/*or*/
select * from myemp where year(hire_date)>=2000;

select * from students;
insert into students values(6,'Brad','Mysql',67),(7,'Nava','Data Science',null),(8,'haily','Analytics',91);
select * from students;

select * from students where marks = null; /*o/p empty set*/

select * from students where marks is null;

/*LIKE operator (pattern matching)*/
/* 
% --> match any no. of charactor (zero)
_ --> match exact one charactor
*/

select * from myemp where FIRST_NAME like 'J%'; /*starting with J*/
select * from myemp where FIRST_NAME like '%a'; /*ending with a*/
select * from myemp where FIRST_NAME like '%c%'; /*at any position*/

select * from myemp where FIRST_NAME like 'J____'; /*5 letter name starting wuth J*/

/*AND OR operators*/
select * from myemp where DEP_ID = 80 and SALARY > 10000; /*cannot use same column with AND operator*/

select * from myemp where DEP_ID = 80 or SALARY > 10000; 

select * from myemp where DEP_ID = 30 or DEP_ID = 40 or DEP_ID = 60;
/*or*/
select * from myemp where DEP_ID IN(30,40,60);  /*IN operator*/

select * from myemp where DEP_ID NOT IN (30,40,60);  /*NOT operator*/


/*Grouping Functions
                    max
                    min
                    avg
                    count
                    sum
                    std
                    stddev
i/p --> set of records
o/p --> only one
*/

select hire_date, year(hire_date) from myemp limit 10; /*YEAR is row level function*/

select max(salary) from myemp;
select min(salary) from myemp;
select avg(salary) from myemp;
select count(mgr_id) from myemp;
select sum(salary) from myemp;
select std(salary) from myemp;
select stddev(salary) from myemp;

/*write department wise max salary*/
select dep_id, max(salary) from myemp group by(DEP_ID); /*GROUP BY function*/

select dep_id, mgr_id, max(salary) from myemp group by DEP_ID, MGR_ID;

 
/*HAVING clause mostly use with group by function */
select dep_id, max(salary) from myemp group by DEP_ID HAVING DEP_ID = 30; /*for specific group*/

select dep_id, max(salary) from myemp group by DEP_ID having DEP_ID in(30,60,90); /*for multiple gps*/


