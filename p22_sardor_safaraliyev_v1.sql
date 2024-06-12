-- task 1
create table exam_category (
    id serial primary key ,
    name varchar(255),
    parent_id integer
);

create table exam_product (
    id serial primary key ,
    price varchar(255),
    name varchar(255),
    description varchar(255),
    quantity integer,
    category_id integer,
    foreign key (category_id) references exam_category(id)
);

-- task 2
alter table exam_category add column created_at year;
alter table exam_product add column created_at year;

-- task 3 Update created_at with random date
insert into exam_category(created_at)
select round(year '2015' + (random() * ('2024' - year '2015')));

insert into exam_product(created_at)
select round(year '2015' + (random() * ('2024' - year '2015')));

-- task 4
COPY exam_category(id, name, parent_id, created_at)
FROM '/tmp/category.csv'
DELIMITER ','
CSV HEADER;

COPY exam_product(id, price, name, description, quantity, category_id, created_at)
FROM '/tmp/product.csv'
DELIMITER ','
CSV HEADER;
