/*DDL Commands (DR CAT) (about struture)
               DROP 
               RENAME
               CREATE
               ALTER
               TRANCATE */


show databases;
use learndb1;
show table status;

/*CREATE command*/
create table students (id int);
create table if not exists students(id int); 

/*ALTER command*/
       /*clauses ADD
                 DROP
				 MODIFY
                 CHANGE
                 RENAME */
				
                
show tables;
select * from students;

alter table students add column marks integer; /*adding new column*/
select * from students;
alter table students drop column marks ;
alter table students add column marks integer default 50;
select * from students;

alter table students drop age;/*dropping age column*/
select * from students;

alter table students change column sid std_id integer; /*change column name*/
select * from students;

desc students;
alter table students modify column sname varchar(30);/*modify data type of column*/
desc students;

alter table students rename to myclass;/*rename table using rename clause*/
show tables;
select * from myclass;

/*RENAME command*/
rename table myclass to students;/*rename table using rename command*/
show tables;
select * from students;

/*DROP command*/
create table mytab (id int);
show tables;
drop table mytab;/*droping the table*/
show tables;

/*TRUNCATE Command*/
/*
truncate <table name>    --> drop table and create table 
*/