-- Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders. 

-- How can you isolate (or group) the transactions of each cardholder?
-- small_trans_cardholder

SELECT credit_card.cardholder_id,
		card_holder.cardholder_name,
		transaction.card,
		transaction.transaction_id,
		transaction.amount
FROM credit_card
INNER JOIN card_holder ON (credit_card.cardholder_id = card_holder.cardholder_id)
INNER JOIN transaction ON (credit_card.card_number = transaction.card)
WHERE amount < 2.00
ORDER BY credit_card.cardholder_id, card_holder.cardholder_name, transaction.card, transaction.transaction_id, transaction.amount;

-- Count the transactions that are less than $2.00 per cardholder. 
-- small_trans_cardholder_count

  
-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
-- hacked_cards

SELECT * FROM transaction WHERE amount <= 2.00;

-- Take your investigation a step futher by considering the time period in which potentially fraudulent transactions are made. 

-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?
-- top_100_7_9
SELECT * FROM transaction
WHERE date::time between time '07:00:00' and '09:00:00' 
ORDER BY amount DESC
LIMIT 100;

-- Do you see any anomalous transactions that could be fraudulent?

-- Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
-- top_100_7_9_count
SELECT * FROM transaction
WHERE date::time between time '07:00:00' and '09:00:00' 
ORDER BY amount DESC
LIMIT 100;


-- If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

-- What are the top 5 merchants prone to being hacked using small transactions?
-- top_5hacked_merchants 

SELECT merchant
		category
FROM transaction 
WHERE amount < 2.00
GROUP BY 
ORDER BY merchant DESC
LIMIT 5;

-- Create a view for each of your queries.

CREATE VIEW small_trans_cardholder AS
SELECT credit_card.cardholder_id,
		card_holder.cardholder_name,
		transaction.card,
		transaction.transaction_id,
		transaction.amount
FROM credit_card
INNER JOIN card_holder ON (credit_card.cardholder_id = card_holder.cardholder_id)
INNER JOIN transaction ON (credit_card.card_number = transaction.card)
WHERE amount < 2.00
ORDER BY credit_card.cardholder_id, card_holder.cardholder_name, transaction.card, transaction.transaction_id, transaction.amount;

CREATE VIEW small_trans_cardholder_count AS

CREATE VIEW hacked_cards AS

CREATE VIEW top_5hacked_merchants AS 