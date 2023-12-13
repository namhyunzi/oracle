/*
������ SQL���� ����
    �������� : WHERE���̳� HAVING������ ���ǽĿ� ���Ǵ� ���� �����ϴ� SQL��
    �ζ��κ� : FROM������ ������ ���̺�(������ ���̺��� ���� ���� �Ѵ�.)�� �����ϴ� SQL��
    ��Į�� �������� : SELECT������ ���Ǵ� ����������. ���� ���� �ϳ��� ��ȯ�Ѵ�.
    ��ȣ���� �������� : ������ SQL������ ���������� �÷��� �����ϴ� ����������.
    
��������(SUB QUERY)
    SELECT�� ���ο� ���ǵ� SELECT���� ����������� �Ѵ�.
    ���������� WHERE���� ���ǽĿ��� ���Ǵ� ���� �����Ѵ�.
    * �� ��쿡 ���ǽĿ��� ���Ǵ� ���� SQL�� �����ؾ߸� ȹ�氡���� ���� ��찡 ����.
    ����
        SELECT �÷�, �÷�
        FROM ���̺�� 
        WHERE ���ǽ� ������ (SELECT �÷�
                          FORM ���̺��
                          [WHERE ���ǽ�])
    Ư¡ 
        �ѹ��� ����ȴ�.
        ���� �������� ���� ����ȴ�.
        ���� ������ �������� ���������� ���ǽĿ��� ���ȴ�.
    ���ǻ���
        ���������� �ݵ�� ��ȣ�ȿ� �ۼ��Ѵ�.
        ���������� ���ǽĿ� �����ʿ� ��ġ���Ѽ� �������� ���δ�.
        ���������� �������� ���������� ���������� �����ؼ� ������ �����ڸ� ����Ѵ�.
*/

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >��ձ޿�; -- ��ձ޿��� �����ϴ� ���������� �ʿ��ϴ�.

SELECT employee_id, first_name, salary
FROM employees
WHERE salary >(SELECT AVG(SALARY)
               FROM EMPLOYEES);
               
-- B����� �ְ�޿����� �޿��� ���Թ޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > B������ְ�޿�;

SELECT employee_id, first_name, salary
FROM employees
WHERE salary < (SELECT max_salary
                FROM salary_grades
                WHERE grade = 'B');
                
-- 60���μ��� ������ ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT DISTINCT TO_CHAR(hire_date, 'YYYY')
                                    FROM employees
                                    WHERE department_id = 60);
                                    
/*
���������� ����
    - ������ ��������
        �������� �������� �� ���� ȹ��ȴ�. (1�� 1�� �����͸� ��ȯ�ϴ� ��������)
        ������ 
             = , !=, >, >=, <, <=, IN, NOT IN
    - ������ ��������
        �������� �������� ���� ���� ȹ��ȴ�. (n�� 1�� �����͸� ��ȯ�ϴ� ��������)
        ������
            IN, NOT IN, >ANY, >ALL, >= ANY, >= ALL
                    <ANY, <ALL, <= ANY, <= ALL
    - ���߿� ��������
        �������� �������� ���� ���� �÷����� ȹ��ȴ�.(N�� N�� �����͸� ��ȯ�ϴ� ��������)
        ������ 
            IN, NOT IN
*/
-- ������ ��������
-- 101�� �������� ���� �޴� ���� ���� ��翡�� �����ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
SELECT employee_id, first_name
FROM employees
WHERE manager_id = (SELECT manager_id
                    FROM employees
                    WHERE employee_id = 101);

-- 101�� �������� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 101);
                
-- ������ �������� 
-- 'Steven'�� ���� �ؿ� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT TO_CHAR(hire_date, 'YYYY')
                                     FROM employees
                                     WHERE first_name = 'Steven');

-- 60���μ��� �Ҽӵ� �������� �޿����� �޿��� ���� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > ANY (SELECT salary 
                    FROM employees
                    WHERE department_id = 60);

SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 60);
                    
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > ALL (SELECT salary 
                    FROM employees
                    WHERE department_id = 60);
                    
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 60);
                
-- ���߿� ��������
-- �� �μ��� ���� �޿��� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                                  FROM employees
                                  WHERE department_id IS NOT NULL
                                  GROUP BY department_id);

/*
��ȣ���� �������� 
    ������������ ���������� �÷��� �����ϸ� ��ȣ���� ���������� �ȴ�.
    ���� 
        SELECT OUTER.COLUMN, OUTER COLUMN
        FROM TABLE OUTER
        WHERE OUTER COLUMN ������ (SELECT INNER.COLUMN
                                 FROM TABLE INNER
                                 WHERE INNER.COLUMN = OUTER.COLUMN);
    �Ϲݼ��������� ��ȣ�������������� �ٸ� ��
        ���������� ������������ ���� ����ȴ�.
        ���������� �� �ѹ� ����ȴ�.
        
        ��ȣ���� ���������� �������������� ó���Ǵ� �� �࿡ ���ؼ� �ѹ��� ����ȴ�.
*/

-- ������ �߿��� �ڽ��� �Ҽӵ� �μ��� ��ձ޿����� �޿��� ���� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT X.employee_id, X.first_name, X.salary
FROM employees X
WHERE X.salary > (SELECT AVG(Y.salary)
                  FROM employees Y
                  WHERE Y.department_id = X.department_id);

-------------------------------------------------
--EMPLOYEE_ID  FIRST_NAME  DEPARTMENT_ID  SALARY
--100           ȫ�浿            10         1000 ���������� x.department_id�� 10���� �����ȴ�.
--101           ������            10         2000 ���������� x.department_id�� 10���� �����ȴ�.
--102           ������            20         2000 ���������� x.department_id�� 20���� �����ȴ�.
--103           �̼���            20         4000 ���������� x.department_id�� 20���� �����ȴ�.
-------------------------------------------------

-- �μ����̵�, �μ��̸�, �ش� �μ��� �Ҽӵ� �������� ��ȸ�ϱ�
SELECT X.department_id, X.department_name,
       (SELECT COUNT(*)
        FROM employees Y
        WHERE Y.department_id = X.department_id) CNT
FROM departments X;

--------------------------------------------------------------------------------
-- department_id       department_name           CNT
--10	               Administration           SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID = 10
--20	               Marketing                SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID = 20
--30	               Purchasing               SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID = 30
--40	               Human Resources          SELECT COUNT(*) FROM EMPS Y WHERE Y.DEPT_ID = 40
--------------------------------------------------------------------------------

-- �������̵�, �����̸�, ����� ���̵�, ����� �̸��� ��ȸ�ϱ�
SELECT X.EMPLOYEE_ID      EMP_ID,
       X.FIRST_NAME     EMP_NAME,
       X.MANAGER_ID       MGR_ID,
       (SELECT Y.FIRST_NAME
       FROM EMPLOYEES Y
       WHERE Y.EMPLOYEE_ID = X.MANAGER_ID) MAG_NAME
FROM EMPLOYEES X;