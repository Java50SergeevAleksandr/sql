--Get model names of the car owners, age of which greater than average age of all owners more than on 10%
-- select distinct model_name 
-- from cars 
-- where owner_id in (
-- 	select id from car_owners where age(birth_date) >(select avg(age(birth_date)) as avg from car_owners) * 1.1
-- 				)
-- 	order by model_name asc;

--Get person names of cars with maximal engine capacity
-- select name
-- from car_owners
-- where id IS NOT null and id in (
-- 	select owner_id
-- from (
-- 	select * from (
-- 					select * from cars 
-- 					where model_name in (
-- 										select name
-- 										from models 
-- 										where engine_capacity = (select max(engine_capacity) from models)
-- 										)
-- 					) where model_year in (
-- 											select year from models where engine_capacity = (select max(engine_capacity) from models)
-- 											)
-- 	)
-- )


--Get two most popular models (according to the existing cars, not trade deals)
--select model_name, count(*) as amount from cars group by model_name order by amount desc limit 2;

--Get model names, cars of which have at least two different colors (consider using construction ‘exists’)
--select model_name from cars group by model_name having count (distinct color) > 1

-- SELECT DISTINCT  model_name FROM cars table1 WHERE EXISTS
-- (SELECT * FROM cars as table2 WHERE table1.model_name = table2.model_name AND table1.color != table2.color)


--Display table of ages distribution by intervals of 10 years. How many persons have age in each interval.
select 
	 intr_val * 10 as min, 
	 (intr_val + 1) *10 as max,
	count(*) as amount 
	from (select floor (extract (year from age(birth_date))/10) as intr_val from car_owners)
	group by min, max  order by min
