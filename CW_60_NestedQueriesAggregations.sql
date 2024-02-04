--Get names of car owners having cars of model1
--select distinct owner_id, (select name from car_owners where id = owner_id) from cars where model_name = 'model1'
--Get full data about persons having no cars
     --'not in' construction works only if column of subquery cannot be null, since 'not in' always will give false for possible null value
--select * from car_owners where id not in (select owner_id from cars)
     -- 'not in' the best construction for following query
--select * from cars where number not in (select car_number from tread_deals);
    -- 'not exists' construction works always but less effective than 'not in'
--select * from car_owners where not exists (select * from cars where owner_id=id);
--
--Aggregations
--select round(avg(date_part('year',age(birth_date)))) as "average age" from car_owners
--select count(*) from cars where color='red'
--select color, count(*) from cars group by color
    -- get one most pupular color
	--select color, count(*) as amount from cars group by color order by amount desc limit 1
	--select color, count(*) as amount from cars group by color having count(*) > 3
	-- get all most popular colors
select color, count(*) as amount from cars group by color having count(*) =
(select max(count) from (select count(*) as count from cars group by color) counts)