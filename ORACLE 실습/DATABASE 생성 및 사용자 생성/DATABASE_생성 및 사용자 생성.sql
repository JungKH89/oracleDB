/* Formatted on 2018/03/13 ���� 10:44:18 (QP5 v5.318) */
CREATE TABLESPACE TS_USER01
    DATAFILE 'E:\ORACLE\DATA\TS_USER_01.dbf' SIZE 1024 M
    AUTOEXTEND ON NEXT 100 M MAXSIZE UNLIMITED
    SEGMENT SPACE MANAGEMENT AUTO;
    
CREATE USER HAITEAM
                  IDENTIFIED BY        HAITEAM
                  DEFAULT TABLESPACE   TS_USER01
                  TEMPORARY TABLESPACE TEMP;


GRANT CONNECT,RESOURCE,DBA TO HAITEAM;

