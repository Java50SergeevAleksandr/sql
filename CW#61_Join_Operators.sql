-- get owner's name and maximal engine capacity of appropriate cars
-- select o.name, max(engine_capacity) from car_owners o join cars c on o.id = c.owner_id
-- join models m on c.model_name = m.name and c.model_year = m.year group by o.name
--
--Get full data about persons having no cars
-- select id, name, city, phone, email, birth_date from car_owners left join cars on id = owner_id where number is null
--
--Get car numbers of cars with no owners
--select number from car_owners  right join cars on id = owner_id where id is null
--
--Get all owner's names and appropriate amount of cars
--select name, count(number) from car_owners  left join cars on id = owner_id group by name order by count(number) desc
--
--Get amount of models with engine capacity greater than 1300 and amount of models with engine capacity less than 1300
select count(t_big_capacity.name) as "amount of big capacity models", count(t_small_capacity.name) as "amount of small capacity models" 
from (select * from models where engine_capacity > 1300 ) t_big_capacity 
full join (select * from models where engine_capacity <= 1300) t_small_capacity
on t_big_capacity.name = t_small_capacity.name