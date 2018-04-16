select * from kopo_channel_seasonality_new;

--kopo_channel_seasonality_new 테이블과
--kopo_region_mst 테이블로
--inner join, left join을 수행하세요


select
    A.REGIONID,
    A.PRODUCT,
    A.YEARWEEK,
    A.QTY,
    B.REGIONNAME
FROM kopo_channel_seasonality_new A
INNER JOIN KOPO_REGION_MST B
ON A.REGIONID=B.REGIONID;


select
    A.REGIONID,
    A.PRODUCT,
    A.YEARWEEK,
    A.QTY,
    B.REGIONNAME
FROM kopo_channel_seasonality_new A
LEFT JOIN KOPO_REGION_MST B
ON A.REGIONID=B.REGIONID