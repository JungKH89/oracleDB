

CREATE TABLE KOPO_PRODUCT_VOLUME(
regionid varchar2(20),
productgroup varchar2(20),
yearweek varchar2(8),
volume number not null,
constraint pk_kopo_product_volume primary key(regionid,productgroup,yearweek)
);

insert into kopo_product_volume
values('regionid','productgroup','201702',null)
