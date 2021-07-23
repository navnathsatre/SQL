/*DML Commands (write) inside table(about rows)
               INSERT
               UPDATE
               DELETE */
               
show tables;
select * from students;


/*INSERT command (add new recod only)*/
insert into students values(3,'Tom', 'Mysql', 78);
insert into students values(4, 'Larry', null, 90); /*use null when we don't no*/
select * from students;
 
insert into students (std_id, sname, marks) values (5, 'Lara', 78);/*when we have more and col*/
 select * from students;
 
 /*insert multiple records at a time*/
 insert into students values(6,'Brad','Mysql',78),(7,'Tim','Analytics',null),(8,'Jim','Mysql',56);
 select * from students;
 
 
 /*UPDATE Command (changes in record only)*/
 
 set SQL_SAFE_UPDATES = 0;
 
 update students set sname = 'Maria' where std_id = 2;
 select * from students;
 
 update students set course = 'Analytics' where course is null;
 select * from students;
 
 update students set sname = 'Timothy', marks = 83 where std_id = 7; /*multiple changes*/
select * from students;
 
 update students set course = 'Mysql'; /*all rows afected if we miss where clause*/
 select * from students;
 
 
 /*DELETE Command (delete record only)*/
 delete from students where std_id = 3;
 select * from students;
 
 delete from students where marks = 50;
 select * from students;
 
 delete from students;/*delete all records from table*/
 select * from students;
 
 
 /*truncate is DDL Command*/
 truncate students;
 select * from students; /*drop table and create empty table*/
 
 
 