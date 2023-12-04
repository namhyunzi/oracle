/* ���̺��� ������ ��ȸ
    
    1. ������ ���̺��� ��� ��, ��� ���� ��ȸ�Ѵ�.
    SELECT *
    FROM ���̺��;
    
    2. ������ ���̺��� ��� ��, ������ ���� ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷��� ...
    FROM ���̺��;
    
    3. SELECT������ ��Ģ������ ������ �� �ִ�.
    SELECT �÷���*����, �÷���*�÷���, ...
    FROM ���̺��;
    * ��Ģ���꿡 ���Ǵ� �÷��� �ش� �÷��� ���� ���ڰ��̾�� �Ѵ�.
    
    4. �÷��� ��Ī(Alias) �ο��ϱ�
    SELECT �÷��� AS ��Ī, �÷��� AS ��Ī, ...
    FROME ���̺��;
    
    SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī, ...
    FROME ���̺��;
*/

-- ���� ���̺��� ��� ��, ��� ���� �� ��ȸ�ϱ�
SELECT *
FROM regions;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM countries;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM jobs;

-- �μ� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM departments;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM employees;

-- ���� ���̺��� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id, min_salary, max_salary
FROM jobs;

-- ���� ���̺��� �������̵�, �����̸�(FIRST_NAME), �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees;

-- ������ ���̺��� ������ ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT location_id, street_address, city
FROM locations;

-- ���� ���̺��� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
SELECT employee_id, first_name, salary, salary*12
FROM employees;

-- ���� ���̺��� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�'
-- ������ �޿�*12�� ����Ѵ�.
-- ������ ��Ī�� ANNUAL_SALARY��.
SELECT employee_id, first_name, salary, salary*12 ANNUAL_SALARY
FROM employees;

-- ���� ���̺��� �������̵�, �ְ�޿�, �����޿�,�ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�
-- �ְ�޿��� �����޿��� ���̴� salary_gap ��Ī�� �ο��Ѵ�.
SELECT job_id, max_salary, min_salary, max_salary - min_salary salary_gap
FROM jobs;

/*
    ������ ���͸��ϱ�
    
    1. WHERE ���ǽ��� �ۼ��Ͽ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷��� ...
    FROM ���̺��
    WHERE ���ǽ�;
    
    2. WHERE������ 2�� �̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�.
     2�� �̻��� ���ǽ��� �ۼ��� ���� AND, OR, NOT �� �����ڸ� ����Ѵ�.
     
    SELECT �÷���, �÷���, �÷��� ...
    FROM ���̺��
    WHERE ���ǽ�1 AND ���ǽ�2;
    * ���ǽ�1�� ���ǽ�2�� ��� true�� �����Ǵ� �ุ ��ȸ�Ѵ�.
    
    SELECT �÷���, �÷���, �÷��� ...
    FROM ���̺��
    WHERE ���ǽ�1 OR ���ǽ�2;
    * ���ǽ�1�� ���ǽ�2 �߿��� �ϳ��� true�� �����Ǵ� �ุ ��ȸ�ȴ�.
    
    SELECT �÷���, �÷���, �÷��� ...
    FROM ���̺��
    WHERE ���ǽ�1 AND (���ǽ�2 OR ���ǽ�3);
    *AND �����ڿ� OR �����ڸ� ���� ����� ���� OR ������� ��ȣ�� ���´�.
*/
-- �������̺��� �ҼӺμ� ���̵� 60���� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT department_id, first_name, job_id
FROM employees
WHERE department_id = 60;

-- ���� ���̺��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 10000;

-- ���� ���̺��� �������̵� 'SA_MAN'�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE job_id = 'SA_MAN';

-- ���� ���̺��� �޿��� 5000 ~ 10000 ������ ���ϴ� �������̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND salary <= 10000;

-- ���� ���̺��� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;