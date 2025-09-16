CREATE DATABASE AUGUSTDB;

USE AUGUSTDB;

create table student(
RollNo int primary key,
stdname varchar(20) not null,
DOB date,
gender char(1) check (gender in('M','F')),
AGE int check (age between  20 and 30),
location varchar(20) default 'hyderabad' 
);
insert into student(Rollno, stdname, dob, gender, age) values (1001, 'pavan kumar','2000-10-19','m',25 );

select * from student;
insert into student(Rollno, stdname, dob, gender, age)
 values
 (1002, 'Rahul kumar','2000-10-19','m',25),
 (1003, 'chandan kumar','2000-10-19','m',25),
 (1004, 'Palav kumar','2000-10-19','m',25),
 (1005, 'Raj kumar','2000-10-19','m',25);
 select * from student;




