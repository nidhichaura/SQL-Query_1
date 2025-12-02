create database project;
create table  project.customer
(
customer_id int PRIMARY KEY not null,
customer_name varchar(30) not null,
customer_email varchar(30) not null,
customer_location varchar(30) not null
);
select database();
use project;
show tables;
desc customer;
create table project.product
(
product_id int PRIMARY KEY  not null,
product_name varchar(30) not null,
product_category varchar(30) not null,
product_price int not null
);
select database();
use project;
show tables;
desc product;
create table project.orders
(
orders_id int PRIMARY KEY  not null,
customer_id int not null,
orders_date  varchar(30) not null,
FOREIGN KEY(customer_id) references customer(customer_id)
);
select database();
use project;
show tables;
desc orders;
create table project.orderDetails
(
orders_id int  not null,
product_id int not null,
quantity  int  not null,
FOREIGN KEY(orders_id) references orders(orders_id),
FOREIGN KEY (product_id) references product(product_id)
);
select database();
use project;
show tables;
desc orderDetails;
INSERT INTO customer VALUES (1,"aaditya", "aadi76@gmail.com", "delhi");
INSERT INTO customer VALUES (2,"ayaan","ayaan56@gmail.com","kolkata");
INSERT INTO customer VALUES (3,"reyansh","reyansh029@gmail.com","mumbai");
INSERT INTO customer VALUES (4,"vihaan","vihaan87@gmail.com","hyderabad");
INSERT INTO customer VALUES (5,"shlok","aryan16@gmail.com","noida");
select*from  customer;
INSERT INTO product VALUES(1,"Laptop","electonics",100000);
INSERT INTO product VALUES(2,"washing machine","electonics",20000);
INSERT INTO product VALUES(3,"skinCare","BeautyProduct",11000);
INSERT INTO product VALUES(4,"hairCare","BeautyProduct",4000);
INSERT INTO product VALUES(5,"Television","electonics",98000);
select * from product;
INSERT INTO orders VALUES (1,1,"11-07-25");
INSERT INTO orders VALUES (2,2,"12-07-25");
INSERT INTO orders VALUES (3,3,"13-07-25");
INSERT INTO orders VALUES (4,4,"14-07-25");
INSERT INTO orders VALUES (5,5,"15-07-25");
SELECT  * FROM orders;
INSERT INTO orderDetails VALUES(1,1,3);
INSERT INTO orderDetails VALUES(2,2,2);
INSERT INTO orderDetails VALUES(3,3,4);
INSERT INTO orderDetails VALUES(4,4,5);
INSERT INTO orderDetails VALUES(5,5,2);
SELECT* FROM orderDetails;
select product_category,sum(product.product_price*orderDetails.quantity) AS TOTAL_REVENUE from orderDetails JOIN  product ON orderDetails.product_id=product.product_id GROUP BY product_category;
select  customer_name,sum(product.product_price*orderDetails.quantity) AS TOTAL_PURCHASE_AMOUNT from orders join customer on orders.customer_id =customer.customer_id join orderDetails on orders.orders_id = orderDetails.orders_id join product on orderDetails.product_id= product.product_id group by customer.customer_id order by TOTAL_PURCHASE_AMOUNT DESC LIMIT 5; 
select  product.product_id,product.product_name  from product left join orderDetails on product.product_id=orderDetails.product_id where orderDetails.product_id IS NULL;
select orders.orders_date, sum(product.product_price*orderDetails.quantity)  AS HIGHEST_REVENUE  FROM orders join orderDetails on orders.orders_id=orderDetails.orders_id join product on orderDetails.product_id = product.product_id group by orders_date ORDER BY HIGHEST_REVENUE DESC LIMIT 1;
select product.product_name,sum(orderDetails.quantity) as TOTAL_QUANTITY FROM orderDetails join product on orderDetails.product_id=product.product_id group by product.product_id order by TOTAL_QUANTITY DESC LIMIT 1;
select customer.customer_name, MAX(orderDetails.quantity) AS TOTAL_ORDERS FROM orderDetails join product on orderDetails.product_id = product.product_id join orders on orderDetails.orders_id= orders.orders_id join customer on orders.customer_id = customer.customer_id group by customer.customer_id order by TOTAL_ORDERS DESC LIMIT 3;