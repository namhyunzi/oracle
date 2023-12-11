/*
���̺� �����ϱ�
    
    SELECT *
    FROM ���̺�1, ���̺�2;
    * ���̺��� ������ ���� ����̵Ǵ� ���̺��� �̸��� FROM���� �����ϱ⸸ �ϸ�ȴ�.
    * ������ ������ ������ ���̺�1�� ��� ��� ���̺�2�� ��� ���� ����� ������ ���̺��� �����ȴ�.
    * (���̺�1�� ���� ���� * ���̺�2�� ���� ����) ��ŭ�� ���� ��ȸ�ȴ�.


�������� �����ϱ�

    SELECT *
    FROM ���̺�1, ���̺�2
    WHERE ���̺�1.�÷��� = ���̺�2.�÷���
    * ���ε� ���̺��� ��� �࿡�� ���������� �����ϴ� ���� �ǹ��ְ� ����� ���̴�.
    * ���������� �����ϸ� �ǹ��ְ� ����� �ุ ��ȸ�� �� �ִ�.
    * ���������� ���� = ���ε� ���̺��� ���� - 1
*/

-- REGIONS ���̺�� COUNTRIES ���̺� �����ϱ�
-- REGIONS ���̺��� ��� ��� COUNTRIES ���̺��� ��� ���� ���εȴ�.
SELECT *
FROM REGIONS, COUNTRIES;

-- REGIONS ���̺�� COUNTRIES ���̺� �����ϰ�, ���� �����ִ� �ุ ���͸��ϱ�
SELECT COUNTRIES.COUNTRY_ID, 
       COUNTRIES.COUNTRY_NAME, 
       REGIONS.REGION_NAME
FROM REGIONS, COUNTRIES
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID;

-- �������̵�, �����̸�, �������̵�, ��������, �����ּұ޿�, �����ִ�޿�, �޿� ��ȸ�ϱ�
-- E          E       E                                          E
--                    J          J       J            J
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.JOB_ID,
       J.JOB_TITLE, 
       J.MIN_SALARY,
       J.MAX_SALARY,
       E.SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

/*
�����
    �������ǿ��� Equal(=) �����ڸ� ����Ѵ�.
    ���ο� �����ϴ� ���̺��� Ư�� �÷��� ���� ���� ������ �ִ� �ೢ�� �����Ѵ�. 
    
    ORACLE �����
        SELECT A.�÷���, A.�÷���, B.�÷���, B.�÷���, ...
        FROM ���̺� A, ���̺� B
        WHERE A.�÷��� = B.�÷���;
        
    ANSI SQL �����
        SELECT A.�÷���, A.�÷���, B.�÷���, B.�÷���, ...
        FROM ���̺� A JOIN ���̺� B
        ON  A.�÷��� = B.�÷���;
*/

-- ���� ���̵�, �����̸�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
-- E          E        E              
--                     D             D

-- ORACLE�� �����
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ANSI SQL�� �����
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A JOIN DEPARTMENTS B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;


-- �μ������ڰ� ������ �μ��� �μ����̵�, �μ���, �μ������ڸ�(�����̸�)�� ��ȸ�ϱ�
--                        D         D       D
--                                          E
SELECT A.DEPARTMENT_ID,
       A.DEPARTMENT_NAME,
       B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID IS NOT NULL
AND A.MANAGER_ID = B.EMPLOYEE_ID;

SELECT A.DEPARTMENT_ID,
       A.DEPARTMENT_NAME,
       B.FIRST_NAME
FROM DEPARTMENTS A JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.MANAGER_ID IS NOT NULL;


-- �������̵�, �̸�, �ҼӺμ����̵�, �ҼӺμ���, �������̵�, ��������, �޿��� ��ȸ�ϱ�
-- E         E     E                       E                  E
--                 D             D         
--                                         J           J
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOBS J ON E.JOB_ID = J.JOB_ID;

-- �������̵�, �����̸�, �ҼӺμ����̵�, �μ���, ���������̵�, �ٹ��������ø��� ��ȸ�ϱ�
-- E          E        E
--                     D            D      D
--                                         L           L
SELECT A.EMPLOYEE_ID,
       A.FIRST_NAME,
       -- B.DEPARTMENT_ID,
       -- B.DEPARTMENT_NAME,
       -- C.LOCATION_ID,
       C.CITY
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID;

/*
�����ο� ���� ���̺� �߰�
*/
CREATE TABLE SALARY_GRADES (
    GRADE CHAR(1) PRIMARY KEY,
    MIN_SALARY NUMBER(8, 2),
    MAX_SALARY NUMBER(8, 2)
);

INSERT INTO SALARY_GRADES VALUES('A', 0, 2499);
INSERT INTO SALARY_GRADES VALUES('B', 2500, 4999);
INSERT INTO SALARY_GRADES VALUES('C', 5000, 9999);
INSERT INTO SALARY_GRADES VALUES('D', 10000, 19999);
INSERT INTO SALARY_GRADES VALUES('E', 20000, 39999);

COMMIT;

/*
������ 
    ���������� ������ �� ���� ������̺��� ���� ���� ���� �����͸� �������� ���, 
    ũ�ų� ���� ����� �������� �����͸� ��ȸ�ϴ� ���� ����� �� �����̴�.
*/

-- �������̵�, �����̸�, �޿�,          �޿������ ��ȸ�ϱ�
-- E           E      E
--                    G(�ּ�,�ִ�)      G
SELECT A.employee_id,
       A.first_name,
       A.salary,
       B.grade
FROM employees A, salary_grades B
WHERE A.salary >= B.min_salary AND A.salary <= B.max_salary
ORDER BY A.employee_id ASC;

-- ANSI SQl
SELECT A.employee_id,
       A.first_name,
       A.salary,
       B.grade
FROM employees A
JOIN salary_grades B
ON A.salary >= B.min_salary AND A.salary <= B.max_salary
ORDER BY A.employee_id ASC;

/*
��������

���� ���̺��� �����Ͱ� �ְ�, �ٸ� �� ���̺� ���������� �����ϴ� �����Ͱ� ���� ���, 
���ο� �������� ���ϱ� ������ �ش� ���� ��ȸ���� �ʴ´�.
�����Ͱ� ���� ��쿡�� �����Ͱ� �ִ� �� ���̺��� ��� ���� ��ȸ�ϴ� ���ι���̴�.
��� ���� ��ȸ�ϴ� ���̺��� �ݴ��� �������ǿ� �������� ��ȣ�� �߰��Ѵ�.
*/

-- �μ����̵�, �μ��̸�, �μ������ھ��̵�,        �μ��������̸��� ��ȸ
--   D         D           D(manager_id)            
--                         E(employee_id)  E(first_name)
SELECT A.department_id, A.department_name, A.manager_id, B.first_name
FROM departments A, employees B
WHERE A.manager_id = B.employee_id(+);

-- �������̵�, �����̸�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
--   E         E         E
--                       D            D
SELECT A.employee_id,
       A.first_name,
       A.department_id,
       B.department_name
FROM employees A, departments B
WHERE A.department_id = B.department_id(+);

-- ANSI SQL
SELECT A.employee_id,
       A.first_name,
       A.department_id,
       B.department_name
FROM employees A
LEFT OUTER JOIN departments B  -- LEFT OUTER JOIN�� �������̺��� ��� ���� ��ȸ�Ѵ�.
ON A.department_id = B.department_id;