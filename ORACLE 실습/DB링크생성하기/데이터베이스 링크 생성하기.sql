
-- �����ͺ��̽� ��ũ ����
-- �������� oracle db�� �����ϱ� ���� ������

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
  
  
--����� �������� ���������� ���̺��� �� �� ����
select * from kopo_product_volume@server111