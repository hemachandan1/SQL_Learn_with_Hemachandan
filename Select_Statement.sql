CREATE  DATABASE CLASS4DB;

USE CLASS4DB;

SELECT * FROM EMP;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMP;

SELECT FIRST_NAME, LAST_NAME, SALARY,  SALARY * 12 FROM EMP;

-- Aliases : temporayly change the 
SELECT FIRST_NAME, SALARY AS ONE_MONTH_SAL,  SALARY * 12 AS ANNUAL_SAL, SALARY/30 AS ONE_DAY_SAL FROM EMP;

select DEPT FROM EMP;
-- Distinct: TO reduce the duplicates AND Display the values
select distinct DEPT FROM EMP;
select distinct country FROM EMP;

-- Where clause 
select * from emp where role = 'Manager';

-- show the employee salary is above 10000
select * from emp where  salary > 10000;

-- Show the employe who are working in India
select * from emp where country = 'india' ;

-- show the employee salary is above 10000 and manager
select * from emp where  salary >= 10000 and role ='manager';

-- show the employee who are female managers
select * from emp where  gender  = 'f' and role ='manager';

-- >show all emp whoes salary b/w 10000 and 15000
select * from emp
where salary>=10000 and salary <= 15000;
-- another way using between operator [between operator works for numerical values only]
select * from emp
where salary between 10000 and 15000;

-- >show all emp whoes salary b/w 10000 and 15000 and their country is canada
select * from emp 
where country ='canada'  and salary between 10000 and 15000 ;

-- >show all the emp from retail and finance dept
select * from emp
where dept ='retail'  or dept ='finance' ;
-- another way using in operator
select * from emp
where dept in('retail','finance');

-- >show all the emp from retail and finance,healthcare dept
select * from emp
where dept in('retail','finance','healthcare'); 

-- >show all the emp from retail and finance dept and whose continent is asia
select * from emp
where continent ='asia' and dept in('retail','finance');

/* like operators :- this is used to specify conditions on strings 
and date columns as pattren type.
 
 %  -- is ment for ignoring group of chars.
 _(underscore) --is ment for ignoring group of  single chars.
*/
-- show all emp whoses first name starts with 'k'
select * from emp where first_name like 'k%' ;

-- show all emp whoses first name ends with 'n'
select * from emp where first_name like '%n' ;

-- show all emp whoses first name exists an alphabet 'e'
select * from emp where first_name like '%e%' ;

-- show all emp whoses first name second letter starts with 'a'
select * from emp where first_name like '_a%' ;

-- show all emps whose first name second letter starts with 'a' and 4th letter is 'e'
SELECT * FROM EMP WHERE FIRST_NAME LIKE '_a_e%';

-- group functions 
select max(salary) from emp;
select min(salary) from emp;
-- can perform all the groups together
select max(salary), min(salary), sum(salary), avg(salary) from emp;
select max(salary), min(salary), sum(salary), avg(salary),count(salary) from emp ;
--  we can also use the aliases as function to display the column
SELECT 
MAX(SALARY)  AS MAXSALARY, MIN(SALARY) AS LOWEST_SAL, SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVEREAGE_SAL, COUNT(SALARY) AS NO_OF_SALARIES
FROM EMP;

-- GROUP BY 
SELECT DEPT, MAX(SALARY) FROM EMP GROUP BY DEPT;

-- CALCULATE sum of salaries based on roles 
SELECT ROLE, SUM(SALARY) FROM EMP GROUP BY ROLE;

-- Show only Manager and Lead Data Scientiest role based sum of salaries. 
SELECT ROLE, SUM(SALARY) FROM EMP
where role in('manager', 'lead dats scientist')
 GROUP BY ROLE;
 
 -- Show all max, min, sum and avg salaries based on country. 
 select country, max(salary), min(salary), sum(salary), avg(salary) from emp group by country;
 
 -- having clause
select country, max(salary) from emp group by country
having max(salary) > 10000;






