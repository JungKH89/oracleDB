--������ ���̺�
select * from kopo_stock_mst;


--�α� ����
select * from kopo_stock_log;

select * from KOPO_ST_JKH_JOIN;


--������ ȭ�� ������� �ڷḦ �������� LEFT ������ �� KOSPI�� �׸� �������� �ֱ�--
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


