/*
내포된 SQL문의 구분
    서브쿼리 : WHERE절이나 HAVING절에서 조건식에 사용되는 값을 제공하는 SQL문
    인라인뷰 : FROM절에서 가상의 테이블(가상의 테이블을 보통 뷰라고 한다.)을 제공하는 SQL문
    스칼라 서브쿼리 : SELECT절에서 사용되는 서브쿼리다. 보통 값을 하나만 반환한다.
    상호연관 서브쿼리 : 내포된 SQL문에서 메인쿼리의 컬럼을 참조하는 서브쿼리다.
    
서브쿼리(SUB QUERY)
    SELECT문 내부에 정의된 SELECT문을 서브쿼리라고 한다.
    서브쿼리는 WHERE절에 조건식에서 사용되는 값을 제공한다.
    * 이 경우에 조건식에서 사용되는 값이 SQL을 실행해야만 획득가능한 값인 경우가 많다.
    형식
        SELECT 컬럼, 컬럼
        FROM 테이블명 
        WHERE 조건식 연산자 (SELECT 컬럼
                          FORM 테이블명
                          [WHERE 조건식])
    특징 
        한번만 실행된다.
        메인 쿼리보다 먼저 실행된다.
        서브 쿼리의 실행결과가 메인쿼리의 조건식에서 사용된다.
    주의사항
        서브쿼리는 반드시 괄호안에 작성한다.
        서브쿼리는 조건식에 오른쪽에 위치시켜서 가독성을 높인다.
        서브쿼리의 실행결과가 단일행인지 다중행인지 조사해서 적절한 연산자를 사용한다.
*/

-- 전체 직원의 평균급여보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >평균급여; -- 평균급여를 제공하는 서브쿼리가 필요하다.

SELECT employee_id, first_name, salary
FROM employees
WHERE salary >(SELECT AVG(SALARY)
               FROM EMPLOYEES);
               
-- B등급의 최고급여보다 급여를 적게받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > B등급의최고급여;

SELECT employee_id, first_name, salary
FROM employees
WHERE salary < (SELECT max_salary
                FROM salary_grades
                WHERE grade = 'B');
                
-- 60번부서의 직원과 같은 해에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT DISTINCT TO_CHAR(hire_date, 'YYYY')
                                    FROM employees
                                    WHERE department_id = 60);
                                    
/*
서브쿼리의 구분
    - 단일행 서브쿼리
        서브쿼리 실행결과로 한 행이 획득된다. (1행 1열 데이터를 반환하는 서브쿼리)
        연산자 
             = , !=, >, >=, <, <=, IN, NOT IN
    - 다중행 서브쿼리
        서브쿼리 실행결과로 여러 행이 획득된다. (n행 1열 데이터를 반환하는 서브쿼리)
        연산자
            IN, NOT IN, >ANY, >ALL, >= ANY, >= ALL
                    <ANY, <ALL, <= ANY, <= ALL
    - 다중열 서브쿼리
        서브쿼리 실행결과로 여러 개의 컬럼값이 획득된다.(N행 N열 데이터를 반환하는 서브쿼리)
        연산자 
            IN, NOT IN
*/
-- 단일행 서브쿼리
-- 101번 직원에게 보고 받는 상사와 같은 상사에게 보고하는 직원의 아이디, 이름을 조회하기
SELECT employee_id, first_name
FROM employees
WHERE manager_id = (SELECT manager_id
                    FROM employees
                    WHERE employee_id = 101);

-- 101번 직원보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 101);
                
-- 다중행 서브쿼리 
-- 'Steven'과 같은 해에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT TO_CHAR(hire_date, 'YYYY')
                                     FROM employees
                                     WHERE first_name = 'Steven');

-- 60번부서에 소속된 직원들의 급여보다 급여를 많이 받는 직원들의 아이디, 이름, 급여를 조회하기
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
                
-- 다중열 서브쿼리
-- 각 부서별 최저 급여를 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                                  FROM employees
                                  WHERE department_id IS NOT NULL
                                  GROUP BY department_id);

/*
상호연관 서브쿼리 
    서브쿼리에서 메인쿼리의 컬럼을 참조하면 상호연관 서브쿼리가 된다.
    형식 
        SELECT OUTER.COLUMN, OUTER COLUMN
        FROM TABLE OUTER
        WHERE OUTER COLUMN 연산자 (SELECT INNER.COLUMN
                                 FROM TABLE INNER
                                 WHERE INNER.COLUMN = OUTER.COLUMN);
    일반서브쿼리와 상호연관서브쿼리의 다른 점
        서브쿼리는 메인쿼리보다 먼저 실행된다.
        서브쿼리는 딱 한번 실행된다.
        
        상호연관 서브쿼리는 메인쿼리문에서 처리되는 각 행에 대해서 한번씩 실행된다.
*/

-- 직원들 중에서 자신이 소속된 부서의 평균급여보다 급여를 많이 받는 사원의 아이디, 이름, 급여를 조회하기
SELECT X.employee_id, X.first_name, X.salary
FROM employees X
WHERE X.salary > (SELECT AVG(Y.salary)
                  FROM employees Y
                  WHERE Y.department_id = X.department_id);

-------------------------------------------------
--EMPLOYEE_ID  FIRST_NAME  DEPARTMENT_ID  SALARY
--100           홍길동            10         1000 서브쿼리의 x.department_id가 10으로 지정된다.
--101           김유신            10         2000 서브쿼리의 x.department_id가 10으로 지정된다.
--102           강감찬            20         2000 서브쿼리의 x.department_id가 20으로 지정된다.
--103           이순신            20         4000 서브쿼리의 x.department_id가 20으로 지정된다.
-------------------------------------------------

-- 부서아이디, 부서이름, 해당 부서에 소속된 직원수를 조회하기
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

-- 직원아이디, 직원이름, 상사의 아이디, 상사의 이름을 조회하기
SELECT X.EMPLOYEE_ID      EMP_ID,
       X.FIRST_NAME     EMP_NAME,
       X.MANAGER_ID       MGR_ID,
       (SELECT Y.FIRST_NAME
       FROM EMPLOYEES Y
       WHERE Y.EMPLOYEE_ID = X.MANAGER_ID) MAG_NAME
FROM EMPLOYEES X;