select * from kopo_promotion;



select regionid, item, targetweek, planweek, map_price,ir, pmap,product, round(pmap*0.9,1) as pmap10
 from kopo_promotion;
 
 
 
select 
    item, targetweek, planweek,
    case when map_price=0
            then 1
         when map_price=1
            then 2
         else pmap/NVL(map_price,1) end as promotion_ratio
 from kopo_promotion;
 

select * from kopo_promotion
 where 1=1
 and map_price is null;
 
 
 
 
----------------like¿¬»êÀÚ----------------
select * from tabs
 where table_name like '%MST%';