/*
������ �Լ�
    ��ȸ�� ����� ���ձ׷쿡 ����Ǿ� �׷�� �ϳ��� ����� �����ϴ� �Լ���,
    
 * ���ձ׷� : ���̺� ��ü
            �׷�ȭ�� ���̺��� ��(GROUP BY�� ����ϸ� ���̺��� ���� �׷�ȭ�� �� �ִ�.)

 COUNT(*)
    ��ȸ�� ��� ���� ������ ��ȯ�Ѵ�.
 COUNT(�÷���)
    ��ȸ�� �࿡�� ������ ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
 SUM(�÷���)
    ��ȸ�� �࿡�� ������ �÷� ���� �հ踦 ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
 AVG(�÷���)
    ��ȸ�� �࿡�� ������ �÷� ���� ����� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
 MIN(�÷���)
    ��ȸ�� �࿡�� ������ �÷��� �ּҰ��� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
 MAX(�÷���)
    ��ȸ�� �࿡�� ������ �÷��� �ִ밪�� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
    
 ������ �Լ� �ۼ��� ���ǻ���
    - ������ �Լ��� WHERE���� ����� �� ����.
    - ������ �Լ��� �Ϲ� �÷����� SELECT���� ���� ���� �� ����.
      ��, GROUP BY ���� ����� �÷����� SELECT���� ���� �� �ִ�.
      ������ �Լ��� ��ø�� �ѹ��� ���ȴ�.
*/

-- ���ձ׷��� ���̺� ��ü��.
SELECT COUNT(*)
FROM employees;

-- ���ձ׷��� ��������. ���� ���̺��� �μ����̵� ���� �ͳ��� �׷�ȭ ���״�.
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id; 

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM employees
WHERE commission_pct Is NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

-- 60�� �μ��� �Ҽӵ� ������ ��� �޿��� ��ȸ�ϱ�
SELECT AVG(salary)
FROM employees
WHERE department_id = 60;

-- 80�� �μ��� �Ҽӵ� ������ �޿� ���հ�, ��ձ޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT SUM(salary), TRUNC(AVG(salary)), MIN(salary), MAX(salary)
FROM employees
WHERE department_id = 80;

-- �������� �����ϰ� �ִ� �������̵� �ߺ��� ������ ���� ������ ��ȸ�ϱ�
SELECT COUNT(DISTINCT job_id)
FROM employees;

/*
�׷�ȭ�ϱ�
    GROUP BY ���� ����ؼ� ���̺��� ���� ������ �÷��� ���� ���� ���� ������ �ೢ�� �׷�ȭ �� �� �ִ�.
    SELECT �÷���1, �÷���2, �׷��Լ�(), �׷��Լ�()
    FROM ���̺��
    [WHERE ���ǽ�]
    [GROUP BY �÷���1, �÷���2, ...]
    [ORDER BY �÷���]
    *GROUP BY ������ ���̺� ���� �׷�ȭ�� �� ������ �Ǵ� �÷��� �����Ѵ�.
    *GROUP BY ������ �÷��� �ϳ��̻� ������ �� �ִ�.
    *SELECT���� �÷����� GROUP BY������ ����� �÷���� ������ �÷��� �����ϴ�.
    *GROUP BY���� ����ϸ� ���̺��� ���� �׷�ȭ�ϰ�, �׷�ȭ�� �� �׷쿡 ������ �Լ��� �����ؼ� �����Ű��
     �������� ��ȯ�� �� �ִ�.
     * �μ��� �ְ�޿�, �����޿�, ��ձ޿�, �޿������� ��ȸ�� �� �ִ�.
     * ������ �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ���� ���� ��ȸ�� �� �ִ�.
     * �Ի�⵵�� �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ���� ���� ��ȸ�� �� �ִ�.
     * �޿���ۺ� �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ���� ���� ��ȸ�� �� �ִ�.
*/

-- ������ ������� ��ȸ�ϱ�
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- �μ��� ������� ��ȸ�ϱ�
SELECT D.department_name,COUNT(*)
FROM employees E, departments D
WHERE E.department_id = D.department_id
GROUP BY D.department_name;

-- �ٹ����� ������� ��ȸ�ϱ�
SELECT L.city, COUNT(*)
FROM employees E, departments D, locations L
WHERE E.department_id = D.department_id
AND D.location_id = L.location_id
GROUP BY L.city;

-- �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

-- �μ���, �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT department_id, TO_CHAR(hire_date, 'YYYY'), COUNT(*)
FROM employees
GROUP BY department_id, TO_CHAR(hire_date, 'YYYY')
ORDER BY 1 ASC, 2 ASC;

/*
�׷��Լ� �������� ���͸��ϱ�
    HAVING�� �̿��ϸ� �׷��Լ� �������� ���͸��� �� �ִ�.
    
    SELECT �÷���, �׷��Լ�()
    FROM ���̺��
    [WHERE ���ǽ�]
    [GROUP BY �÷���]
    [HAVING ���ǽ�]
    [ORDER BY �÷���]
    * HAVING���� GROUP BY���� �Բ� ���ȴ�.
    * WHERE���� ���ǽĿ��� �׷��Լ��� ����� �� ������, HAVING���� ���ǽĿ��� �׷��Լ��� ����� �� �ִ�.
*/
-- �μ��� �������� ��ȸ���� �� �������� 10�� �̻��� �μ��� ���̵�� �������� ��ȸ�ϱ�
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING count(*) >= 10;

-- 2005�� ������ �Ի��� �������� �μ����� �������� ��ȸ���� �� �������� 5�� �̻��� �μ����̵�� �������� ��ȸ�ϱ�
SELECT department_id, COUNT(*)
FROM employees
WHERE hire_date <'2005/01/01'
GROUP BY department_id
HAVING COUNT(*) >= 5;



