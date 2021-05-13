/*To check databases*/
show databases;

/*To create database*/
create database learndb;
show databases;
 
/*To get access od database*/
use learndb; 

/*To show table*/
show tables;

/*To create a new table in database*/
create table students(stdid integer, 
					 sname char(20), 
					 age integer, 
                     course char(20));
show tables;

/*To display the structure or describe the table*/
desc students;
/*To insert records into table*/
insert into students values(1,'Jon',30,'Mysql');
insert into students values(2,'Ben',32,'Mysql');

/*To select everything from table*/
select*from students;

create table patients(pid integer,
                      pname varchar(30),
                      dob date,
                      toa datetime);
                 
desc patients;

insert into patients values(1,'Patrick','1993-06-23','2021-02-17 07:30:00');
select*from patients;

/*To select current date and time*/
select now();

insert into patients values(2,'Harry','1965-06-12',now());
select*from patients;

create table patients(id integer);
create table if not exists patients(id integer);
select*from patients;

create table mytab(id integer,
                   nam char(20));
insert into mytab values(1,'larry');
select*from mytab;
show tables;

/*To drop table from database*/
drop table mytab;
show tables;
select*from mytab;  /*table does not exist*/

/*alter table- for change in created table*/
select*from students;

/*Adding one more column using alter command*/
alter table students add column marks integer;
select*from students;

/*Null means unknown values*/
select 5+10;  /*as a calculator*/
select 5+null; /*we can not use any arithmetic operation with NULL output will Null always*/
 
select 3=3;
select 3=5;
select 3=null;
select 3 is null;
select 3 is not null;

select*from students;
/*dropping column using alter command*/
alter table students drop column age;
select*from students;

/*change the name of column using alter command*/
alter table students change column stdid sid integer;
select*from students;

desc students;
/*change the data type of column using alter command*/
alter table students modify column sname varchar(255);
desc students;

/*rename the table using alter command*/
alter table students rename myclass;  /*here rename is clause*/
show tables;
select*from myclass;

/*rename the table using rename command*/
rename table myclass to students; /*here rename is command*/
show tables;
select*from students;














