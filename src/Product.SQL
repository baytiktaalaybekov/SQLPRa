create table products(
                         id serial primary key ,
                         name varchar not null ,
                         description text not null ,
                         price int not null ,
                         weight int not null
);
create table product_info(
                             id serial primary key ,
                             expiration_date date,
                             country varchar not null ,
                             colour text not null ,
                             product_id int references products(id)
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
insert into product_info( expiration_date,country, colour, product_id)
VALUES ('12-01-2023','Japan','blue',1),
       ('14-02-2023','Naryn','white',3),
       ('10-01-2023','Kochkor','red',2),
       ('14-02-2023','Jalal-Abad','White',4),
       ('23-01-2023','Russia','grey',5);

insert into customers( first_name, last_name, email, phone_number)
VALUES ('Baytik','Taalaybekov','baytik@gmail.com',0707255474),
       ('Aigerim','Bektenova','aigerim@gmail.com',0705653474),
       ('Syimyk','jumabekov','syimyk@gmail.com',0700254844),
       ('Bayish','Orozaliev','bayish@gmail.com',0707985675),
       ('Kanykei','Askarbekova','kanykei@gmail.com',0507787907);

insert into basket( basket_name, customers_id)
VALUES ('small',1),
       ('big',2),
       ('middle',4),
       ('small',5),
       ('bid',3);
insert into product_basket( basket_id, product_id)
VALUES (1,2),
       (3,4),
       (5,1),
       (2,4),
       (5,4);

select * from products;
select * from product_info;
select * from customers;
select * from basket;
select * from product_basket;

-- 1. Баардык продукталарды(Products) жана информацияларды чыгар.
select products.name,product_info from products join product_info on products.id = product_info.product_id;

-- 2. Информациясы бар болгон продукталарды гана чыгар.
select  products.name from products right join product_info on products.id = product_info.product_id;

-- 3. Информациясы жок(null) болгон продукталарды чыгар.
select * from products join product_info pi on products.id = pi.product_id where products=null;

-- 4. Баардык продукталардын атын жана срогун чыгар.
select products.name,product_info.expiration_date from products join product_info on products.id = product_info.product_id;

-- 5. Баардык продукталарды жана анын мамлекеттери "М" менен башталган шаарларын чыгар.
select products.name,p.country from products inner join product_info p on products.id = p.product_id WHERE country ilike 'K%';

-- 6. Баардык кардардын(Customers) аттарын жана кардарга тийешелуу карзинанын(Basket_терин) аттарын сорттоп чыгар.(asc,desc)
select customers.first_name,basket_name from customers inner join basket b on customers.id = b.customers_id  order by basket_name desc ;
-- 7. Кардардын аты жана кардардын продуктулары чыксын.

-- 8. Кардардын аты, кардар алган продуктун аты, баасы, салмагы чыксын.
select c.first_name,p.name,p.price,p.weight from Customers c join basket B on c.id = B.customers_id
    join product_basket pb on B.id = pb.basket_id join products p on pb.product_id = p.id;


-- 9. Бир кардар эки окшош продукт алган болсо, кардардын аты,
--     кардар алган продукталарынын аты уникалдуу болуп баасы жана салмагы кошулуп чыгар.


-- 10.Бир өлкөдө чыккан продукталдын баарын чыгар.


-- 11.Кардарлардын баарын жана алган продукталарынын баасынын суммасын тегеректеп (округлить) чыгар.
-- 12."2021" ден "2023" кө чейинки сроктогу продукталардын атын жана срокторун чыгар.
-- 13.Срогу "2022" болгон продукталардын шаарын , продукталардын атын жана баасын чыгар бирок баалары 0 болуп калсын.
-- 14.Баардык кардарлардын продукталарынын сумассын чыгар.
-- 15.Кардардын аты жана ал сатып алган продуктунун аты, тусу чыксын.

-- 16.Баардык продуктулардын салмактарын чыгар.
select name,weight from products join product_basket pb on products.id = pb.product_id;

-- 17.Кардарлардын email_дары "com" менен буткон кардарлардын аттары, корзинасынын аты чыксын.

-- 18.Продуклардын атын, кыскача маалыматын(description), кардардын атын чыгар качан кардарлардын номери жок(null) болсо.

-- 19.Бардык продуктунун тустору жана тустору окшош продукталары чыксын.

select distinct (colour),name from product_info join products p on p.id = product_info.product_id;
-- 20.Баардык продукталардын мамлекти окшош болгон продукталардын атын жана анын кардарларын атын чыгар.
select