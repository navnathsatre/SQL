/*Database Constraints
                    1)Domain Constaint
                    2)Key Constraint
                    3)Referential Integrety Constraint
*/

/*1) Domain Constraint
               -UNIQUE
               -NOT NULL
               -CHECK 
               -DEFAULT
*/

show databases;
use learndb1;
show tables;
select * from students;
drop table students;


create table students(sid integer UNIQUE, 
					  sname varchar(30) NOT NULL, 
                      age integer check(age > 18),
                      course varchar(30));
                      
describe students;

insert into students values(1,'Pete',23,'Mysql');
select * from students;

/*Try duplecate entry for key 'sid'*/
insert into students values(1,'Tim',23,'Mysql'); /*Not Work*/
insert into students values(2,'Tim',23,'Mysql');

/*Try to vilate minimum 'age' condition */
insert into students values(3,'Lara',17,'Analytics');/*NOt Work*/
insert into students values(3,'Lara',19,'Analytics');
select * from students;

/*Try to insert NULL into 'sname'*/
insert into students values(4,null,27,'Data Science');/*Not Work*/
insert into students (sid, age, course) values(4,27,'Data Science');/*also Not Work*/
alter table students modify column sname varchar(30) NOT NULL DEFAULT 'John';
desc students;

insert into students (sid, age, course) values(4,27,'Data Science');
select * from students;

insert into students values(4,null,27,'Data Science');/*also not work*/


/*Key and Referential Integrity Constrain*/
show tables;
select * from authors; /*PARANT TABLE*/
desc authors;
select * from books; /*CHILD TABLE*/
desc books;

drop table authors; /*can not drop parant first (bcz refered by foreign key in books table) */

drop table books;
drop table authors;

/*
DROP -> child first (FOREIGN KEY & PRIMARY KEY) then parant (PRIMARY KEY)
CREATE -> parant first(PK) then child(FK,PK)
*/

create table authors (authorid integer PRIMARY KEY,   /*PARANT TABLE*/
                      name varchar(50));
                      
insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');                      
desc authors;
select * from authors;

create table books (bookid integer PRIMARY KEY,       /*CHILD TABLE*/
					title varchar(255),
                    aid integer, 
                    FOREIGN KEY (aid) REFERENCES authors(authorid)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE);/*giving permision to delete, update to parant*/

insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);
insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);
insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);

select * from books;
desc books;  /*MUL --> FOREIGN KEY*/


delete from authors where authorid = 1;
select * from authors;
select * from books; /*also delete from child*/

update authors set authorid = 80 where authorid = 8;
select * from authors;
select * from books; /*also work on child*/


/*
TCL Commands
			- COMMIT
			- ROLLBACK
            - SAVEPOINT
            
TCL commands works only on DML commands (i. e insert, update, delete) 
*/

select * from students;
insert into students values (5,'Lia',21,'Mysql');
select * from students;

rollback; /*Not Work*/
select * from students;
/*because by default AUTOCOMMIT --> ON*/

set AUTOCOMMIT = 0;

insert into students values (6,'Harry',24,'Mysql');
select * from students;

ROLLBACK; /*it's working*/
select * from students;

set autocommit = 1; /*we can not rollback*/

rollback;
select * from students;

/*
if we START TRANSACTION --> autocommit = OFF
if we commit or rollback --> autocommit = ON
*/

create table tt (id char);

insert into tt value('a');
insert into tt value('b');
SAVEPOINT Sb;
select * from tt;

insert into tt value('c');
insert into tt value('d');
SAVEPOINT Sd;
select * from tt;

insert into tt value('e');
insert into tt value('f');
desc tt;
select * from tt group by (id) having count(id) >1; /*check duplecate entries*/

-- SET SQL_SAFE_UPDATES = 0;

-- delete from tt where id = 'f';

-- delete from tt where(select * from tt group by (id) having count(id) >1);

-- -- CREATE TABLE new_table
-- --   AS (SELECT * FROM tt WHERE (SELECT DISTINCT id
-- -- FROM tt));

-- select distinct id from tt;


select * from tt;

ROLLBACK TO Sd;   -- undu
select * from tt;

ROLLBACK TO Sb;
select * from tt;

COMMIT;           -- save

select * from tt;

insert into tt value ('f');
rollback;        -- not working
select * from tt;

set autocommit = 0; -- it we rollback

insert into tt value ('e');
select * from tt;
savepoint Se;

insert into tt value ('h');
select * from tt;
rollback to Se;
select * from tt;

rollback;
select * from tt;

insert into tt value ('g');
select * from tt;
rollback;
select * from tt;

/*
            ACID properties
                            - Atomicity  --> club multi cammands at one cammand
							- Consistancy --> trs must successful not in partial state
                            - Isolation --> commit, rollback not afected for all table
                            - Durability --> after TCL commands Buffer(cache) must be empty
                                             i.e commit - records goes to persistant memory
												rollback - records erase from Buffer(cache)

*/
