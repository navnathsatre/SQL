show databases;
create database learndb1;
use learndb1;
show tables;
create table students (sid int, sname char(30),age int, course char(30));
desc students;
insert into students values(1,'Jon',32,'Mysql');
insert into students values(2,'Mary',19,'Analatycs');
select*from students;

create table patients (pid integer, name varchar(30), dob date, toa datetime);
desc patients;
insert into patients values(1,'Smith','1987-07-13','2021-06-25 11.30.00');
insert into patients values(2,'Sanju','1999-09-09','2021-06-25 20.30.00');
select*from patients;

select adddate(dob, interval 31 day) from patients;

insert into patients values(3, 'Sumi', '1974-09-19', now());
select*from patients;


select 6+9;
select 3*789;
select null+5;
select 3=3;
select null =3;
select 3 is null;
select 3 is not null;
