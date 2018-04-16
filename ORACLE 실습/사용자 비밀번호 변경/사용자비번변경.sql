select * from dba_tablespaces;

-- 테이블스페이스 저장파일 조회 sql
select * from dba_data_files;

-- 사용자 비밀번호 변경
alter user HAITEAM
 identified by HA;
 
 --생성한 사용자 정보 조회
 select * from dba_users;
 
 select * from tabs;