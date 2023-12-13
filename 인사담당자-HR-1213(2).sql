/*
������
    �Ϸù�ȣ�� �����ϴ� ����Ŭ��ü��.
    
    �����ϱ�
        CREATE SEQUENCE ��������;
    �����ϱ�
        DROP SQUENCE ��������;
    �����ϱ�
        ALTER SQUENCE ��������;
    
    ������ ���� ����
        CREATE SQUENCE ��������
        * ���۰�:1, ����ġ:1, �ּڰ�:1, �ִ�: 9999999999999999999999999999
        *ĳ�û�����: 20
        
        CREATE SQUENCE ��������
             START WITH 1000
             INCREMENT BY 100
             NOCACHE;
        * ���۰�:1000, ����ġ:100, �ּڰ�:1, �ִ�: 9999999999999999999999999999
        *ĳ�� ������� ����
*/

--���ο� ������ �����ϱ�
CREATE SEQUENCE BOOKS_SEQ;

-- �� �Ϸù�ȣ ��ȸ�ϱ�
SELECT BOOKS_SEQ.NEXTVAL
FROM DUAL;

-- INSERT�������� ������ Ȱ���ϱ�
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(BOOKS_SEQ.NEXTVAL, '������ Ȱ���ϱ�', 'ȫ�浿', 10000);

/*
���Ἲ ��������

NOT NULL ��������
-- �÷������� ���������� �����Ѵ�.
-- �ش��÷��� NULL���� ������ ����.
-- �Է����� �ʼ� �ԷµǴ� �׸��� NOT NULL ���������� ����� �׸��̴�.
CREATE TABLE USERS (
    USER_NO
    USER_ID       VARCHAR2(255) NOT NULL,  --�ʼ��Է°�
    USER_PASSWORE VARCHAR2(255) NOT NULL,  --�ʼ��Է°�
    USER_NAME     VARCHAR2(255) NOT NULL,  --�ʼ��Է°�
    USER_EMAIL    VARCHAR2(255),           --�ʼ� �Է°� �ƴ� 
)

*�п����̵�, ȸ����й�ȣ, ȸ���̸��� NULL���� ��������ʴ´�.

UIQUE ��������
-- �÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�.
-- �ش��÷��� ���̺� ��ü�� ���ؼ� ������ ���� ������ �Ѵ�.
-- NUT NULL ���������� �������� �ʾҴٸ� NUL���� ������ ���� �������.
-- �Է������� �ߺ��˻縦 �ϴ� �׸��� UIQUE ���������� ����� �׸��̴�.
CREATE TABLE USERS (
    USER_NO
    USER_ID       VARCHAR2(255) UNIQUE,
    USER_PASSWORE VARCHAR2(255)      , 
    USER_NAME     VARCHAR2(255)      ,
    USER_EMAIL    VARCHAR2(255) UNIQUE,
    ...
)

CREATE TABLE ������û��Ȳ (
        ��û��ȣ       NUMBER(8)      ,
        ��û�⵵       NUMBER(4)      ,
        �бⱸ��       CHAR(1)        , --1:1�б�, 2:2�б�, S: ���������б�, W:�ܿ�����б�       
        ������ȣ       CHAR(1)        ,
        �л���ȣ       NUMBER(6)      ,
        
        UIQUE (��û�⵵, �бⱸ��, ������ȣ, �л���ȣ)
)
*��û�⵵, �бⱸ��, ������ȣ, �л���ȣ�� ��� ������ ���� ������ �ٸ� ���� ������ �� ����.

PRIMARY KEY
��������
-- �÷����� Ȥ�� 1�� �̻��� �÷��� ���ļ� ���������� ������ �� �ִ�.
-- ���̺�� �ϳ��� ������ �� �ִ�.
-- PRIMARY KEY ���������� ����� �÷��� NULL���� ������� ������, ������ ���� �������Ѵ�.
-- ���̺��� ���� ��ǥ�ϴ� �÷��� �����ϴ� ���������̴�.
-- PRIMARY KEY  ���������� ����� �÷��� ���� ���������� ȹ���� �Ϸù�ȣ�� ����ϴ� ���� �����̴�.
CREATE TABLE USERS (
    USER_NO       NUMBER(10)    PRIMARY KEY,
    USER_ID       VARCHAR2(255) UNIQUE,
    USER_PASSWORE VARCHAR2(255)      , 
    USER_NAME     VARCHAR2(255)      ,
    USER_EMAIL    VARCHAR2(255) UNIQUE,
    ...
)

FOREIGN KEY ��������
- �÷������� ���������� �����Ѵ�.
- FOREIGN KEY ���������� ����� �÷��� ���� �ٸ� ���̺� Ȥ�� ���� ���̺��� Ư�� �÷��� �� �߿� �ϳ����� �Ѵ�.
CREATE TABLE DEPARTMENTS (
    DEPT_NO      NUMBER(4)  PRIMARY KEY,
    DEPT_NAME    VARCHAR2(255) NOT NULL.
    ...
)
CREATE TABLE EMPLOYEES (
    EMP_NO
    EMP_NAME
    DEPT_NO     NUMBER(4)  REFERENCES DEPARTMENTS (DEPT_NO) -- ������ �Ҽ� �μ� ��ȣ
)
* EMPLOYEES�� DEPT_NO �÷��� DEPARTMENTS�� DEPT_NO �÷��� ���� �����ϴ� �÷��̴�.
* EMPLOYEES�� DEPT_NO �÷�����, �� �÷��� �����ϰ� �ִ� �÷��� ������ �ִ� ���� ���ȴ�.
* EMPLOYEES�� DEPT_NO �÷��� NOT NULL ���������� ����Ǿ� ���� ���� ��� NULL���� �����ϴ� ���� �������.
* FOREIGN KEY ������������ �����Ǵ� �÷��� �ݵ�� PRIMARY KEY �������� Ȥ�� UNIQUE ���������� ����Ǿ� �־�� �Ѵ�.

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

CHECK ��������
- �÷������� ���������� �����Ѵ�.
- ���õ� ���ǽ��� �����ϴ� ���� �÷��� ���尡���ϰ� �Ѵ�.

CREATE TABLE USERS (
    USER_ID
    USER_NAME
    USER_GENDER  CHAR(1)    CHECK (USER_GENDER IN('F','N')) -- ������ 'F'�� 'N'�� �����ϴ�.
    USER_AGE     NUMBER(3) CHECK (USER_AGE >= 1 AND USER_AGE < 150)
)
*/
