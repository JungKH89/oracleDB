--마스터 테이블
select * from kopo_stock_mst;


--로그 실적
select * from kopo_stock_log;

select * from KOPO_ST_JKH_JOIN;


--마스터 화면 시현대상 자료를 기준으로 LEFT 조인한 후 KOSPI인 항목만 조건절에 넣기--
CREATE TABLE KOPO_ST_JKH_JOIN AS
(
    SELECT 
         A.SCREEN_CODE
        ,A.SCREED_DIV AS SCREEN_DEV
        ,B.OPEN
        ,B.HIGH
        ,B.LOW
        ,A.CONTENT
    from kopo_stock_mst A, kopo_stock_log B
    where A.SCREEN_CODE = B.ST_CODE (+)
      AND 1=1
      AND A.SCREED_DIV='KOSPI'
);

SELECT 
     A.SCREEN_CODE
    ,A.SCREED_DIV
    ,B.OPEN
    ,B.HIGH
    ,B.LOW
    ,A.CONTENT
from kopo_stock_mst A
LEFT JOIN KOPO_STOCK_LOG B
ON A.SCREEN_CODE = B.ST_CODE
WHERE 1=1
AND A.SCREED_DIV='KOSPI'


