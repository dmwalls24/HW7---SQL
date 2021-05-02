CREATE TABLE card_holder(
	cardholder_id INT PK,
	cardholder_name VARCHAR(252)
)

CREATE TABLE credit_card(
	card_number VARCHAR(20),
	cardholder_id INT FK
)

CREATE TABLE transaction(
	transaction_id INT,
	date TIMESTAMP, 
	amount INT,
	card_number VARCHAR (20) FK,
	merchant_id INT FK
)

CREAT TABLE merchant(
	merchant_id INT PK, 
	merchant_name VARCHAR(252)PK,
	id_merchant_category INT FK
)

CREATE TABLE merchant_category(
	id_merchant_category INT PK,
	merchant_name VARCHAR(252) FK
);