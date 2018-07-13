select * from tabs
where 1=1
and table_name like '%¹Ú½ÂÁø%';

edit kopo_parameter_omz;

select * from kopo_channel_seasonality_result_omz;

select * from RESULT_PY_11;

select * from kopo_parameter_¹Ú½ÂÁø9;

select * from kopo_project_¹Ú½ÂÁø_test7;

desc kopo_project_¹Ú½ÂÁø_test7

SELECT   A1.TABLE_COMMENTS
       , A1.TABLE_NAME
       , A1.COLUMN_ID
       , A1.COLUMN_NAME
       , A1.COLUMN_COMMENTS
       , (CASE
              WHEN B1.CONSTRAINT_TYPE = 'P' THEN 'Y'
          END) PK_FLAG
       , NVL(A1.NULL_FLAG, 'N') AS NULL_FLAG
       ,    A1.DATA_TYPE
         || (CASE A1.DATA_TYPE
                 WHEN 'NUMBER' THEN '(' || TO_CHAR(A1.DATA_LENGTH) || ',' || TO_CHAR(A1.DATA_PRECISION) || ')'
                 WHEN 'DATE' THEN ' '
                 ELSE '(' || A1.DATA_LENGTH || ')'
             END) DATA_TYPE
    FROM (SELECT B.COMMENTS TABLE_COMMENTS
               , A.TABLE_NAME TABLE_NAME
               , C.COMMENTS COLUMN_COMMENTS
               , A.COLUMN_NAME COLUMN_NAME
               , (CASE A.NULLABLE
                      WHEN 'Y' THEN 'Y'
                  END) NULL_FLAG
               , A.DATA_TYPE DATA_TYPE
               , A.DATA_LENGTH
               , A.COLUMN_ID AS COLUMN_ID
               , A.DATA_PRECISION
            FROM USER_TAB_COLUMNS A, USER_TAB_COMMENTS B, USER_COL_COMMENTS C
           WHERE (A.TABLE_NAME = B.TABLE_NAME)
             AND (A.TABLE_NAME = C.TABLE_NAME AND A.COLUMN_NAME = C.COLUMN_NAME)
             AND B.TABLE_TYPE = 'TABLE') A1
       , (SELECT A.TABLE_NAME, A.COLUMN_NAME, B.CONSTRAINT_TYPE
            FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B
           WHERE (A.CONSTRAINT_NAME = B.CONSTRAINT_NAME) AND B.CONSTRAINT_TYPE IN('P', 'R')) B1
   WHERE (A1.TABLE_NAME = B1.TABLE_NAME(+) AND A1.COLUMN_NAME = B1.COLUMN_NAME(+))
AND A1.TABLE_NAME LIKE '%¹Ú½ÂÁø%'
ORDER BY A1.TABLE_NAME, A1.COLUMN_ID;