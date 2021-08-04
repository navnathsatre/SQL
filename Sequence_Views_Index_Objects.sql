/*SEQUENCE
		  --> Inplecitly Created using AUTO_INCREMENT & Primery Key
          --> Limitations --Associated with Primary key and associated with Integer only
*/

show databases;
use learndb1;
show tables;

create table if not exists mytab(id integer primary key AUTO_INCREMENT,
								 name char(30),
                                 age integer);
                                 
describe mytab;
insert into mytab (name, age) values ('Reno', 43),('Tomy',72);
select * from mytab;

SET SQL_SAFE_UPDATES = 0;
delete from mytab;

insert into mytab (name, age) values ('Johny', 23);
select * from mytab;   # id starts from 3

insert into mytab (name, age) values ('Jon', 77);
select * from mytab;

-- for restart 'id' use truncate command

truncate mytab; -- table drop & recreate
select * from mytab;

insert into mytab (name, age) values ('Jon', 77);
select * from mytab;



/*VIEWS (Insted of writing long query)
		--> Virtual Table
        --> Named Select
Window on Table
Does Not Store Data (No space in memory)
*/
show tables;

select * from myemp limit 10;
select first_name, last_name, dep_id, mgr_id from myemp limit 10;

create view myview as select first_name, last_name, dep_id, mgr_id from myemp limit 10;
select  * from myview;

select mv.id, mv.title, ifnull(mm.first_name, '-') fname, ifnull(mm.last_name,'-') lname
from movies as mv left join members as mm
on mv.id = mm.movieid
order by mv.id;

create view rentals as select mv.id, mv.title, ifnull(mm.first_name, '-') fname, ifnull(mm.last_name,'-') lname
from movies as mv left join members as mm
on mv.id = mm.movieid
order by mv.id;

select * from rentals;

create view dep_60 as select * from myemp where dep_id = 60;
select * from dep_60;

select * from authors;
create view aview as select * from authors where authorid < 10;
select * from aview;

insert into aview values (11, 'Larry Collins');
select * from aview; -- change in original table not in view
select * from authors;

drop view aview;  -- does not affect in data
select * from authors;

create view aview as select * from authors where authorid < 10 WITH CHECK OPTION;
insert into aview values (12, 'Brain Weiss'); -- check option fails
insert into aview values (1, 'Brain Weiss');  -- its working

select * from aview; -- it is updatable view
select * from authors;

/*
NOTE :- If Derived column is there then views are not updatable
        and 
        -derived column
        -aggregation functions
        -group by 
        -order by
        -join 
		also not updatable
only use for select  & allowed for null values
*/
show create view myview;  # To show your query
show create table students;



/*
INDEX
     -speed up the query
     -To improve performence
Note : index is created only on column/s in tables
     -index need large storage
Index Depends on --> 1) Data Types
                                  -unique
								  -spetial
								  -fulltext
                     2)Structure
                                  -Balence Tree(B.tree) index (default)
                                  -Hash index
                                  
it takes 2^k comparison
NOTES : 1. indexes sort data first
        2. index needs storage (it store in seperate memory)
        3. we can not create multi indexes on one column
								
syntax : create [unique|spetial|fulltext]
         INDEX <idx-name>[using HASH|BTREE]
         ON <table-name>(col-name)
*/      

select count(*) from employees;
select * from employees limit 5;
select * from employees where hire_date > '2000-01-01'; -- 0.180 Sec

create index hidx 
on employees(hire_date);

show indexes from employees;
select * from employees where hire_date > '2000-01-01';  -- 0.001 Sec


desc authors;
show indexes from authors;

desc students;
show indexes from students;

# Note: if we use any database constraint then by default index/s created

/*
Don't : 
       -if table is small
       -if table has frequent write operations (transacctions)
       -if lot of null
       
 Do : 
      -if table is large
      -if table has frequent read operations
      -if less null
*/
# note: combination of two indexes is called COMPOSITE INDEX
