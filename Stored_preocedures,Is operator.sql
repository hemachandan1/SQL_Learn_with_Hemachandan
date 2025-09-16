use class4db;
select * from emp;

--  CREATION OF PROCEDURE

delimiter //
CREATE PROCEDURE TEST_PRO()
BEGIN
	SELECT * FROM EMP;
END;

-- EXECUTION of procedures
CALL TEST_PRO(); -- shows all the employees in the emp table

-- > create procedure to show only retail dept employee s
delimiter //
create procedure emp_retail_pro()
begin
select * from emp where dept = 'retail';
end;

-- execution
call emp_retail_pro();

-- > create  a procedure to show employee based on department (use in parameter as input)
delimiter //
CREATE PROCEDURE EMP_DEPT_INFO(IN DNAME VARCHAR(20)) -- 1 parameter is placed
BEGIN 
	SELECT * FROM EMP WHERE DEPT = DNAME;
END;
-- execution 
call EMP_DEPT_INFO('finance');
call EMP_DEPT_INFO('healthcare');
call EMP_DEPT_INFO('Automotive');

-- > create a procedure to insert  rows into following tables 
create table author(author_id int primary key, 
					authorName varchar(30), 
					email varchar (50));

create table Bookinfo (BookId int primary key, 
						book_name varchar (30) not null, 
						author_id int,
						foreign key (author_id) references author(author_id) on delete cascade);

delimiter //

CREATE PROCEDURE BOOKS_AUTHOR_INFO(
IN AID INT, 
IN ANAME VARCHAR(20),
IN EMAIL VARCHAR(50),
IN BID INT, 
IN BNAME VARCHAR(20))

BEGIN
	INSERT INTO AUTHOR(author_id, authorName, email) values(AID, ANAME, EMAIL);
    INSERT INTO BOOKINFO(BookId, book_name, author_id) values(BID, BNAME, AID);
	SELECT A.*, B.* FROM AUTHOR AS A INNER JOIN BOOKINFO AS B
    ON A.author_id = B.author_id;
END;

-- execution
CALL BOOKS_AUTHOR_INFO(121, 'varun', 'varun@gmail.com', 11, 'SQL');

CALL BOOKS_AUTHOR_INFO(122, 'murali', 'murali@gmail.com', 12, 'ORACLE');

-- to check the values inserted un comment the below line and execute
-- select * from author 
-- select * from Bookinfo  

-- >> OUT PARAMETER
--  Show max salary from emp table using stored procedure with out parameter
delimiter //
CREATE PROCEDURE GET_MAX_SAL(OUT MSALARY INT)
BEGIN
		SELECT MAX(SALARY) INTO MSALARY FROM EMP; --  this works at the proceder level, it does store the data and send to the call 
END;

-- executions
CALL GET_MAX_SAL(@MSALARY); -- even this will not gets the output
SELECT @MSALARY; -- output gets here 

-- > show an emp name and country who is getting max salary using out parameter
delimiter //
CREATE PROCEDURE MAXSAL_EMP(OUT ENAME VARCHAR(20), OUT CTRY VARCHAR(10))
BEGIN
	SELECT FIRST_NAME, COUNTRY INTO ENAME, CTRY FROM EMP 
    WHERE SALARY = (SELECT MAX(SALARY) FROM EMP); 
END;

-- executions 
CALL MAXSAL_EMP(@ENAME, @CTRY);
SELECT @ENAME, @CTRY;

-- > show emp_name and salary based emp_id using in and out parameter of procedure
delimiter //
CREATE  PROCEDURE  GETEMPINFO(IN EID VARCHAR(10), OUT ENAME VARCHAR(20), OUT SAL INT)
BEGIN
	SELECT FIRST_NAME, SALARY INTO ENAME, SAL FROM EMP WHERE EMP_ID=EID;
END;

-- execution 
CALL GETEMPINFO('E002', @ENAME, @SAL);
SELECT @ENAME, @SAL;

-- --------------------------------
-- to delete the procedure use drop command 
DROP PROCEDURE TEST_PRO;


--  ALTER :
-- TO ADD or change anything in procedure (steps- Right click on procedure in scmema and click Alter stored procedure)


-- >>> IS OPERATOR 
/*
This operator is used to handel null values in specified column.
it works only in select statement
*/

-- MAKE NULL FOR THE PURPOSE OF IS OPERATOR
select * from emp;
update emp set country = null where emp_id ='e010';
update emp set country = null where emp_id =('e640','e478','e583');

-- > examples of is operator 
-- > show all emp whose contry is NULL
SELECT * from emp where country IS null;

-- > show all the emp who is having their countyr (not null country)
 select * from emp where country IS NOT NULL;
 
 -- > Show all emps  who is having their country and salary bw 10000 and 20000.
 select * from emp where country is not null
 and salary between 10000 and 20000;
 




















