
-- 데이터베이스 링크 생성
-- 원격지의 oracle db에 접근하기 위한 설정임

CREATE DATABASE LINK server111
CONNECT TO kopo
IDENTIFIED BY kopo
Using '(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.110.111)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
  )';
  
  
--사용자 계정에서 폴리서버의 테이블을 볼 수 있음
select * from kopo_product_volume@server111