/*
 -- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
create or replace view car_cost as
(select * from auto where cost < 25000.00);

-- проверка
select * from car_cost;
*/

/*
-- 2.	Изменить в существующем представлении порог для стоимости:
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS SELECT Name FROM CarsWHERE Cost<30000;
alter view car_cost as
(select * from auto where cost < 30000.00);

-- проверка
select * from car_cost;
*/

/*
-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create or replace view car_model as
(select * from auto where name in ('Skoda', 'Audi'));

-- проверка
select * from car_model;


+ Вывести название и цену для всех анализов,
которые продавались 5 февраля 2020 и всю следующую неделю.

with date_ord as
(select * from Orders
where ord_datetime regexp '2020-02-([0][5-9]|[1][0-2])')
select an_name 'Название анализа', an_price 'Стоимость анализа', ord_datetime 'Дата проведения'
from Analysis
join date_ord
on an_id = ord_an
order by ord_datetime;