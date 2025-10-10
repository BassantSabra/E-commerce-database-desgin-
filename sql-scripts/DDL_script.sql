-- create the E_commerce database and schema

create database E_commerce
use E_commerce

create schema sales
go

/* create products table to store product information */

if OBJECT_ID ('sales.products' ,'u' ) is not null drop table sales.products
create table sales.products(
product_id int identity (101,1) primary key ,
product_name varchar(255) not null,
product_description text ,
Stock_quantity int not null,
price decimal (10,2) not null,
category varchar(100)not null,
DateAdded date not null default getdate())

/* create users table to store users information */

if OBJECT_ID ('sales.users' ,'u' ) is not null drop table sales.users
create table sales.users(
userId int identity (1001 ,1) primary key,
userName VARCHAR(50) NOT NULL ,
Email varchar(50) not null,
customer_Password varchar(64) not null,
Customer_Address varchar(150) not null,
date_registered date not null default getdate()
)
insert into sales.users(userName,Email,customer_Password,Customer_Address)
values ('MOHAMED', 'bosy_3344@yahoo.com' ,'password@123','kkkkkdk25d')
select* from sales.users

/* create orders table to store product information */

if OBJECT_ID ('sales.orders' ,'u') is not null drop table sales.orders

create table sales.orders(
order_id int identity(1,1) primary key,
productID INT,
userId int,
order_date date not null default getdate(),
Total_Quantity int not null,
foreign key (userId) references sales.users(userId),
foreign key (productID) references sales.products(product_id)
)


/* create payment table to store product information */

if OBJECT_ID ('sales.payment' ,'u') is not null drop table sales.payment
create table sales.payment(payment_id int identity (10001,1) primary key ,
order_id int,
payment_method varchar(50) not null,
payment_date date not null default getdate(),
Total_Amount decimal (10,2) not null,
foreign key (order_id) references sales.orders(order_id)
)

/* create reviews table to store product information */

if OBJECT_ID ('sales.reviews' ,'u' ) is not null drop table sales.reviews

create table sales.reviews (review_id int identity(201,1) primary key,
userID int,
product_id int,
rating  int ,
review_description text,
check (rating>=1 and rating<=5),-- to ensure rating between 1 and 5 
foreign key (userID) references sales.users(userId),
foreign key (product_id) references sales.products(product_id)
)

