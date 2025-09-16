use class4db;
select * from emp;
select max(salary) from emp;

-- >> sub query
select * from emp where salary = (select max(salary) from emp);

-- >find all the salary less than max salary
select * from emp where salary < (select max(salary) from emp);

-- > find the second max salary
select max(salary) from emp where salary < (select max(salary) from emp);

-- find the second max salary with employee details
select * from emp where salary  = (
select max(salary) from emp where salary < (select max(salary) from emp));

-- show all emps who all gets salary >= max salary of retail dept
select * from emp where salary >= (
select max(salary) from emp where dept = 'retail');
 
-- > show all emp who are working(reporting) to president
--  prerequsit check the id
select emp_id from emp where role = 'president';
-- answer 
select * from emp where manager_id = (select emp_id from emp where role = 'president') ;

-- (select * from emp where role = 'manager') = (select emp_id from emp where role = 'president') ; MY QUESTION OR QUERY

-- >> ORDER BY CLAUSE
Select * from emp order by emp_id;

-- > show all emp salary in descending order 
Select * from emp order by salary desc;

-- > show all emp who are working(reporting) to president  ASCENDING order by salary
SELECT * FROM EMP WHERE MANAGER_ID=(SELECT EMP_ID FROM EMP WHERE ROLE = 'PRESIDENT')
ORDER BY SALARY; 

-- >Show all max salaries based on dept and asending order of dept
SELECT  MAX(SALARY), DEPT FROM EMP GROUP BY DEPT ORDER BY DEPT;
