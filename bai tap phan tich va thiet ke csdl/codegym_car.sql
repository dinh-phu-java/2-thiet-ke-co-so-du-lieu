create database codegym_car;
use codegym_car;
create table customers(
    customer_id int primary key auto_increment,
    customer_name nvarchar(200),
    address nvarchar(150),
    phone_number varchar(50)
);
create table product_line(
    product_line_id int primary key auto_increment,
    description nvarchar(150)
);

create table product(
    product_code int primary key auto_increment,
    product_name nvarchar(150),
    vendor nvarchar(150),
    warehouse_quantity int,
    buy_price float,
    sell_price float
);
create table orders(
    order_id int primary key auto_increment,
    buy_date date,
    customer_required_date date,
    transfer_date date,
    order_quantity int,
    unit_price float
);
create table payment(
    payment_id int auto_increment primary key,
    payment_date date,
    price float
);

create table employee(
    employee_id int auto_increment primary key,
    name nvarchar(200),
    email nvarchar(150),
    department nvarchar(100)
);

create table offices(
    office_code int primary key auto_increment,
    address nvarchar(150),
    phone nvarchar(100),
    country nvarchar(50)
);

alter table orders
add column customer_id int,add foreign key(customer_id) references customers(customer_id);

alter table payment
add column customer_id int, add foreign key (customer_id) references customers(customer_id);

create table order_detail(
    order_number int,
    product_number int,
    foreign key (order_number) references orders(order_id),
    foreign key (product_number) references product(product_code)
);

alter table product
add column product_line_id int , add foreign key (product_line_id) references product_line(product_line_id);

alter table customers
add column employee_id int, add foreign key (employee_id) references employee (employee_id);

alter table employee
add column office_code int, add foreign key (office_code) references offices(office_code);

alter table employee
add column report_to int, add foreign key (report_to) references employee(employee_id);