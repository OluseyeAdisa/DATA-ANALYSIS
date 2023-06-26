select * from actor;
select *
from address;
select title, description, release_year, rating
from film;
select address, district, postal_code
from address;

-- Group by clause works with aggregate clauses
select * 
from film;

select rating, count(rating)
from film
group by rating
order by count(rating) desc;

--I want to see all customers and the amount theyhave spent

select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc
limit 10;

-- I want to see customers who have spent a total of $180 and above to reward them (use the having clause)
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) >= 180
order by sum(amount) desc;

--inner join
select c.customer_id, first_name, last_name, email, amount, payment_date
from customer as c
inner join payment as p
on c.customer_id = p.customer_id;

--left join
select f.film_id, title,inventory_id
from film as f
left join inventory as i
on f.film_id = i.film_id
where inventory_id is null;

--right join

select inventory_id, i.film_id, title
from film as f
right join inventory as i
on f.film_id = i.film_id;


select *
from film as f
full join inventory as i
on f.film_id = i.film_id;
