use augustdb ;
select  * from  student; 
insert into student (rollno, Stdname, dob, gender, age, location)
value (1006,'hem','2001-10-14','m', 23,'Banglore');

use augustdb ;

CREATE database MARKSdb;  -- i did mistake here instead of creating table i have used database 
use marksdb;
CREATE TABLE MARKS(
ROLLNO INT PRIMARY KEY, 
SNAME  VARCHAR(20) NOT NULL, 
EXAM  VARCHAR(10) NOT NULL, 
SUB1 INT, SUB2 INT, 

TOTAL INT, AVGR  FLOAT,
RESULT CHAR(4));

INSERT INTO MARKS(ROLLNO, SNAME, EXAM, SUB1, SUB2)
VALUES
(101, 'PAVAN', 'QTRLY', 56,67),
(102, 'KIRAN', 'QTRLY', 23, 78),
(103, 'PAVANI','QTRLY', 67,89),
(104, 'MURALI','QTRLY', 90,78),
(105, 'RAKESH','QTRLY', 56,12);

select  * from  marks;

-- calculate total marks  [thise is a comment line ]
UPDATE  MARKS SET  TOTAL = SUB1+SUB2;

-- calculate average marks  
update marks set avgr = (sub1+sub2)/2;
select  * from  marks;

-- CALCULATE RESULT 'PASS' 
update marks set result= 'pass' where sub1>=35 and sub2>=35;

-- CALCULATE RESULT 'Fail' 
update marks set result= 'fail' where sub1<35 or sub2<35;

select  * from  marks;

-- MODIFY STUDNET NAME WHOSE ROLLNO HAVING 102
update marks set sname = 'kiran kumar' where rollno =102;

-- This is comment; to change location we can use like this below
use augustdb;
update student set location = 'delhi' where rollno = 1003 ;
select  * from  student;
UPDATE STUDENT SET LOCATION='BANGALORE' WHERE ROLLNO=1004;

 -- changing DOB 
 update student set dob = '2020-10-10' where rollno = 1003 ;
 
 -- DElete  Topic:-
 --  DELETE ALL ROWS FROM STUDENT WHOSE LOCATION IS 'DELHI'
 delete from student  where location = 'delhi'; -- do not execute bcz. its refrensce only
 
 -- delete all rows from student
delete from student; -- do not execute bcz. its refrensce only
 
-- DELETE A STUDENT WHOSE ROLLNO IS 1004
DELETE FROM STUDENT WHERE ROLLNO = 1004;
SELECT * FROM STUDENT; 
 
 -- Drop command: 
 
 DROP TABLE STUDENT; -- do not execute bcz. its refrensce only
 
-- Example table for Alter
CREATE TABLE SAMPLE_TEST(SNO INT NOT NULL, 
SNAME VARCHAR(20), 
LOCATION  INT);

 -- TO SEE STRUCTURE OF TABLE
DESCRIBE SAMPLE_TEST;
 
 -- Alter command:
 ALTER TABLE SAMPLE_TEST ADD PINCODE VARCHAR(6);
ALTER TABLE SAMPLE_TEST MODIFY COLUMN LOCATION VARCHAR(10);
ALTER TABLE SAMPLE_TEST ADD PRIMARY KEY(SNO);
ALTER TABLE SAMPLE_TEST DROP COLUMN  PINCODE;
ALTER TABLE SAMPLE_TEST DROP PRIMARY KEY;
 
 use augustdb;
 
 SELECT * FROM STUDENT; -- I can directly use this without the above use command. For better practice always use use command

ALTER TABLE STUDENT ADD PINCODE VARCHAR(6);
 









 