/*DML: Data Manupalation Language*/
/*Write Only (in table)*/
/*INSERT
  UPDATE
  DELETE*/


/*To show databases*/
show databases;

/*select which database you have to use*/
use learndb;

/*To show all tables in the database*/
show tables;

desc students;
select*from students;

SET SQL_SAFE_UPDATES=0;  /*First time use this command to safe updated*/

insert into students values(3,'Mary','Analatycs',50);
select * from students;

insert into students values(4,'Tom', null, 57);  /*null inserting*/
select*from students;

insert into students (sid, sname, marks)  /*anather way to insert records with null*/
             values (5,'Lara',88);
select*from students;

/*iserting multiple records at a time*/
insert into students values(6,'Harry','Data Science',98),
						   (7,'Potter','Mysql',87),
                           (8,'Patrick','Data Science',67);
select*from students;

/*Changes in the records using update command*/
/*Always use where clause when you have to change in the record*/

/*In 4th record change Tom to Thomas*/
update students set sname='Thomas' where sid=4; 
select*from students;

/*fill null in course with Analatics*/
update students set course='Analatycs' where course = null;  /*not working*/
select*from students; 

update students set course = 'Analatycs' where course is null; /*now working*/
select*from students;

/*multiple changes at a time*/
update students set sname = 'Jonthan', marks = 55 where sid = 1; /*Don't forgate to use where clause*/
select*from students;

update students set marks = 95 where sname = 'Ben';
select*from students;

/*if we fergate to use where clause all entries fill with it*/
update students set course = 'Data Science';
select*from students;

/*deleting records using DELEDE commande */
delete from students where sid = 4;   /*remember to use where clause*/
select*from students;

delete from students where marks < 60;
select*from students;

insert into students values (2,'Larry','Mysyl',77);  /*notify NO indexing in SQL*/
select*from students;

/*check the no. of records using count*/
select count(*) from students;

delete from students;   /*every records are ddeleted*/
select count(*) from students;
select*from students;

insert into students values(2,'Larry','Mysql',77),
						   (6,'Harry','Data Science',98),
                           (7,'Porrte','Mysql',87),
                           (8,'Partick','Data Science',86);
select*from students;


                           
                           
                           
                           
			