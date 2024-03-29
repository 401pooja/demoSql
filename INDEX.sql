--------------------INDEXES---------------------------

CREATE TABLE PRODUCTION.PARTS(
PART_ID INT NOT NULL,
PART_NAME VARCHAR(100)
);

INSERT INTO PRODUCTION.PARTS
VALUES(1,'FRAME'),(2,'HEAD TUBE'),(3,'HANDLE BAR GRIP'),(4,'SHOCK ABSORBER'),(5,'FORK')

SELECT * FROM PRODUCTION.PARTS WHERE PART_ID=5

CREATE CLUSTERED INDEX IX_PARTS_ID
ON PRODUCTION.PARTS(PART_ID)

INSERT INTO PRODUCTION.PARTS VALUES(7,'ABC')
SELECT * FROM PRODUCTION.PARTS 

CREATE NONCLUSTERED INDEX IX_CUSTOMER_CITY
ON SALES.CUSTOMERS(CITY)

SELECT CUSTOMER_ID,CITY FROM SALES.CUSTOMERS 