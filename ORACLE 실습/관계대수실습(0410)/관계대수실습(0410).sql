----kopo_product_volume ���̺��� 
----201601���� �̻��̸鼭
----ST0001 ��ǰ ������ ��ȸ�ϱ�
select * from kopo_product_volume
 where 1=1
   and yearweek>=201601
   and productgroup='ST0001';
   

select * from kopo_product_volume_a01;
select * from kopo_product_volume_a02;


----kopo_product_volume_a01�� kopo_product_volume_a02
----union�ϱ�
select regionid, productgroup, yearweek, volume
  from kopo_product_volume_a01
UNION
select regionid, productgroup, yearweek, volume
  from kopo_product_volume_a02;
  
  
  
----CTRL+E 
----cost: 12854(union all) / cost: 60867(union) 
----���� 6������
select * from kopo_channel_result_a01
union
select * from kopo_channel_result_a02;



select regionid, productgroup, yearweek, qty
 from (select * from kopo_channel_result_a01
        union
       select * from kopo_channel_result_a02);
  

select regionid, productgroup, yearweek, qty from kopo_channel_result_a01
 union
select regionid, productgroup, yearweek, qty from kopo_channel_result_a02;


select * from(
        select * from kopo_channel_result_a01
        union
       select * from kopo_channel_result_a02
       )
       where 1=1
       and regionid = 'A01'
       AND PRODUCTGROUP = 'PG1'
       AND YEARWEEK = '201728'

     
A01	KOPO	404517	WT_CARRIER	SALESID0063	��������63����	SALESID0063	��������63����	PG1	PRODUCT59	ITEM00079	201728	2017	28	12851	14328.2	SALESID0063_ITEM00079
 


select * from kopo_channel_result_a01
where 1=1
and qty > 10000

select * from kopo_channel_result_a01

----Expression����      
select
  'D516' as measureid,
  3*4 as tempvalue,
  regionid || '_' || productgroup || '_' || yearweek as key,
  concat(regionid, productgroup) as con,
  regionid,
  productgroup,
  yearweek,
  volume
  from kopo_product_volume;