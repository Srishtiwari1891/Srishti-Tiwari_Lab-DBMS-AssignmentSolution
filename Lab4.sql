-- new database dbmslab4
CREATE DATABASE IF NOT EXISTS `order-directory`;

-- use database dbmslab4
USE `order-directory`;

-- *** Q1) CREATE TABLES ***
-- create table supplier
CREATE TABLE IF NOT EXISTS SUPPLIER(
SUPP_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL);

-- create table customer
CREATE TABLE IF NOT EXISTS CUSTOMER(
CUS_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(20) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR);

-- create table category
CREATE TABLE IF NOT EXISTS CATEGORY(
CAT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CAT_NAME VARCHAR(20) NOT NULL);

-- create table product
CREATE TABLE IF NOT EXISTS PRODUCT(
PRO_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "DUMMY",
PRO_DESC VARCHAR(60),
CAT_ID INT,
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID));

-- create table supplier_pricing
CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING(
PRICING_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

-- create table orders
CREATE TABLE IF NOT EXISTS ORDERS(
ORD_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
FOREIGN KEY(CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID));

-- create table rating
CREATE TABLE IF NOT EXISTS RATING(
RAT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
FOREIGN KEY (ORD_ID) REFERENCES ORDERS(ORD_ID));

-- *** Q2) INSERT RECORDS ***
-- insert records into supplier table
INSERT INTO SUPPLIER(SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES('Rajesh Retails','Delhi','1234567890');
INSERT INTO SUPPLIER(SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES('Appario Ltd.','Mumbai','2589631470');
INSERT INTO SUPPLIER(SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES('Knome products','Banglore','9785462315');
INSERT INTO SUPPLIER(SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES('Bansal Retails','Kochi','8975463285');
INSERT INTO SUPPLIER(SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES('Mittal Ltd.','Lucknow','7898456532');

-- insert records into customer table
INSERT INTO CUSTOMER(CUS_NAME,CUS_PHONE, CUS_CITY,CUS_GENDER) VALUES('AAKASH','9999999999','DELHI','M');
INSERT INTO CUSTOMER(CUS_NAME,CUS_PHONE, CUS_CITY,CUS_GENDER) VALUES('AMAN','9785463215','NOIDA','M');
INSERT INTO CUSTOMER(CUS_NAME,CUS_PHONE, CUS_CITY,CUS_GENDER) VALUES('NEHA','9999999999','MUMBAI','F');
INSERT INTO CUSTOMER(CUS_NAME,CUS_PHONE, CUS_CITY,CUS_GENDER) VALUES('MEGHA','9994562399','KOLKATA','F');
INSERT INTO CUSTOMER(CUS_NAME,CUS_PHONE, CUS_CITY,CUS_GENDER) VALUES('PULKIT','7895999999','LUCKNOW','M');

-- insert records into category table
INSERT INTO CATEGORY(CAT_NAME) VALUES('BOOKS');
INSERT INTO CATEGORY(CAT_NAME) VALUES('GAMES');
INSERT INTO CATEGORY(CAT_NAME) VALUES('GROCERIES');
INSERT INTO CATEGORY(CAT_NAME) VALUES('ELECTRONICS');
INSERT INTO CATEGORY(CAT_NAME) VALUES('CLOTHES');

-- insert records into product table
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('TSHIRT','SIZE-L with Black, Blue and White variations',5);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('OATS','Highly Nutritious from Nestle ',3);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('HARRY POTTER','Best Collection of all time by J.K Rowling',1);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('MILK','1L Toned MIlk ',3);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Boat Earphones ','1.5Meter long Dolby Atmos',4);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Jeans','Stretchable Denim Jeans with various sizes and color',5);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Project IGI','compatible with windows 7 and above',2);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Hoodie','Black GUCCI for 13 yrs and above',5);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
INSERT INTO PRODUCT(PRO_NAME,PRO_DESC,CAT_ID) VALUES('Train Your Brain','By Shireen Stephen',1);

-- insert records into supplier_pricing table
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (1,1,2,1500);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (2,3,5,30000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (3,5,1,3000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (4,2,3,2500);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (5,4,1,1000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (6,7,1,2000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (7,8,5,1500);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (8,10,2,10000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (9,1,3,1000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (10,3,4,2300);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (11,12,2,3500);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (12,4,5,4000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (13,5,2,3000);
INSERT INTO SUPPLIER_PRICING (PRO_ID,SUPP_ID,SUPP_PRICE) VALUES (14,9,2,1300);

-- insert records into orders table
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (102,1000,'2021-10-12',3,5);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (103,30000,'2021-09-16',5,2);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (104,1500,'2021-10-05',1,1);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (105,3000,'2021-08-16',4,3);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (106,1450,'2021-08-18',1,9);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (107,789,'2021-09-01',3,7);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (108,780,'2021-09-07',5,6);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (109,3000,'2021-00-10',5,3);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (110,2500,'2021-09-10',2,4);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (111,1000,'2021-09-15',4,5);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (112,789,'2021-09-16',4,7);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (113,31000,'2021-09-16',1,8);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (114,1000,'2021-09-16',3,5);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (115,3000,'2021-09-16',5,3);
INSERT INTO ORDERS (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES (116,4000,'2022-01-16',4,3);

-- insert records into rating table
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(101,4);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(102,3);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(103,1);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(104,2);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(105,4);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(106,3);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(107,4);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(108,4);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(109,3);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(110,5);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(111,3);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(112,4);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(113,2);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(114,1);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(115,1);
INSERT INTO RATING(ORD_ID, RAT_RATSTARS) VALUES(116,0);

-- Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select c.cus_gender as "Customer Gender",count(c.cus_id) as "Customer Count" from customer c inner join (select cus_id,sum(ord_amount) as ord_amt_sum from orders group by cus_id 
having sum(ord_amount)>=3000) as o on c.cus_id=o.cus_id group by c.cus_gender order by c.cus_gender;

-- Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2
select o.ord_id as "Order ID",p.pro_name as "Product Name",p.pro_desc as "Product Desc",o.ord_amount as "Order Amount" from orders o inner join supplier_pricing s on 
o.pricing_id=s.pricing_id inner join product p on p.pro_id=s.pro_id inner join customer c on c.cus_id=o.cus_id where c.cus_id=2;

-- Q5) Display the Supplier details who can supply more than one product
select s.supp_name as "Supplier Name",s.supp_city as "City",s.supp_phone as "Phone#",sp.pro_count as "Count of product supplied" from supplier s inner join 
(select supp_id,count(pro_id) as pro_count from supplier_pricing s group by supp_id having count(pro_id)>1) as sp on s.supp_id=sp.supp_id;

-- Q6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select p.cat_id as "Category ID",c.cat_name as "Category Name",p.pro_name as "Product Name",min(supp_price) as "Min Product Price" from
supplier_pricing sp inner join product p on sp.pro_id=p.pro_id inner join category c on c.cat_id=p.cat_id group by p.cat_id;

-- Q7) Display the Id and Name of the Product ordered after “2021-10-05”.
select p.pro_id as "Product ID",p.pro_name as "Product Name",o.ord_date as "Order Date" from orders o inner join supplier_pricing sp on
o.pricing_id=sp.pricing_id inner join product p on p.pro_id=sp.pro_id where o.ord_date>'2021-10-05';

-- Q8) Display customer name and gender whose names start or end with character 'A'.
select cus_name as "Customer Name",cus_gender as "Customer Gender" from customer where cus_name like 'A%' or cus_name like '%A';

-- Q9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
-- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER $$
CREATE PROCEDURE GetSupplierRating()
BEGIN
	select s.supp_id as "Supplier ID",s.supp_name as "Supplier Name",su.avgrating as "Supplier Rating",(case 
		when avgrating = 5 then "Excellent Service"
		when avgrating > 4 then "Good Service"
    when avgrating > 2 then "Average Service"
    else "Poor Service"
end) as Type_of_service from supplier s inner join ( select sp.supp_id as suppid,avg(r.rat_ratstars) as avgrating from rating r inner join orders o on r.ord_id=o.ord_id inner join supplier_pricing sp
on sp.pricing_id=o.pricing_id  group by sp.supp_id) as su on s.supp_id=su.suppid;
END $$
DELIMITER ;

call GetSupplierRating();