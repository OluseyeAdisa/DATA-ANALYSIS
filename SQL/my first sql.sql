--I want to create a table on SQL by writing a query
create table trip(
timestamp timestamp,
gender varchar(10),															
destination varchar(50),
time_of_travel integer,
type_of_activity varchar(50),
holiday_with varchar(100),
transportation varchar(50));

--I want to see my whole table
select *
from trip;

-- I want to see the total number of respondents
select count(*)
from trip;

-- I want to see the total number of male and female respondents
select gender, count(*)
from trip
group by gender
order by count(*) desc;

--What is the mot preferred destination?
select destination, count(destination)
from trip
group by destination
order by count(destination) desc
limit 1;

--What destination is the least preferred
select destination, count(destination)
from trip
group by destination
order by count(destination) 
limit 1;

select *
from trip;
--what is the most preferred type of activity
select type_of_activity, count(type_of_activity)
from trip
group by type_of_activity
order by count(type_of_activity) desc
limit 1;

--how would customers like to move around?
select transportation, count(transportation)
from trip
group by 1
order by 2 desc
limit 1;

--what is the customers preferred mode of holidaying?
select holiday_with, count(holiday_with)
from trip
group by 1
order by 2 desc
limit 1;

-- When will customers prefer to travel
select time_of_travel, count(time_of_travel)
from trip
group by 1
order by 2 desc
limit 1;

