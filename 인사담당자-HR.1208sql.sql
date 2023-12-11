/* �����Լ�

   lower (�÷� Ȥ�� ǥ����) : �ҹ��ڷ� ��ȯ�� ���� ��ȯ�Ѵ�
   upper (�÷� Ȥ�� ǥ����) : �빮�ڷ� ��ȯ�� ���ڸ� ��ȯ�Ѵ�,

    concat(�÷� Ȥ�� ǥ���� ,  �÷� Ȥ�� ǥ����) : �� ���ڿ��� �����ؼ� ��ȯ�Ѵ�

    length (�÷� Ȥ�� ǥ����) : ���ڿ��� ���̸� ��ȯ

    substr (�÷� Ȥ�� ǥ����, ������ġ, ����): ���ڿ��� ������ġ���� ���̸�ŭ �߶� ��ȯ
                                                ������ġ�� 1���� �����Ѵ�

    instr (�÷� Ȥ�� ǥ���� , ���ڿ�) : ������ ���ڿ��� ������ġ�� ��ȯ

    trim(�÷� Ȥ�� ǥ����) : ���ʿ��� �¿� ������ ���ŵ� ���ڿ� ��ȯ

    LPAD(�÷� Ȥ�� ǥ���� , ���� , ����) : �÷�Ȥ�� ǥ������ ���̰� ������ ���̺���
                                    ª���� ������ ���̸�ŭ ���ʿ� ������ ���ڰ� ä���� ���ڿ��� ��ȯ

 */

-- 60�� �μ��� �Ҽӵ� �������� �̸��� �ҹ��� �빮�ڷ� ��ȸ
select first_name , lower(FIRST_NAME) , upper(FIRST_NAME)
from EMPLOYEES
where DEPARTMENT_ID = 60;

-- 60�� �μ��� �Ҽӵ� �������� FIRST_name �� LAST_NAME �� �����ؼ� ��ȸ


select CONCAT(first_name , last_name)
from employees
WHERE department_id = 60;


-- 60�� �μ��� �Ҽӵ� �������� FIRST_NAME �� LAST_NAME �����ؼ� ��ȸ
SELECT FIRST_NAME || LAST_NAME
from EMPLOYEES
WHERE DEPARTMENT_ID = 60;

SELECT FIRST_NAME || '' || LAST_NAME
from EMPLOYEES
WHERE DEPARTMENT_ID = 60;


-- 60�� �μ��� �Ҽӵ� �������� �̸��� �̸��� ���̸� ��ȸ�ϱ�
SELECT first_name , LENGTH (first_name)
FROM employees
WHERE department_id = 60;

-- �̸��� 6���� �̻��� ������ ���̵�� �̸� ��ȸ
SELECT employee_id , first_name
FROM EMPLOYEES
WHERE LENGTH(first_name) >= 6;

-- SAMPLE_BOOKS ���� ���� �̸��� ��ȸ�ϱ�
SELECT book_writer , SUBSTR(book_writer,1,1)
FROM sample_books;

-- ��ȭ��ȣ���� ������ ��ȸ�ϱ�
SELECT substr('031)1234-5678' , 1, instr('031)1234-5678', ')' )-1)
from DUAL;

-- DUAL�� ����Ŭ���� �����ϴ� DUMMY ���̺��̴�
-- DUAL�� 1�� 1��¥�� ���̺��̴�
-- ���� ���̺� ��ȸ���� ������ ������ ������ �� �̿�
select *
from DUAL;

-- �¿� ���鸸 �����
SELECT TRIM('     123     Hello,sqlDevelpoer!   42  4')
from dual;

-- ������ ���̸�ŭ ���ڿ��� ���ʿ� '3' �� ä���� ��ȸ
select LPAD('100' , 10 , '3')
from dual;

-- ������ ���̸�ŭ ���ڿ��� �����ʿ� '2'�� ä���� ��ȸ
select RPAD('100' , 10 , '2')
from dual;

/*
�����Լ�

ROUND(�÷� Ȥ�� ǥ���� , �ڸ���) : ������ �ڸ������� �ݿø��Ѵ�

TRUNC(�÷� Ȥ�� ǥ���� , �ڸ���) : ������ �ڸ������� ����� ���� ������

MOD(����1 , ����2) : ������ ������ȯ

ABS (�÷� Ȥ�� ǥ����) : ���밪�� ��ȯ�Ѵ�

ceil (�÷� Ȥ�� ǥ����) : ������ ������ ũ�ų� ���� �����߿��� ���� ���� ������ȯ
FLOOR(�÷� Ȥ�� ǥ����) : ������ ������ �۰ų� ���� ���� �߿��� ���� ū ������ ��ȯ



*/

select round(1234.5678 ),
       round(1234.5678 , 3),
       round(1234.5678 , 2),
       round(1234.5678 , 1),
       round(1234.5678 , 0),
       round(1234.5678 , -1),
       round(1234.5678 , -2), -- 100�� �ڸ����� ��������?
       round(1234.5678 , -3),    -- 1000�� �ڸ����� ��������?
       round(1554.5678 , -2)
from dual;



select TRUNC(1234.5678 ),
       TRUNC(1234.5678 , 3),
       TRUNC(1234.5678 , 2),
       TRUNC(1234.5678 , 1),
       TRUNC(1234.5678 , 0),
       TRUNC(1234.5678 , -1),
       TRUNC(1234.5678 , -2),
       TRUNC(1234.5678 , -3),
       TRUNC(1554.5678 , -2)
from dual;

-- 80�� �μ��� �Ҽӵ� ������ ���̵� �̸� �޿��� ���� # ���
-- # �ϳ��� 1000�޷�
select EMPLOYEE_id , first_name , lpad('#',TRUNC(salary/1000),'#')
from employees
where department_id = 80;


slect  10 % 4
from dual;

select MOD(10,4) ,abS(-10)
from dual;

select ceil(1), ceil(1.2), ceil(1.5) , ceil(1.9), ceil(2.0)
from dual;

select FLOOR(1) ,FLOOR(1.1) , FLOOR(1.5) , FLOOR(1.9) , FLOOR(2)
from dual;





/*
��¥ �Լ�

SYSDATE : �ý����� ���� ���ڿ� �ð��� DATE Ÿ������ ��ȯ
        + �����Ͱ� �߰� �� �� , �����Ͱ� ���� �� �� ���� ��¥�� �ð������� �����ϴ� �뵵
SYSTIMESTAMP :  �ý��� ���� ���ڿ� �ð��� TIMESTAMP Ÿ������ ��ȯ

// ���� �� ����
add_months(��¥ , ����) : ��¥�� ������ ���� ��ŭ�� ���� ���� ��¥�� ��ȯ
MONTHS_BETWEEN(��¥ , ��¥ ) :  �γ�¥ ������ �������� ��ȯ

// �ϼ� ���� ����
��¥ +���� = ���ڸ�ŭ ���ڰ� ����� ��¥�� ��ȯ
��¥ - ���� = ���ڸ�ŭ ���� ��¥�� ��ȯ
��¥ - ��¥ = �� ��¥ ������ �ϼ��� ��ȯ
��¥ + 1/24 = 1�ð� ������ ��¥�� ��ȯ

TRUNC(��¥) : ������ ��¥�� ��� �ð� ������ 0��0��0�ʷ�
ROUND(��¥) : ������ ��¥�� �ð� ������ ������ ������ ���̶�� �ش� ��¥�� ��ȯ
                                    ������ �������� �Ϸ������� ��¥�� ��ȯ
                                �ð������� 0�� 0�� 0�ʴ�


EXTRACT (���� from ��¥) : ��¥���� ���Ŀ� �ش��ϴ� ���� ��ȸ�Ѵ�
                    ���� :  YEAR , MONTH , DAY , HOUR ,

LAST_DAY (��¥) : ������ ��¥�� �������� �ش� ���� ������ ���ڸ� ��ȯ

NEXT_DAY(��¥ , ����) : ������ ��¥�� �������� ������ �ٰ��� ��¥�߿� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ�Ѵ�


*/

select SYSDATE , SYSTIMESTAMP from dual;

select sysdate , -- ����
       add_months(sysdate,1) , -- 1����
       add_months(sysdate,2) , -- 2����
       add_months(sysdate , 3) -- 3����
from dual;

--  ������ 12�� 31���̶�� , 2������ ��¥�� ��ȸ�ϸ� 2.28 Ȥ�� 2.29 �� ��ȯ��
select add_months('2023/12/31' , 2) from dual;

-- �ý����� ���� ���ڿ� �ð� �������� �� �� �� �� �� �� ��ȸ�ϱ�
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(day FROM SYSDATE),
       EXTRACT(hour FROM SYSTIMESTAMP),
       EXTRACT(minute FROM SYSTIMESTAMP),
       EXTRACT(second FROM SYSTIMESTAMP)
from dual;


-- ���� ���ڰ� ���� ���� ������ ���� ��ȸ�ϱ�
select LAST_DAY (SYSDATE),
       LAST_DAY ('2024/01/01'),
       LAST_DAY ('2024-02-01')
from dual;

-- ���� ���ڸ� �������� ���� �������� ��ȭ��
select NEXT_DAY(sysdate , '������') from dual;


select MONTHS_BETWEEN(sysdate,'2023-03-11') from dual;

select SYSDATE +1
from dual;

-- ���� ���ڸ� �������� 1���� 3���� 7���� 10����  , 7���� 3���� ��¥ ��ȸ�ϱ�
select SYSDATE +1,
       SYSDATE + 3 , -- 3����
       SYSDATE + 7, -- 7����
       SYSDATE + 10 -- 10����
           SYSDATE -7, -- 7����
        SYSDATE -3 -- 3����
from dual;

select TRUNC(SYSDATE) - 3 ,TRUNC(SYSDATE)
from dual;

select ADD_MONTHS(TRUNC(SYSDATE),-1 ) ,TRUNC(SYSDATE)
from dual;

-- ������ ��¥�� �������� 7���� ��¥ ��ȸ�ϱ�
select TRUNC(TO_DATE('2023/12/01')) -7
from dual;

-- ������ ��¥ ���� 1���� , 1���� ��¥ ��ȸ
select add_months(TO_DATE('2023/12/01'),-1),
       add_months(TO_DATE('2023/12/01'), 1)
from dual;

-- ���� ���� 7���� ��¥ ��ȸ
select TRUNC(SYSDATE) -7
from dual;

-- ���� ���� �Ѵ��� ��¥��ȸ
select ADD_MONTHS(TRUNC(SYSDATE),-1)
from dual;



-- ���� ���� 7�ϵ����� �ֹ����� ��ȸ (������ ���� ��������)
select *
from orders
where order_date >= trunc(SYSDATE) -7 and order_date < trunc(sysdate);



select SYSDATE,
       SYSDATE + 1/24,  -- 1�ð���
       SYSDATE + 3/24, -- 3�ð���
       SYSDATE + 6/24, -- 6�ð���
       SYSDATE + 9/24, -- 9�ð���
       SYSDATE + 12/24 -- 12�ð���
from dual;


/*
���� -> '��¥'    to_date()
'��¥' -> ����:  ' '
���� -> ����    to_char()
���� -> ����    to_number()

*/

/*
��ȯ �Լ�

    ������ ��ȯ
            ��ȯ�Լ��� ������� �ʾƵ� �������� Ÿ���� �ڵ����� ��ȭ�ϴ� ���̴�.
            ���� -> ��¥ : '����'�� ��ȿ�� ��¥ ������ ������ ��� ��¥�� ����ȴ�
            ���� -> ���� : '����'�� ���ڷθ� �����Ǿ� ������ ���ڷ� ����ȴ�

    select
    from employees
    where hird_date >= '2005/01/01' and hire_date<'2005/07/1' ;

    * �� SQL���� HIRE_DATE�� DATE Ÿ�� �÷��̱� ������ '2005/01/01'���ڰ�
    DATE Ÿ���� ������ �ڵ� ��ȯ
    '2005/01/01' �̳� '2005-01-01' ������ ��� �ڵ����� ��ȯ

    select *
    from employees
    where deparatment_id = '10';

    DEPARTMENT_ID�� number Ÿ���� �÷��̱� ������ '10'���ڰ� number Ÿ���� ������ �ڵ����� ��ȯ





    ����� ��ȯ
        ��ȯ �Լ��� ����ؼ� '����' <--> ��¥ , '����' <--> ���ڰ��� ������ ��ȯ�� �ϴ°�
        TO_DATE('��¥ ������ ���ڿ�' , '����')
        ����) TO_DATE('2023/01/01')
        * ���ڿ��� ��¥������ �ؽ�Ʈ�̱� ������ ������ �������� �ʾƵ� DATE Ÿ������ ��ȯ�ȴ�

        TO_DATE('20230101','YYYYMMDD')
        * ���ڿ��� �Ϲ����̴� ��¥ ������ �ƴ� ��쿡�� ������ �����ؾ� �Ѵ�
*/
select TO_DATE('2023/03/01'),
       TO_DATE('20230301'),
       TO_DATE('2023 01 01')
from dual;


-- ��¥�� ���ڷ� ��ȯ�ϱ�
select TO_CHAR(SYSDATE,'YYYY'),
       TO_CHAR(SYSDATE,'MM'),
       TO_CHAR(SYSDATE,'DD'),
       TO_CHAR(SYSDATE,'DAY'),
       TO_CHAR(SYSDATE,'AM'),
       TO_CHAR(SYSDATE,'HH'),
       TO_CHAR(SYSDATE,'HH24')
from dual;


-- ���� ���̺��� 2005�⵵�� �Ի��� ������ ���̵� �̸� �Ի����� ��ȸ
select employee_id , first_name , hire_date
from employees
where TO_CHAR(hire_date , 'YYYY') = '2005';


select employee_id , first_name, hire_date
from employees
where hire_date >= '2005-01-01' and hire_date < '2006/01/01';



-- ���ڸ� , �� ���Ե� ���ڷ� ��ȯ
select TO_CHAR(100000,'999,999')
from dual;

-- ���ڸ� ���ڷ� ��ȯ
select TO_NUMBER('10000'),TO_NUMBER('100,000','999,999')
from dual;