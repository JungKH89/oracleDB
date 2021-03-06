SELECT * FROM RMSE_MAE_EXAMPLE_STEP2_정경화_1;


CREATE TABLE RMSE_MAE_EXAMPLE_STEP2_정경화_1 AS
    SELECT ITEM
       ,AVG(ERROR) AS MAE
    FROM RMSE_MAE_EXAMPLE_STEP2 
    GROUP BY ITEM;

    
SELECT T1.ITEM
       , AVG(T1.ERROR)
FROM ( SELECT
            ITEM
            ,YEARWEEK
            ,QTY
            ,PREDICTION
            ,ABS(QTY-PREDICTION) AS ERROR
        FROM RMSE_MAE_EXAMPLE_STEP2 ) T1
GROUP BY T1.ITEM;



CREATE TABLE RMSE_MAE_EXAMPLE_STEP2_정경화_2 AS
    SELECT SUBSTR(YEARWEEK,5,6) AS WEEK 
       ,AVG(ERROR) AS MAE
    FROM RMSE_MAE_EXAMPLE_STEP2 
    GROUP BY SUBSTR(YEARWEEK,5,6)
    ORDER BY WEEK;
    

SELECT T1.ITEM,
       SQRT(AVG(T1.POW_ERROR)) AS RMSE
FROM
(
    SELECT ITEM
       ,YEARWEEK
       ,QTY
       ,PREDICTION
       ,POWER(ABS(QTY-PREDICTION),2) AS POW_ERROR
    FROM RMSE_MAE_EXAMPLE
) T1
GROUP BY T1.ITEM;



SELECT * FROM CUSTOMERDATA;

SELECT * FROM CUSTOMER_NAME;

SELECT A.*, B.CUSTNAME
  FROM CUSTOMERDATA A
INNER JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID;


SELECT A.*, B.CUSTNAME
  FROM CUSTOMERDATA A
LEFT JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID;


SELECT A.*, B.CUSTNAME
  FROM CUSTOMERDATA A
rIGHT JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID;
