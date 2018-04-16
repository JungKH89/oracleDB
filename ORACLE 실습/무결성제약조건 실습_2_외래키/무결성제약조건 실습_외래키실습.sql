

create table kopo_product_volume(
regionid varchar2(20),
productgroup varchar2(20),
yearweek varchar2(8),
volume number not null,
constraint pk_kopo_product_volume primary key(regionid,productgroup, yearweek))


insert into kopo_product_volume
values('regionid','productgroup',null,'volume')


insert into kopo_product_volume
values('A01','ST0002','201503',20)

select * from kopo_product_volume


insert into kopo_product_volume
values('A01','ST0002','201504',40)


desc kopo_product_volume


 create table kopo_event_info_foreign(
 eventid varchar2(20),
 eventperiod varchar2(20),
 PROMOTION_RATIO NUMBER,
 constraint pk_kopo_event_info_foreign primary key(eventid))


create TABLE KOPO_PRODUCT_VOLUME_FOREIGN(
 REGIONID VARCHAR2(20),
 PRODUCTGROUP VARCHAR2(20),
 YEARWEEK VARCHAR2(8),
 VOLUME NUMBER NOT NULL,
 EVENTID VARCHAR2(20),
 constraint pk_kopo_product_volume_foreign primary key(REGIONID, PRODUCTGROUP, YEARWEEK),
 constraint fk_kopo_product_volume_foreign foreign key(eventid) references kopo_event_info_foreign(eventid) 
 ON DELETE CASCADE)

select count(*) from KOPO_PRODUCT_VOLUME_FOREIGN
 
alter table kopo_product_volume_foreign 
   enable constraint fk_kopo_product_volume_foreign

select * from kopo_event_info_foreign

select * from kopo_channel_seasonality_kh

desc kopo_product_volume


-- 참조 무결성 예제: (부모키가 없는 경우)
 insert into kopo_product_volume_foreign
 values ('A01','ST00002','201501',50,'EVTEST')

-- 참조 무결성 예제: (자식이 있는데 지우려고 시도하는경우)
DELETE FROM KOPO_EVENT_INFO_FOREIGN
WHERE EVENTID = 'EV00001'
