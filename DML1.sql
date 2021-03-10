show databases;
use rit;
show tables;
desc mba_student_batch_2020;

/* To insert the table with null value */
insert into mba_student_batch_2020(PRN,Address)values(8,'Sangli');
select * from mba_student_batch_2020;

/* Single time use of insert statement to add multiple records*/
insert into MBA_students values(9,'Stewen Smith','Delhi','Bcom'),(10,'Sachin Tendulkar','Mumbai','HSC');
select * from MBA_students;

/* To update table */
set sql_safe_updates=0;

/* To update record with prn=8 */
update mba_students set stuname='Rahin Mujumdar',Graduation='BSC' where prn=8;

/* To Update record with null value */
update mba_students set graduation='Doctor' where Graduation is null;

/* To replace all value of column with single value */
update mba_students set Graduation='Data Science';

/* To delete the record which satisfied given condition (=,<,>,<=,>=)from table  */
delete from mba_students where prn>=10;

/* To display the count of records */
select count(*) from mba_students;

/* delete all records from table */
delete from student;