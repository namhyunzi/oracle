/*
자체 조인

조인대상이 되는 테이블이 같은 테이블일때 발생하는 조인이다.
같은 테이블끼리 조인하기 때문에, 서로 역할 나누어서 별칭을 정하고, 그 역할에 맞게 조인조건을 정의해야 한다.
같은 테이블끼리 조인하기 때문에 조회하는 컬럼명이 동일한 경우에 적절한 별칭을 붙이는 것이 좋다.
*/

-- 직원테이블에서 직원아이디, 직원이름, 해당 직원의 상사아이디, 상사이름을 조회하기
--              E(직원)   E(직원)  E(직원)-Manager_id
--                               E(상사)-employee_id  E(상사)
SELECT EMP.employee_id AS EMP_ID,
       EMP.first_name AS EMP_NAME,
       MGR.employee_id AS MGR_ID,
       MGR.first_name AS MGR_NAME
FROM employees EMP, employees MGR
WHERE EMP.manager_id = MGR.employee_id;

-- 직원아이디, 직원이름, 직원의 소속부서명, 상사의 아이디, 상사의 이름, 상사의 소속부서명 
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
       
FROM employees E, -- 직원
     employees M, -- 관리자
     departments ED, -- 직원 소속부서
     departments MD -- 관리자 소속부서
WHERE E.department_id = ED.department_id(+) -- 직원과 직원의 소속부서 조인
AND  E.manager_id = M.employee_id(+) -- 직원과 매니저 조인
AND M.department_id = MD.department_id(+); -- 매니저와 매니저의 소속부서 조인