-- I want to create a table
create table fraud(
	step integer, 
	type varchar(50), 
	amount float, 
	name_orig varchar(50), 
	oldbalance_org float,
	newbalance_orig float, 
	name_dest varchar(50), 
	oldbalance_dest float, 
	newbalance_dest float,
    is_fraud integer, 
	isflagged_fraud integer
);

-- I want to see the fraud table
select *
from fraud;
-- How many transactions occurred per transaction type?
select type, count(*) as no_of_transactions
from fraud
group by type
order by no_of_transactions desc;

--Which transaction type has the highest number of fraudulent transactions?
select type, count(is_fraud) as no_of_fraudulent_transactions
from fraud
where is_fraud = 1
group by type
order by no_of_fraudulent_transactions desc;

-- What is the average fraudulent transaction amount?
select round(avg(amount)) as avg_fraudulent_transaction_amt
from fraud
where is_fraud = '1';

--What is the maximum fraudulent transaction amount?
select max(amount) as Max_fraudulent_trx_amt
from fraud
where is_fraud = 1;

-- What is the minimum fraudulent transaction amount?
select min(amount) as Min_fraudulent_trx_amt
from fraud
where is_fraud = 1;

-- who are the top 10 customers with the highest amt defrauded?
select name_orig, sum(amount) as top10_cust_with_highest_amt_defrauded
from fraud
where is_fraud = 1
group by name_orig
order by top10_cust_with_highest_amt_defrauded desc
limit 10;

--How effective is the bank in flagging fraudsters
select sum(is_fraud) as actual_fraud, sum(isflagged_fraud) as bank_detected_fraud,
(sum(is_fraud)/sum(isflagged_fraud)) as effectiveness
from fraud;
-- Who are the top 20 fraudsters?
select name_dest, round(sum(amount)) as fraud_amount
from fraud
where is_fraud = 1
group by name_dest
order by sum(amount) desc
limit 20;
													