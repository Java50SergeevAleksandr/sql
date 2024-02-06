--1--
select * from Employees e where not exists (select * from Departments  where manager_id = e.id )
select * from Employees where id not in  (select manager_id from Departments  where manager_id not null )

--2--
select a.id from test_a a
left join test_b b on b.id = a.id
where b.id = null

--3--
select u.name
from training_details td
join users u on u.id = td.user_id
group by training_date, name 
having count(*) > 1 
order by training_date desc

--4--
select id from table order by id desc limit 1


select top 1 id from table order by desc

--5--
SELECT
(select sum(x) as p_sum from A where x>=0)
(select sum(x) as n_sum from A where x<0)


SELECT sum(x) as p_sum,  (select sum(x) as n_sum from A where x<0) from A where x>=0


select sum(positive.x) as p_sum,
sum(negative.x) as n_sum
from (select * from A where x>0) positive
full join (select * from A where x<0)  negative
on positive.x = negative.x 

--6--
select order_date, customer_id, max(purchase_amount) from orders group by order_date, customer_id order by order_date, customer_id

select order_date, customer_id, max(purchase_amount) from orders group by order_date, customer_id order by 1, 2