/*
    �ߺ��� ���� �����ϰ� ��ȸ�ϱ�
    SELECT DISTINCT �÷���, �÷���, ...
    FROM ���̺��
    * ������ �÷����� ���� ���� ���� ������ ���� �ѹ��� ��ȸ�ȴ�.
*/

-- �������̺��� �������� �����ϴ� �������̵� ��ȸ�ϱ�
SELECT DISTINCT job_id
FROM employees;

-- ���������̷� ���̺��� ������ �ѹ��̶� ������ ���� �ִ� ������ ���̵� ��ȸ�Ѵ�.
SELECT DISTINCT employee_id
FROM job_history;

/*
    ��ȸ����� �����ϱ�
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    [WHERE ���ǽ�]
    [ORDER BY [�÷���|ǥ����} {ASC|DESC}]
    * ORDER BY���� ����ϸ� ��ȸ����� �������� Ȥ�� ������������ ������ �� �ִ�.
    * ORDER BY���� �÷����� ���� �ش� �÷��� ���� �������� ����� �������� Ȥ�� ������������ �����Ѵ�.
    * ���Ĺ����� ASC Ȥ�� DESC�� �����Ѵ�. �����ϸ� ASC��.
    
    ���� �÷��� ���� �������� �����ϱ�
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    [WHERE ���ǽ�]
    [ORDER BY [�÷���|ǥ����} {ASC|DESC}, [�÷���|ǥ����} {ASC|DESC}]
*/

-- �������̺��� �������̵�, �̸�, �޿��� ��ȸ�ϰ�, �޿������� �������� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;

-- �������̺��� 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �޿��� ��ȸ�ϰ� �޿������� �������� �����ؼ� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = 60
ORDER BY salary ASC;
 
 -- �������̺��� 50�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �Ի���, �޿��� ��ȸ�ϰ�, �Ի����� ��������
 -- �������� �����ؼ� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date, salary
FROM employees
WHERE department_id = 50
ORDER BY hire_date ASC;

-- �������̺��� �������� �������̵�, �̸�, �޿�, �μ����̵� ��ȸ�ϰ�, �μ����̵� �������� �������� �����ϰ�,
-- �μ����̵� ������ �������� �޿��� �������� �������� �����ؼ� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, department_id
FROM employees
ORDER BY department_id ASC, salary DESC;

/*
    WHERE���� ���ǽĿ��� �پ��� ������ ����ϱ�
    
    1. �񱳿����� 
    =, !=, >, <, >=, <=
    * ����Ŭ���� not equal�� ��Ÿ���� �����ڴ� !=�� <>�� ����� �� �ִ�.
    2. ��������.
    AND, OR , NOT
    3. ��Ÿ ������
    BETWEEN ��1 AND ��2
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE �÷��� BETWEEN ��1 AND ��2;
    * WHERE���� ������ �÷��� ���� ��1 �̻�, ��2 ������ ���� ��ȸ�Ѵ�.
    * WHERE �÷��� BETWEEN ��1 AND ��2�� 
      WHERE �÷��� >= ��1 AND <= ��2
      ���� �� ������ �����ϴ�.
     
    IN (��1, ��2, ��3, ...)
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE �÷��� IN (��1, ��2, ��3, ...);
    * WHERE���� ������ �÷��� ���� ��1, ��2, ��3 �� �ϳ��� ��ġ�ϸ� ��ȸ�Ѵ�.
    * WHERE �÷��� IN (��1, ��2, ��3, ...);
      WHERE �÷��� = ��1 OR �÷��� = ��2 OR �÷��� = ��3
      ���� �� ������ �����ϴ�.
      
    IS NULL�� IS NOT NULL
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE �÷��� IS NULL;
    * WHERE ������ ������ �÷��� ���� NULL�� ���� ��ȸ�Ѵ�.
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE �÷��� IS NOT NULL;
    * WHERE ������ ������ �÷��� ���� NULL�� �ƴ� ���� ��ȸ�Ѵ�.
    
    LIKE '����'
    
    ���Ϲ��� 
        '%' 0�� �̻��� ������ ���ڸ� ��Ÿ����.
        '_' ������ ���� �ϳ��� ��Ÿ����.
        
        ������ '�ڹ�'�� �����ϴ� ������ ��ȸ�ϱ�
            WHERE book_tite LIKE '�ڹ�%'
            * '�ڹ�', '�ڹ��� ����', '�ڹ� ���α׷���'�� ���� ���� ���ϰ� ��ġ�Ѵ�.
        ������ '�ڹ�'�� ������ ������ ��ȸ�ϱ�
            WHERE book_tite LIKE '%�ڹ�'
            * '�ڹ�', '�����ϸ��� ������ �ڹ�', '����Ƽ�� �ڹ�'�� ���� ���� ���ϰ� ��ġ�Ѵ�.
        ���� '�ڹ�'�� ���ԵǾ� �ִ� ������ ��ȸ�ϱ�
             WHERE book_tite LIKE '%�ڹ�%'
             * '�ڹ�', '�ڹ��� ����' '�̰��� �ڹٴ�', '����Ƽ�� �ڹ�'�� ���� ���� ���ϰ� ��ġ�Ѵ�.
             
        ������ '��'���� ���� ��ȸ�ϱ�
        WHERE NAME LIKE '��_%'
            *'��'�� ���� ���ϰ� ��ġ���� �ʴ´�.
            *'�豸', '������', '����ѹ��ź��̿͵η��'�� ���� ���� ���ϰ� ��ġ�Ѵ�.
        '��'���� �̸��� ������ ���� ��ȸ�ϱ�
            WHERE NAME LIKE '��_'
        '��'���� �̸��� 2������ ���� ��ȸ�ϱ�
            WHERE NAME LIKE '��__'
*/

-- �������̺��� �޿��� 3000�̻� 5000������ ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϰ�,
-- �޿������� �������� �����ϱ�
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000
ORDER BY salary ASC;

-- �������̺��� 2005�⵵�� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϰ�, �Ի��ϼ����� �������� �����ϱ�
SELECT employee_id, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2005-12-31'
ORDER BY hire_date ASC;

-- �������̺��� �ҼӺμ��� 10���̰ų� 20���̰ų� 30���̰�, �޿��� 3000���Ϸ� �޴�
-- ������ ���̵�, �̸�, �ҼӺμ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id IN (10, 20, 30)
AND salary <= 3000;

-- �μ����̺��� �����ڰ� �����Ǿ����� �ʴ� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
SELECT department_id, department_name
FROM departments
WHERE manager_id IS NULL;

-- �μ����̺��� �����ڰ� ������ �μ��� ���̵�� �̸��� ��ȸ�ϱ�
SELECT department_id, department_name, manager_id
FROM departments
WHERE manager_id IS NOT NULL;

-- �������̺��� �ҼӺμ��� �������� ���� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT employee_id, first_name, job_id
FROM employees
WHERE department_id IS NULL;

-- �������̺��� �������̵� 'SA'�� �����ϴ� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id
FROM employees
WHERE job_id LIKE 'SA%';


    
    

    
    
    
    
    
    
    
    
    
    
    
    
    