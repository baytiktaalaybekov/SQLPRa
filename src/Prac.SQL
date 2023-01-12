create table products(
    id serial primary key ,
    name varchar not null ,
    description text not null ,
    price int not null ,
    weight int not null
);
create table product_info(
    id serial primary key ,
    country varchar not null ,
    colour text not null ,
    product_id int references product(id);
) ;
create table customers(
    id serial primary key ,
    first_name varchar not null ,
    last_name varchar not null ,
    email varchar not null ,
    phone_number int not null
);

create table basket(
    id serial primary key ,
    basket_name varchar not null ,
    customers_id int references customers(id)
);

create table product_basket(
    id serial primary key ,
    basket_id int references basket(id),
    product_id int references products(id)
);

insert into products( name, description, price, weight)
VALUES ('Fish','fresh',450,3),
       ('Meat','without fat',550,5),
       ('Milk','fresh',150,1),
       ('Water','mineral',50,2),
       ('Grips','fresh',250,4);
insert into product_info( country, colour, product_id)
VALUES ('Japan','blue',1),
       ('Naryn','white',3),
       ('Kochkor','red',2),
       ('Jalal-Abad','White',4),
       ('Russia','grey',5);

insert into customers( first_name, last_name, email, phone_number)
VALUES ('Baytik','Taalaybekov','baytik@gmail.com',0707255474),
       ('Aigerim','Bektenova','aigerim@gmail.com',0705653474),
       ('Syimyk','jumabekov','syimyk@gmail.com',0700254844),
       ('Bayish','Orozaliev','bayish@gmail.com',0707985675),
       ('Kanykei','Askarbekova','kanykei@gmail.com',0507787907);

insert into basket( basket_name, customers_id)
VALUES ('basket fruits',1),
       ('basket meats',2),
       ('basket flower',4),
       ('basket water',5),
       ('basket fish',3);
insert into product_basket( basket_id, product_id)
VALUES (1,2),
       (3,4),
       (5,1),
       (2,4),
       (5,4);

