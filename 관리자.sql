-- 계정이름앞에 C##을 붙이지 않아도 사용자 계정이 생성되도록 한다.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 신규 계정 생성하기
-- CREAT USER 계정명 IDENTIFIED BY 비밀번호;
alter USER hr IDENTIFIED BY zxcv1234;


-- 생성 계정에서 시스템 권한 부여하기
-- GRANT 권한명, 롤, ... TO 계정명
-- CONNECT 롤: 오라클 데이터베이스에 접속할 수 있는 시스템 권한을 포함하는 롤이다.
-- RESOURCE 롤: 오라클 데이터베이스 객체를 생성, 변경할 수 있는 시스템 권한을 포함하는 롤이다.
-- DBA 롤: 오라클 데이터베이스 관리자가 가지는 시스템 권한을 포함하는 롤이다.
-- 일반 사용자는 CONNECT, RESOURCE 롤에 포함된 시스템 권한을 부여한다.
GRANT CONNECT, RESOURCE, DBA TO hr ;