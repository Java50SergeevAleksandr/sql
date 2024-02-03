-- operator select
-- select * from models where company='company1';
-- select * from car_owners where birth_date between '1990-01-01' and '1995-12-31';
-- select * from car_owners where phone like '050%';
-- 
-- operator projection
-- select name, date_part('year',age(birth_date)) as age from car_owners where birth_date > '1995-01-01'

select substring(phone from '\d+') as "phone prefix" from car_owners where city = 'city1';
select * from models where engine_power > engine_capacity * 0.06;
select name, phone from car_owners where EXTRACT(MONTH from birth_date)=12;
select number, model_name, model_year from cars where kilometers > 5000 and state = 'good';
select car_number, date from trade_deals where EXTRACT(MONTH from date) between 3 and 5;


