create database class6db;
use class6db;
select * from  department;

-- >> INNER JOIN
SELECT EMPloyee.*, DEPARTMENT.* FROM EMPloyee INNER JOIN DEPARTMENT
ON EMPloyee.DEPT_ID = DEPARTMENT.DEPT_ID;

SELECT EMPloyee.F_NAME, EMPloyee.L_NAME, EMPloyee.SALARY, 
DEPARTMENT.DEPT_ID, DEPARTMENT.DEPT_NAME
FROM  EMPloyee INNER JOIN  DEPARTMENT
ON EMPloyee.DEPT_ID = DEPARTMENT.DEPT_ID;

-- we can use alias :- most of the real use case of joins uses alisas, Used to reduce the length and increase the typing 
SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  EMPloyee as e INNER JOIN  DEPARTMENT as d
ON E.DEPT_ID = D.DEPT_ID;

select * from employee;
update employee set dept_id = 22 where emp_id = 104;


-- >> OUTER JOIN :- 1) LEFT OUTR  2) RIGHT OUTER
SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  DEPARTMENT AS D LEFT OUTER JOIN EMPloyee AS E
ON E.DEPT_ID = D.DEPT_ID; 

SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  EMPloyee AS E LEFT OUTER JOIN DEPARTMENT AS D
ON E.DEPT_ID = D.DEPT_ID;


-- RIGHT OUTER JOIN
SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  DEPARTMENT AS D RIGHT OUTER JOIN EMPloyee AS E
ON E.DEPT_ID = D.DEPT_ID;

SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  EMPloyee AS E RIGHT OUTER JOIN DEPARTMENT AS D
ON E.DEPT_ID = D.DEPT_ID;

-- > cross join :- it does not use condition as like other joins, it produces duplicates(when ever  only join with out condition  performed the multiplication takes place )
SELECT E.*, D.* FROM  EMPLOYEE AS E CROSS JOIN DEPARTMENT AS D;
SELECT * FROM EMPLOYEE;

-- > self join :- same table columns to columns join (here two colomns of same table acts as tables)
-- show me employee name and their manager name as follows
--  Brooks     Black
--  Black      Black
--  Vlots      Brook
use class4db;
SELECT * FROM EMP;
SELECT E.First_NAME  AS MANAGER_NAME, M.First_NAME AS EMP_NAME   -- some data erroe is there but in real case e.first_name as emp_name ,m.first as manager_name(no error understanding purpose )
FROM EMP AS E INNER JOIN EMP AS M -- giving same table columns as two different table 
ON E.EMP_ID = M.MANAGER_ID;

USE CLASS6DB;
-- >>> EXAMPLES
-- show all emp from production dept (steps:- join and condition and where clause)
SELECT E.F_NAME, E.L_NAME, E.SALARY, 
D.DEPT_ID, D.DEPT_NAME
FROM  EMPloyee AS E INNER JOIN  DEPARTMENT  AS D
ON E.DEPT_ID = D.DEPT_ID
WHERE D.DEPT_NAME = 'PRODUCTION';

-- count no of emp from production dept (steps:- join and condition and where clause)
select count(e.f_name) from employee as e inner join department as d 
on e.dept_id = d.dept_id -- this is condition
where d.dept_name = 'production'; -- this is where clause 

-- count no of emp from each dept (steps:- join and condition and group by clause)
SELECT D.DEPT_NAME, COUNT(E.F_NAME) AS NO_OF_EMPS 
FROM EMPloyee AS E RIGHT OUTER JOIN DEPARTMENT AS D
ON E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_NAME;

-- imported CUSTOMER , PRODUCT AND SALES TABLES

SELECT * FROM CUSTOMER;
SELECT * FROM PRODUCT;
SELECT * FROM SALES;

-- MULTIPLE TABLE JOIN EXAMPLES (steps:- TAKE REQUIRED COLUMNS join and condition and group by clause)
SELECT C.C_NAME, C_PHONENO,
P.P_NAME, P.PRICE,
S.ORDER_DATE, S.ORDER_NO, S.QTY, S.PRICE AS  TOTALAMT
FROM CUSTOMER AS C INNER JOIN SALES AS S
ON C.C_ID = S.C_ID
INNER JOIN PRODUCT AS P
ON P.P_CODE = S.S_CODE;

