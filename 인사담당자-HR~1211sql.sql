/*
������ �Լ� - ��Ÿ�Լ�

NVL(�÷�, ��ü��)
    NVL�Լ��� NULL���� �ٸ� ������ ��ȯ�Ѵ�.
    ������ �÷��� ���� NULL�� �ƴ� ��쿡�� �ش��÷��� ���� ��ȯ�Ѵ�.
    �ش� �÷��� ��ü���� ������ Ÿ���� ������ Ÿ���̾�� �Ѵ�.
    
NVL2(�÷�, ��ü��1, ��ü��2)
    ������ �÷��� ���� NULL�� �ƴϸ� ��ü��1�� ��ȯ�ǰ�, NULL�̸� ��ü��2�� ��ȯ�ȴ�.
    ��ü��1�� ��ü��2�� ������Ÿ���� ������ Ÿ���̾�� �Ѵ�.
*/

-- ��� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�Ѵ�.
-- Ŀ�̼��� NULL�̸� 0�� ��ȯ�Ѵ�.
SELECT employee_id, first_name, salary, NVL(commission_pct, 0) COMM
FROM employees;

-- ��� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, Ŀ�̼��� ���Ե� �޿��� ��ȸ�ϱ�
-- Ŀ�̼��� ���Ե� �޿� = �޿� +(�޿�*Ŀ�̼�)
SELECT employee_id, first_name, salary, commission_pct,
       salary + (salary*NVL(commission_pct, 0))
FROM employees;

-- ��� �μ��� �μ����̵�, �̸�, �����ھ��̵� ��ȸ�ϱ�
-- ��, �����ڰ� �������� ���� �μ��� '�����ھ���'���� ��ȸ�ϱ�
SELECT department_id, department_name, NVL(TO_CHAR(manager_ID), '�����ھ���')
FROM departments;

/*
    ������ �Լ� - ��Ÿ�Լ�
    
    DECODE(�÷�, �񱳰�1, ��1,
                �񱳰�2, ��2,
                �񱳰�3, ��3,
                �⺻��)
    ������ �÷��� ���� �񱳰�1�� ������ ��1�� ��ȯ�ȴ�.
                   �񱳰�2�� ������ ��1�� ��ȯ�ȴ�.
                   �񱳰�3�� ������ ��1�� ��ȯ�ȴ�.
                   ��ġ�ϴ� ���� ������ �⺻���� ��ȯ�ȴ�.
    *DECODE �Լ��� �÷��� ���� �񱳰� ���� equals �񱳸� �����ϴ�.

CASE ~ WHEN ǥ����
    CASE 
        WHEN ���ǽ�1  THEN ��1
        WHEN ���ǽ�2  THEN ��2
        WHEN ���ǽ�3  THEN ��3
        ELSE ��4
    END
    * ���ǽ��� TRUE�� �����Ǹ� THEN�� ���� �������� �ȴ�.
    * ��� ���ǽ��� FALSE�� �����Ǹ� ELSE�� ��4�� �������� �ȴ�.
    * ���ǽĿ����� =, >, >=, <, <=, != ���� �پ��� �����ڸ� ����ؼ� ���ǽ��� �ۼ��� �� �ִ�.
    * DECODE�Լ��� ������ �� �� �پ��� ������ ������ �� �ִ�.
    
    CASE �÷�
        WHEN �񱳰�1  THEN ��1
        WHEN �񱳰�2  THEN ��2
        WHEN �񱳰�3  THEN ��3
        ELSE ��4
    END
    * ������ �÷��� ���� �񱳰��� �� �ϳ��� ��ġ�ϸ� �ش� THEN�� ���� �������� �ȴ�.
    * ��� �񱳰��� ��ġ���� ������ ELSE�� ��4�� �������� �ȴ�.
    * DECODE �Լ��� ��ɸ鿡�� �����ϴ�.
*/

-- ��� �������̺��� �޿��� 5000���ϸ� ���ʽ��� 1000 �����ϰ�, 
--                 �޿��� 10000���ϸ� ���ʽ��� 2000 �����ϰ�, 
--                 �� �ܴ� 3000�� �����Ѵ�.
-- ��� ������ ���ؼ� �������̵�, �̸�, �޿�, ���ʽ��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary,
    CASE
        WHEN salary <= 5000 THEN 1000
        WHEN salary <= 10000 THEN 2000
        ELSE 3000
    END BONUS
FROM employees;

-- ��� ������ ���ؼ� �μ����̵� �������� ���� �����ϱ�,
-- 10, 20, 30 �μ��� A��, 40, 50, 60 �μ��� B��, �׿ܴ� C��
-- �������̵�, �̸�, �μ����̵�, ������ ��ȸ�ϱ�
SELECT employee_id, first_name, department_id,
    CASE
        WHEN department_id IN (10, 20, 30) THEN 'A'
        WHEN department_id IN (40, 50, 60) THEN 'B'
        ElSE 'C'
    END AS TEAM
FROM employees;

-- �������̺��� �������̵𺰷� �������� ��ȸ�ϱ�
-- 1�� ����, 2�� �Ƹ޸�ī, 3�� �ƽþ�, 4�� ������ī �� �ߵ�
SELECT region_id,
    CASE region_id
        WHEN 1 THEN '����'
        WHEN 2 THEN '�Ƹ޸�ī'
        WHEN 3 THEN '�ƽþ�'
        WHEN 4 THEN '������ī �� �ߵ�'
    END region_name
FROM regions;

-- DECODE�� �̿��ؼ� 
-- �������̺��� �������̵𺰷� �������� ��ȸ�ϱ�
-- 1�� ����, 2�� �Ƹ޸�ī, 3�� �ƽþ�, 4�� ������ī �� �ߵ�
SELECT region_id,
    DECODE(region_id, 1, '����',
                      2, '�Ƹ޸�ī',
                      3, '�ƽþ�',
                      4, '������ī �� �ߵ�') AS REGION_NAME
FROM regions;

-- �μ� ���̺��� �μ����̵�, �μ���, �������̸��� ��ȸ�ϱ�
-- �����ڰ� �����Ǿ� ���� ������ �������� ��ȸ�Ѵ�.
SELECT B.department_id, B.department_name,
    CASE
        WHEN MANAGER_id IS NOT NULL THEN (SELECT A.first_name
                                            FROM employees A
                                            WHERE A.employee_id = B.manager_id)
        ELSE '����'
    END manager_name
FROM departments B;


        