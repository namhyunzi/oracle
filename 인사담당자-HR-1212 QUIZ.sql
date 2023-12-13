-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �������� ���̵�, �������� �̸��� ��ȸ�ϱ�
SELECT E.employee_id AS EMP_ID,
       E.first_name AS EMP_NAME,
       M.employee_id AS MGR_ID,
       M.first_name AS MGR_NAME
FROM employees E, employees M
WHERE E.department_id = 60
AND E.manager_id = M.employee_id;

-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT E.employee_id, E.first_name, E.salary, G.grade
FROM employees E, salary_grades G
WHERE E.department_id = 60
AND E.salary >= G.min_salary AND E.salary <= G.max_salary;

-- ������ �߿��� �ڽ��� ��纸�� ���� �Ի��� �������� ���̵�, �̸�, �Ի���, �������� �̸�, �������� �Ի����� ��ȸ�ϱ�
SELECT E.employee_id  AS EMP_ID,
       E.first_name   AS EMP_NAME,
       E.hire_date    AS EMP_hire_date,
       M.employee_id  AS MGR_ID,
       M.first_name   AS MGR_NAME,
       M.hire_date    AS MGR_hire_date
FROM employees E, employees M
WHERE E.manager_id = M.employee_id
AND E.hire_date < M.hire_date;

-- �������� �������̵� ��ձ޿��� ��ȸ�ؼ� �������̵�, ��ձ޿��� ��ȸ�ϱ�
-- ��ձ޿��� �Ҽ����κ��� ���� ������.
SELECT job_id, AVG(salary)
FROM employees 
GROUP BY JOB_ID;


-- �����ں�(���)�� ����ڴ� �������� ��ȸ�ؼ� ������ ���̵�, �������� ����ϱ�
-- E                    E
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE manager_id IS NOT NULL
GROUP BY MANAGER_ID;

-- �������� ��ü ��ձ޿����� �޿��� ���� �޴� �������� ���̵�, �̸�, �޿��� ����ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);

-- ��ü ������ ��ձ޿����� 2�� �̻��� �޿��� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >= (SELECT AVG(salary)*2
                FROM employees);
-- 80�� �μ��� �ٹ��ϰ�, 80�� �μ��� �����޿��� ������ �޿��� �޴� ������ ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
FROM employees 
WHERE department_id = 80
AND salary = (SELECT MIN(salary)
              FROM employees
              WHERE department_id = 80);
-- �������� �޿������ ����ؼ� �޿���޺� �������� ��ȸ�ؼ� �޿����, �������� ����ϱ�
SELECT G.grade, count(*)
FROM employees E, salary_grades G
WHERE E.salary >= G.min_salary AND E.salary <= G.max_salary
GROUP BY G.grade;

-- 'Neena'�� ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = (SELECT TO_CHAR(hire_date, 'YYYY')
                                    FROM employees
                                    WHERE first_name = 'Neena');