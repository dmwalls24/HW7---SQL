CREATE VIEW transactions_by_cardholder AS
SELECT credit_card.cardholder_id, 
		card_holder.cardholder_name,
		transaction.card,
		transaction.transaction_id,
		transaction.amount
FROM credit_card
INNER JOIN card_holder ON (credit_card.cardholder_id = card_holder.cardholder_id)
INNER JOIN transaction ON (credit_card.card_number = transaction.card)
ORDER BY credit_card.cardholder_id, card_holder.cardholder_name, transaction.card, transaction.transaction_id, transaction.amount;

CREATE VIEW transactions_less_than_2dollars AS
SELECT credit_card.cardholder_id, 
		card_holder.cardholder_name,
		transaction.card,
		transaction.amount,
		transaction.transaction_id
FROM credit_card
INNER JOIN card_holder ON (credit_card.cardholder_id = card_holder.cardholder_id)
INNER JOIN transaction ON (credit_card.card_number = transaction.card)
WHERE amount < 2.00 
ORDER BY credit_card.cardholder_id, card_holder.cardholder_name, transaction.card, transaction.transaction_id, transaction.amount;

CREATE VIEW top_100_highest_transactions AS
SELECT * FROM transaction
WHERE date::time between time '07:00:00' and '9:00:00'
ORDER BY amount DESC
LIMIT 100;

CREATE VIEW top_5_hacked_merchants AS
SELECT transaction.merchant_id,
		transaction.amount, 
		merchant.merchant_id,
		merchant.merchant_name
FROM transaction
RIGHT JOIN merchant ON (merchant.merchant_id = transaction.merchant_id)
WHERE amount < 2.00
ORDER BY merchant.merchant_name;