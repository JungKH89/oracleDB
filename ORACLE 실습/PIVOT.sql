SELECT * FROM DT_RESULT_FINAL2;

SELECT * FROM DT_RESULT_FINAL2
ORDER BY PRODUCTGROUP, PRODUCT,ITEM,YEARWEEK, MEASURE;

----PIVOT 예제
SELECT * 
FROM (SELECT * FROM DT_RESULT_FINAL2)
PIVOT(
    SUM(SALES)
    FOR MEASURE IN ('REAL-QTY' AS REAL_QTY,'PREDICTION-QTY' AS PREDICTION_QTY)
    )
ORDER BY PRODUCTGROUP, PRODUCT, ITEM, YEARWEEK;

----UNPIVOT 예제
WITH T AS(
    SELECT * FROM DT_RESULT_FINAL3
    )
SELECT MEASURE, PRODUCTGROUP, PRODUCT, ITEM, YEARWEEK, QTY
FROM T
UNPIVOT(QTY FOR MEASURE IN(REAL_QTY, PREDICTION_QTY));



----지역, 상품, 주차별 집계
----근데 이렇게는 4만건이 넘어서 보는게 힘들지..
----PIVOT을 써서 WEEK을 열로 빼주면 더 보기 편하겠지?
SELECT 
    REGIONID
    , PRODUCT 
    , SUBSTR(YEARWEEK,5,6) AS WEEK
    , ROUND(AVG(QTY),0) AS AVG_QTY 
FROM KOPO_CHANNEL_SEASONALITY_NEW
GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6)
ORDER BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6);



SELECT * 
FROM (SELECT 
        REGIONID
        , PRODUCT
        , SUBSTR(YEARWEEK,5,6) AS WEEK
        , ROUND(AVG(QTY),0) AS AVG_QTY 
      FROM KOPO_CHANNEL_SEASONALITY_NEW
      GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6)
      ORDER BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6))
PIVOT(
    SUM(AVG_QTY)
    FOR WEEK IN('01' W01,'02' W02,'03' W03,'04' W04, '05' W05,'06' W06,'07' W07,'08' W08,'09' W09)
    )
ORDER BY REGIONID, PRODUCT;



----partition by --> groupby + join
select a.*
        --pariotion by equal
        , row_number() over (order by  qty desc) as qty_desc_order
        , row_number() over (partition by regionid, product order by qty desc) as re_pd_desc_order 
        , avg(qty) over(partition by regionid) as avg_qty_region
        , sum(qty) over(partition by regionid,product) as sum_qty
from kopo_channel_seasonality_new a
order by qty desc;