create table kopo_st_product
(
product varchar2(100),
product_name varchar2(100),
product_price number,
account varchar2(100) 
);

alter table kopo_st_product add (account varchar2(100))

alter table kopo_st_product add primary key(product)
alter table kopo_st_product add foreign key(account) references kopo_st_account(account_id)

create table kopo_st_account
(
account_id varchar2(100),
account_name varchar2(100),
account_tel varchar2(100)
);
alter table kopo_st_account add primary key(account_id)


create table kopo_st_order
(
order_id varchar2(100),
order_date date,
product_info varchar2(100)
);

alter table kopo_st_order add primary key(order_id)
alter table kopo_st_order add foreign key(product_info) references kopo_st_product(product)


select * from kopo_st_product
select * from kopo_st_account
select * from kopo_st_order


edit kopo_st_product
edit kopo_st_account
edit kopo_st_order

INSERT INTO kopo_st_product(product, product_name ,product_price,account)
VALUES('PD0002','PDD','2000','AC0002')

