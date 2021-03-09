/* To show all databases on the server */
show databases;

/* To create  new database on server */
create database RIT;

/* To get access of database */
use RIT;

/* To create new table in database */
create table student(
PRN integer,
Stuname char(20),
Address varchar(200),
Graduation char(20));

/* To display the structure of table */
desc student;

/* To insert new records in table */
insert into student values(1,'Krishnaraj Kadam','Sangli','Enfineering');
insert into student values(2,'Jayant Patil','Kolhapur','BA');
insert into student values(3,'Abhijeet Shinde','Islampur','BA');
insert into student values(4,'Yogesh Virkar','Islampur','BSC');
insert into student values(5,'Smyak Jadhav','Badalapur','BMM');
insert into student values(6,'Dhruv Rathi','Mumbai','BCom');
insert into student values(7,'Akshada Jamdade','Pune','BSC');

/* To display all records */
select * from student;

/* To add new column into existing table */
alter table student add column Specialization char(100);

/* To check changed structure of table */
desc student;

/* To modify the data type of column */
alter table student modify column Branch varchar(100);

/* To rename the column */
alter table student change column specialization Branch char(100);
desc student;

/* To rename the table */
alter table MBA_Students rename to student;
show tables;

/* To drop the column from table */
alter table MBA_students drop column Branch;
desc MBA_students;

/* To delete all records from table it is similar to delete command. 
Only difference between these two is truncate first delete table with all records and then recreate same table with same structure and
delete command only delete all records not table*/
truncate mba_students;

/* To display first five records from table */
select * from myemp limit 5;


select * from myemp limit 2,5;

select first_name, last_name, salary, salary*0.15 from myemp limit 10;

/* To change the name of column in display only not in database */
select first_name, last_name, salary, salary*0.15 as bonus from myemp limit 10;

/* To concat To column */
select concat(first_name,' ',last_name) as EmpName, salary from myemp limit 10;