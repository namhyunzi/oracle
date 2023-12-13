-- 60번 부서에 소속된 직원들의 아이디, 이름, 관리자의 아이디, 관리자의 이름을 조회하기
SELECT E.employee_id AS EMP_ID,
       E.first_name AS EMP_NAME,
       M.employee_id AS MGR_ID,
       M.first_name AS MGR_NAME
FROM employees E, employees M
WHERE E.department_id = 60
AND E.manager_id = M.employee_id;

-- 60번 부서에 소속된 직원들의 아이디, 이름, 급여, 급여등급을 조회하기
SELECT E.employee_id, E.first_name, E.salary, G.grade
FROM employees E, salary_grades G
WHERE E.department_id = 60
AND E.salary >= G.min_salary AND E.salary <= G.max_salary;

-- 직원들 중에서 자신의 상사보다 먼저 입사한 직원들의 아이디, 이름, 입사일, 관리자의 이름, 관리자의 입사일을 조회하기
SELECT E.employee_id  AS EMP_ID,
       E.first_name   AS EMP_NAME,
       E.hire_date    AS EMP_hire_date,
       M.employee_id  AS MGR_ID,
       M.first_name   AS MGR_NAME,
       M.hire_date    AS MGR_hire_date
FROM employees E, employees M
WHERE E.manager_id = M.employee_id
AND E.hire_date < M.hire_date;

-- 직원들의 직종아이디별 평균급여를 조회해서 직종아이디, 평균급여로 조회하기
-- 평균급여의 소수점부분은 전부 버린다.
SELECT job_id, AVG(salary)
FROM employees 
GROUP BY JOB_ID;


-- 관리자별(상사)로 담당자는 직원수를 조회해서 관리자 아이디, 직원수를 출력하기
-- E                    E
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE manager_id IS NOT NULL
GROUP BY MANAGER_ID;

-- 직원들의 전체 평균급여보다 급여를 적게 받는 직원들의 아이디, 이름, 급여를 출력하기
SELECT employee_id, first_name, salary
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);

-- 전체 직원의 평균급여보다 2배 이상의 급여를 받는 직원들의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >= (SELECT AVG(salary)*2
                FROM employees);
-- 80번 부서에 근무하고, 80번 부서의 최저급여와 동일한 급여를 받는 직원의 아이디, 이름, 직종, 급여를 조회하기
SELECT employee_id, first_name, job_id, salary
FROM employees 
WHERE department_id = 80
AND salary = (SELECT MIN(salary)
              FROM employees
              WHERE department_id = 80);
-- 직원들의 급여등급을 계산해서 급여등급별 직원수를 조회해서 급여등급, 직원수를 출력하기
SELECT G.grade, count(*)
FROM employees E, salary_grades G
WHERE E.salary >= G.min_salary AND E.salary <= G.max_salary
GROUP BY G.grade;

-- 'Neena'와 같은 해에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = (SELECT TO_CHAR(hire_date, 'YYYY')
                                    FROM employees
                                    WHERE first_name = 'Neena');