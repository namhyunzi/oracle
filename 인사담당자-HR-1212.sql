/*
��ü ����

���δ���� �Ǵ� ���̺��� ���� ���̺��϶� �߻��ϴ� �����̴�.
���� ���̺��� �����ϱ� ������, ���� ���� ����� ��Ī�� ���ϰ�, �� ���ҿ� �°� ���������� �����ؾ� �Ѵ�.
���� ���̺��� �����ϱ� ������ ��ȸ�ϴ� �÷����� ������ ��쿡 ������ ��Ī�� ���̴� ���� ����.
*/

-- �������̺��� �������̵�, �����̸�, �ش� ������ �����̵�, ����̸��� ��ȸ�ϱ�
--              E(����)   E(����)  E(����)-Manager_id
--                               E(���)-employee_id  E(���)
SELECT EMP.employee_id AS EMP_ID,
       EMP.first_name AS EMP_NAME,
       MGR.employee_id AS MGR_ID,
       MGR.first_name AS MGR_NAME
FROM employees EMP, employees MGR
WHERE EMP.manager_id = MGR.employee_id;

-- �������̵�, �����̸�, ������ �ҼӺμ���, ����� ���̵�, ����� �̸�, ����� �ҼӺμ��� 
--    E        E                         E               
--                         D1                    
--                                       M           M         
--                                                                D2
SELECT E.employee_id       AS EMP_ID,
       E.first_name        AS EMP_NAME,
       ED.department_name  AS EMP_DEPT_NAME,
       M.employee_id       AS MGR_ID,
       M.first_name        AS MGR_NAME,
       MD.department_name  AS MGR_DEPT_NAME
       
FROM employees E, -- ����
     employees M, -- ������
     departments ED, -- ���� �ҼӺμ�
     departments MD -- ������ �ҼӺμ�
WHERE E.department_id = ED.department_id(+) -- ������ ������ �ҼӺμ� ����
AND  E.manager_id = M.employee_id(+) -- ������ �Ŵ��� ����
AND M.department_id = MD.department_id(+); -- �Ŵ����� �Ŵ����� �ҼӺμ� ����