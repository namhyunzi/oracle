/*
시퀀스
    일련번호를 제공하는 오라클객체다.
    
    생성하기
        CREATE SEQUENCE 시퀀스명;
    삭제하기
        DROP SQUENCE 시퀀스명;
    수정하기
        ALTER SQUENCE 시퀀스명;
    
    시퀀스 생성 예시
        CREATE SQUENCE 시퀀스명
        * 시작값:1, 증가치:1, 최솟값:1, 최댓갑: 9999999999999999999999999999
        *캐시사이즈: 20
        
        CREATE SQUENCE 시퀀스명
             START WITH 1000
             INCREMENT BY 100
             NOCACHE;
        * 시작값:1000, 증가치:100, 최솟값:1, 최댓갑: 9999999999999999999999999999
        *캐시 사용하지 않음
*/

--새로운 시퀀스 생성하기
CREATE SEQUENCE BOOKS_SEQ;

-- 새 일련번호 조회하기
SELECT BOOKS_SEQ.NEXTVAL
FROM DUAL;

-- INSERT구문에서 시퀀스 활용하기
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(BOOKS_SEQ.NEXTVAL, '시퀀스 활용하기', '홍길동', 10000);

/*
무결성 제약조건

NOT NULL 제약조건
-- 컬럼단위로 제약조건을 지정한다.
-- 해당컬럼은 NULL값을 가질수 없다.
-- 입력폼에 필수 입력되는 항목은 NOT NULL 제약조건이 적용된 항목이다.
CREATE TABLE USERS (
    USER_NO
    USER_ID       VARCHAR2(255) NOT NULL,  --필수입력값
    USER_PASSWORE VARCHAR2(255) NOT NULL,  --필수입력값
    USER_NAME     VARCHAR2(255) NOT NULL,  --필수입력값
    USER_EMAIL    VARCHAR2(255),           --필수 입력값 아님 
)

*학원아이디, 회원비밀번호, 회원이름은 NULL값을 허용하지않는다.

UIQUE 제약조건
-- 컬럼단위 혹은 1개 이상의 컬럼을 합쳐서 제약조건을 지정할 수 있다.
-- 해당컬럼은 테이블 전체에 대해서 고유한 값을 가져야 한다.
-- NUT NULL 제약조건이 지정되지 않았다면 NUL값을 가지는 것은 상관없다.
-- 입력폼에서 중복검사를 하는 항목은 UIQUE 제약조건이 적용된 항목이다.
CREATE TABLE USERS (
    USER_NO
    USER_ID       VARCHAR2(255) UNIQUE,
    USER_PASSWORE VARCHAR2(255)      , 
    USER_NAME     VARCHAR2(255)      ,
    USER_EMAIL    VARCHAR2(255) UNIQUE,
    ...
)

CREATE TABLE 수강신청현황 (
        신청번호       NUMBER(8)      ,
        신청년도       NUMBER(4)      ,
        학기구분       CHAR(1)        , --1:1학기, 2:2학기, S: 여름계절학기, W:겨울계절학기       
        과정번호       CHAR(1)        ,
        학생번호       NUMBER(6)      ,
        
        UIQUE (신청년도, 학기구분, 과정번호, 학생번호)
)
*신청년도, 학기구분, 과정번호, 학생번호가 모두 동일한 값을 가지는 다른 행을 저장할 수 없다.

PRIMARY KEY
제약조건
-- 컬럼단위 혹은 1개 이상의 컬럼을 합쳐서 제약조건을 지정할 수 있다.
-- 테이블당 하나만 지정할 수 있다.
-- PRIMARY KEY 제약조건이 적용된 컬럼은 NULL값을 허용하지 않으며, 고유한 값을 가져야한다.
-- 테이블에서 행을 대표하는 컬럼에 적용하는 제약조건이다.
-- PRIMARY KEY  제약조건이 적용된 컬럼의 값은 시퀀스에서 획득한 일련번호를 사용하는 것이 보통이다.
CREATE TABLE USERS (
    USER_NO       NUMBER(10)    PRIMARY KEY,
    USER_ID       VARCHAR2(255) UNIQUE,
    USER_PASSWORE VARCHAR2(255)      , 
    USER_NAME     VARCHAR2(255)      ,
    USER_EMAIL    VARCHAR2(255) UNIQUE,
    ...
)

FOREIGN KEY 제약조건
- 컬럼단위로 제약조건을 지정한다.
- FOREIGN KEY 제약조건이 적용된 컬럼의 값은 다른 테이블 혹은 같은 테이블의 특정 컬럼의 값 중에 하나여야 한다.
CREATE TABLE DEPARTMENTS (
    DEPT_NO      NUMBER(4)  PRIMARY KEY,
    DEPT_NAME    VARCHAR2(255) NOT NULL.
    ...
)
CREATE TABLE EMPLOYEES (
    EMP_NO
    EMP_NAME
    DEPT_NO     NUMBER(4)  REFERENCES DEPARTMENTS (DEPT_NO) -- 직원의 소속 부서 번호
)
* EMPLOYEES의 DEPT_NO 컬럼은 DEPARTMENTS의 DEPT_NO 컬럼의 값을 참조하는 컬럼이다.
* EMPLOYEES의 DEPT_NO 컬럼에는, 이 컬럼이 참조하고 있는 컬럼이 가지고 있는 값만 허용된다.
* EMPLOYEES의 DEPT_NO 컬럼에 NOT NULL 제약조건이 적용되어 있지 않은 경우 NULL값을 저장하는 것은 상관없다.
* FOREIGN KEY 제약조건으로 참조되는 컬럼은 반드시 PRIMARY KEY 제약조건 혹은 UNIQUE 제약조건이 적용되어 있어야 한다.

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID       NUMBER(4)      PRIMARY KEY,
    FIRST_NAME        VARCHAR2(100)
    LAST_NAME         VARCHAR2(100)
    EMAIL             VARCHAR2(100)  UNIQUE,
    PHONE_NUMBER      VARCHAR2(100)
    HIRE_DATE         DATE
    JOB_ID            VARCHAR2(100)  REPERENCES JOBS (JOB_ID)
    SALARY            NUMBER(8, 2)
    COMMISSION_PCT    NUMBER(3, 2)
    MANAGER_ID        NUMBER(4)      REPERENCES EMPLOYEES (EMPLOYEE_ID)
    DEPARTMENT_ID     NUMBER(4)      REPERENCES DEPARTMENTS (DEPARTMENT_ID)
)

CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID       NUMBER(4)      PRIMARY KEY,
    DEPARTMENT_NAME     VARCHAR2(100)
    MANAGER_ID          NUMBER(4)      REPERENCES EMPLOYEES (EMPLOYEE_ID),
    LOCATION_ID         NUMBER(4)      REPERENCES LOCATIONS (LOCATION_ID)
)

CHECK 제약조건
- 컬럼단위로 제약조건을 지정한다.
- 제시된 조건식을 만족하는 값만 컬럼에 저장가능하게 한다.

CREATE TABLE USERS (
    USER_ID
    USER_NAME
    USER_GENDER  CHAR(1)    CHECK (USER_GENDER IN('F','N')) -- 성별은 'F'나 'N'만 가능하다.
    USER_AGE     NUMBER(3) CHECK (USER_AGE >= 1 AND USER_AGE < 150)
)
*/
