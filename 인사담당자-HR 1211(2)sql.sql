/*
테이블 조인하기
    
    SELECT *
    FROM 테이블1, 테이블2;
    * 테이블의 조인은 조인 대상이되는 테이블의 이름을 FROM절에 나열하기만 하면된다.
    * 별도의 조건이 없으면 테이블1의 모든 행과 테이블2의 모든 행이 연결된 가상의 테이블이 생성된다.
    * (테이블1의 행의 갯수 * 테이블2의 행의 갯수) 만큼의 행이 조회된다.


조인조건 지정하기

    SELECT *
    FROM 테이블1, 테이블2
    WHERE 테이블1.컬럼명 = 테이블2.컬럼명
    * 조인된 테이블의 모든 행에서 조인조건을 만족하는 행이 의미있게 연결된 행이다.
    * 조인조건을 지정하면 의미있게 연결된 행만 조회할 수 있다.
    * 조인조건의 갯수 = 조인된 테이블의 갯수 - 1
*/

-- REGIONS 테이블과 COUNTRIES 테이블 조인하기
-- REGIONS 테이블의 모든 행과 COUNTRIES 테이블의 모든 행이 조인된다.
SELECT *
FROM REGIONS, COUNTRIES;

-- REGIONS 테이블과 COUNTRIES 테이블 조인하고, 서로 연관있는 행만 필터링하기
SELECT COUNTRIES.COUNTRY_ID, 
       COUNTRIES.COUNTRY_NAME, 
       REGIONS.REGION_NAME
FROM REGIONS, COUNTRIES
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID;

-- 직원아이디, 직원이름, 직종아이디, 직종제목, 직종최소급여, 직종최대급여, 급여 조회하기
-- E          E       E                                          E
--                    J          J       J            J
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.JOB_ID,
       J.JOB_TITLE, 
       J.MIN_SALARY,
       J.MAX_SALARY,
       E.SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

/*
등가조인
    조인조건에서 Equal(=) 연산자를 사용한다.
    조인에 참여하는 테이블에서 특정 컬럼이 같은 값을 가지고 있는 행끼리 조인한다. 
    
    ORACLE 등가조인
        SELECT A.컬럼명, A.컬럼명, B.컬럼명, B.컬럼명, ...
        FROM 테이블 A, 테이블 B
        WHERE A.컬럼명 = B.컬럼명;
        
    ANSI SQL 등가조인
        SELECT A.컬럼명, A.컬럼명, B.컬럼명, B.컬럼명, ...
        FROM 테이블 A JOIN 테이블 B
        ON  A.컬럼명 = B.컬럼명;
*/

-- 직원 아이디, 직원이름, 소속부서아이디, 소속부서명을 조회하기
-- E          E        E              
--                     D             D

-- ORACLE의 등가조인
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ANSI SQL의 등가조인
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A JOIN DEPARTMENTS B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;


-- 부서관리자가 지정된 부서의 부서아이디, 부서명, 부서관리자명(직원이름)을 조회하기
--                        D         D       D
--                                          E
SELECT A.DEPARTMENT_ID,
       A.DEPARTMENT_NAME,
       B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID IS NOT NULL
AND A.MANAGER_ID = B.EMPLOYEE_ID;

SELECT A.DEPARTMENT_ID,
       A.DEPARTMENT_NAME,
       B.FIRST_NAME
FROM DEPARTMENTS A JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.MANAGER_ID IS NOT NULL;


-- 직원아이디, 이름, 소속부서아이디, 소속부서명, 직종아이디, 직종제목, 급여를 조회하기
-- E         E     E                       E                  E
--                 D             D         
--                                         J           J
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOBS J ON E.JOB_ID = J.JOB_ID;

-- 직원아이디, 직원이름, 소속부서아이디, 부서명, 소재지아이디, 근무지역도시명을 조회하기
-- E          E        E
--                     D            D      D
--                                         L           L
SELECT A.EMPLOYEE_ID,
       A.FIRST_NAME,
       -- B.DEPARTMENT_ID,
       -- B.DEPARTMENT_NAME,
       -- C.LOCATION_ID,
       C.CITY
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID;

/*
비등가조인용 샘플 테이블 추가
*/
CREATE TABLE SALARY_GRADES (
    GRADE CHAR(1) PRIMARY KEY,
    MIN_SALARY NUMBER(8, 2),
    MAX_SALARY NUMBER(8, 2)
);

INSERT INTO SALARY_GRADES VALUES('A', 0, 2499);
INSERT INTO SALARY_GRADES VALUES('B', 2500, 4999);
INSERT INTO SALARY_GRADES VALUES('C', 5000, 9999);
INSERT INTO SALARY_GRADES VALUES('D', 10000, 19999);
INSERT INTO SALARY_GRADES VALUES('E', 20000, 39999);

COMMIT;

/*
비등가조인 
    조인조건을 지정할 때 조인 대상테이블에서 같은 값을 가진 데이터를 가져오는 대신, 
    크거나 작은 경우의 조건으로 데이터를 조회하는 조인 방식이 비등가 조인이다.
*/

-- 직원아이디, 직원이름, 급여,          급여등급을 조회하기
-- E           E      E
--                    G(최소,최대)      G
SELECT A.employee_id,
       A.first_name,
       A.salary,
       B.grade
FROM employees A, salary_grades B
WHERE A.salary >= B.min_salary AND A.salary <= B.max_salary
ORDER BY A.employee_id ASC;

-- ANSI SQl
SELECT A.employee_id,
       A.first_name,
       A.salary,
       B.grade
FROM employees A
JOIN salary_grades B
ON A.salary >= B.min_salary AND A.salary <= B.max_salary
ORDER BY A.employee_id ASC;

/*
포괄조인

한쪽 테이블에만 데이터가 있고, 다른 쪽 테이블에 조인조건을 만족하는 데이터가 없는 경우, 
조인에 참여하지 못하기 때문에 해당 행은 조회되지 않는다.
데이터가 없는 경우에도 데이터가 있는 쪽 테이블의 모든 행을 조회하는 조인방법이다.
모든 행을 조회하는 테이블의 반대쪽 조인조건에 포괄조인 기호를 추가한다.
*/

-- 부서아이디, 부서이름, 부서관리자아이디,        부서관리자이름을 조회
--   D         D           D(manager_id)            
--                         E(employee_id)  E(first_name)
SELECT A.department_id, A.department_name, A.manager_id, B.first_name
FROM departments A, employees B
WHERE A.manager_id = B.employee_id(+);

-- 직원아이디, 직원이름, 소속부서아이디, 소속부서명을 조회하기
--   E         E         E
--                       D            D
SELECT A.employee_id,
       A.first_name,
       A.department_id,
       B.department_name
FROM employees A, departments B
WHERE A.department_id = B.department_id(+);

-- ANSI SQL
SELECT A.employee_id,
       A.first_name,
       A.department_id,
       B.department_name
FROM employees A
LEFT OUTER JOIN departments B  -- LEFT OUTER JOIN은 선행테이블의 모든 행을 조회한다.
ON A.department_id = B.department_id;