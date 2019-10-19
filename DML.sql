
USE[BIKESMODEL]
INSERT INTO SALES.CUSTOMERS(first_name,last_name,email)
VALUES('smith','smith','smith@gmil.com'),
('marray','marry','marry@gmil.com'),
('Adam','Adam','adam@gmil.com')

SELECT * FROM SALES.CUSTOMERS

--------------UPDATE SET----------

UPDATE SALES.CUSTOMERS SET first_name='scot123',last_name='scot123',email='scot123@gmail.com' WHERE customer_id=1

SELECT * FROM SALES.CUSTOMERS

------------------DELETE-----------

DELETE FROM SALES.CUSTOMERS WHERE customer_id=3
SELECT * FROM SALES.CUSTOMERS
DELETE TOP(1) FROM SALES.CUSTOMERS;
SELECT * FROM SALES.CUSTOMERS;
TRUNCATE TABLE SALES.CUSTOMERS;
SELECT * FROM SALES.CUSTOMERS;

INSERT INTO SALES.CUSTOMERS(first_name,last_name,email)
VALUES('smith','smith','smith@gmil.com'),
('marray','marry','marry@gmil.com'),
('Adam','Adam','adam@gmil.com')

SELECT * FROM SALES.CUSTOMERS

------------------------------------------------------------------------------
ALTER TABLE SALES.STAFFS
ADD  email VARCHAR(50)

SELECT * FROM SALES.STAFFS

select TOP(3) store_id,store_name FROM SALES.STORES
DELETE TOP(2) FROM SALES.STAFFS
SELECT * FROM SALES.STAFFS




