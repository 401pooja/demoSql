--CREATE DATABASE BIKESMODEL

--CREATE SCHEMA SALES
--CREATE SCHEMA PRODUCTION

CREATE TABLE SALES.STORES(
store_id    INT IDENTITY(1,1) PRIMARY KEY,
store_name  VARCHAR(20) NOT NULL,
phone       VARCHAR(10),
email       VARCHAR(100),
city        VARCHAR(100),
state       VARCHAR(50),
zip_code    VARCHAR(5)

);

CREATE TABLE SALES.QUATATIONS(
quatation_no INT IDENTITY(1,1) PRIMARY KEY,
valid_from DATE NOT NULL,
valid_to DATE NOT NULL
);

ALTER TABLE SALES.QUATATIONS
ADD description VARCHAR(50) NOT NULL

ALTER TABLE SALES.QUATATIONS
ALTER COLUMN description VARCHAR(30) NOT NULL

ALTER TABLE SALES.QUATATIONS
DROP COLUMN description

CREATE TABLE persons(
person_id INT IDENTITY PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50) NOT NULL,
dob DATE
)

INSERT INTO persons(first_name,last_name,dob) 
VALUES('sachine','TENDULKAR','1978-02-03'),
('Saurav','Ganguly','1975-02-03'),
('Rahul','Dravid','1974-02-03');

SELECT * FROM dbo.persons

ALTER TABLE dbo.persons
ADD full_name AS (first_name+' '+last_name);

ALTER TABLE dbo.persons
ADD NameWithDob AS (first_name+' '+last_name+' '+dob);


EXEC sp_rename 'persons','person' --change the table name


DROP TABLE #vippersons
CREATE TABLE #vippersons(
person_id INT  PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name varchar(20) NOT NULL
);


INSERT INTO #vippersons
SELECT person.person_id,person.first_name,person.last_name
FROM dbo.person

SELECT * FROM #vippersons WHERE person_id<3
                    --PRIMARY KEY AND FOREIGN KEY------
CREATE TABLE SALES.STAFFS(
staff_id    INT PRIMARY KEY,
first_name  VARCHAR(50) NOT NULL,
last_name   VARCHAR(50) NOT NULL,
store_id    INT NOT NULL,
CONSTRAINT fk_staffs_stores FOREIGN KEY (store_id )
REFERENCES SALES.STORES(store_id)
);

--ALTER TABLE SALES.STAFFS
--ADD COLUMN email VARCHAR(100) NOT NULL

 -----------------CHECK CONSTRAINT------------------

 CREATE TABLE SALES.ORDERED_ITEMS(
 order_id   INT NOT NULL,
 item_id    INT  NOT NULL,
 order_quantity INT CHECK(order_quantity>0) NOT NULL,
 unit_price  INT CHECK(unit_price>0) NOT NULL
 );

 INSERT INTO SALES.ORDERED_ITEMS VALUES(1,1,5,100)

 SELECT * FROM SALES.ORDERED_ITEMS

 ALTER TABLE SALES.ORDERED_ITEMS
 ADD order_amount INT 

 ALTER TABLE SALES.ORDERED_ITEMS
 DROP COLUMN order_amount

 ALTER TABLE SALES.ORDERED_ITEMS
 ADD order_amount AS (order_quantity*unit_price)

 INSERT INTO SALES.ORDERED_ITEMS VALUES(1,1,5,6)

 SELECT * FROM SALES.ORDERED_ITEMS

 --------------unique constrains-------------

 CREATE TABLE SALES.CUSTOMERS(
 customer_id INT PRIMARY KEY IDENTITY,
 first_name VARCHAR(50) NOT NULL,
 last_name  VARCHAR(50) NOT NULL,
 email      VARCHAR(50) UNIQUE
 );


 INSERT INTO SALES.CUSTOMERS(first_name,last_name,email)
 VALUES('tiger','tiger','t@gmail.com')

 SELECT * FROM SALES.CUSTOMERS