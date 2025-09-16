-- VIEWS
-- In SQL, a view is a virtual table based on the result-set of an SQL statement. 
-- A view also has rows and columns as they are in a real table in the database.
use airlinedb;


 create view business_airline1 as (
 select class_id, count(customer_id) as no_of_passengers,
 sum(price_per_ticket) as total_revenue from ticket_details
 where class_id = 'business'
 group by class_id);
 
 select * from business_airline1;
 
 

 