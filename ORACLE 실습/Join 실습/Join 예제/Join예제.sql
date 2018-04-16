select * from kopo_channel_seasonality_new;

--kopo_channel_seasonality_new ���̺��
--kopo_region_mst ���̺��
--inner join, left join�� �����ϼ���


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