show tables;
use learndb;
show databases;
SELECT*FROM students;
INSERT INTO students VALUES (1,'navnath','data science',null);
INSERT INTO students VALUES (2,'vaijnath','data science',55);
SET SQL_SAFE_UPDATES=0;
UPDATE students SET sname='nava' WHERE sid=1;
DESC students;
SELECT*FROM students;