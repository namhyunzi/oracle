/*
다중행 함수
    조회된 행들의 집합그룹에 적용되어 그룹당 하나의 결과를 생성하는 함수다,
    
 * 집합그룹 : 테이블 전체
            그룹화된 테이블의 행(GROUP BY를 사용하면 테이블의 행을 그룹화할 수 있다.)

 COUNT(*)
    조회된 모든 행의 갯수를 반환한다.
 COUNT(컬럼명)
    조회된 행에서 지정된 값이 NULL이 아닌 행의 갯수를 반환한다.
 SUM(컬럼명)
    조회된 행에서 지정된 컬럼 값의 합계를 반환한다.(NULL은 무시한다.)
 AVG(컬럼명)
    조회된 행에서 지정된 컬럼 값의 평균을 반환한다.(NULL은 무시한다.)
 MIN(컬럼명)
    조회된 행에서 지정된 컬럼의 최소값을 반환한다.(NULL은 무시한다.)
 MAX(컬럼명)
    조회된 행에서 지정된 컬럼의 최대값을 반환한다.(NULL은 무시한다.)
    
 다중행 함수 작성시 주의사항
    - 다중행 함수는 WHERE절에 사용할 수 없다.
    - 다중행 함수는 일반 컬럼명을 SELECT절에 같이 적을 수 없다.
      단, GROUP BY 절에 사용한 컬럼명은 SELECT절에 적을 수 있다.
      다중행 함수의 중첩은 한번만 허용된다.
*/

-- 집합그룹이 테이블 전체다.
SELECT COUNT(*)
FROM employees;

-- 집합그룹이 여러개다. 직원 테이블에서 부서아이디가 같은 것끼리 그룹화 시켰다.
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id; 

-- 커미션을 받는 직원의 수를 조회하기
SELECT COUNT(*)
FROM employees
WHERE commission_pct Is NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

-- 60번 부서에 소속된 직원의 평균 급여를 조회하기
SELECT AVG(salary)
FROM employees
WHERE department_id = 60;

-- 80번 부서에 소속된 직원의 급여 총합계, 평균급여, 최소급여, 최대급여를 조회하기
SELECT SUM(salary), TRUNC(AVG(salary)), MIN(salary), MAX(salary)
FROM employees
WHERE department_id = 80;

-- 직원들이 종사하고 있는 직종아이디를 중복을 제외한 행의 갯수를 조회하기
SELECT COUNT(DISTINCT job_id)
FROM employees;

/*
그룹화하기
    GROUP BY 절을 사용해서 테이블의 행을 지정된 컬럼의 값이 같은 값을 가지는 행끼리 그룹화 할 수 있다.
    SELECT 컬럼명1, 컬럼명2, 그룹함수(), 그룹함수()
    FROM 테이블명
    [WHERE 조건식]
    [GROUP BY 컬럼명1, 컬럼명2, ...]
    [ORDER BY 컬럼명]
    *GROUP BY 절에는 테이블 행을 그룹화할 때 기준이 되는 컬럼을 지정한다.
    *GROUP BY 절에는 컬럼을 하나이상 지정할 수 있다.
    *SELECT절의 컬럼명은 GROUP BY절에서 사용한 컬럼명과 동일한 컬럼만 가능하다.
    *GROUP BY절을 사용하면 테이블의 행을 그룹화하고, 그룹화된 각 그룹에 다중행 함수를 적용해서 실행시키고
     실행결과를 반환할 수 있다.
     * 부서별 최고급여, 최저급여, 평균급여, 급여총합을 조회할 수 있다.
     * 직종별 최고급여, 최저급여, 평균급여, 급여총합, 행의 갯수 등을 조회할 수 있다.
     * 입사년도별 최고급여, 최저급여, 평균급여, 급여총합, 행의 갯수 등을 조회할 수 있다.
     * 급여등글별 최고급여, 최저급여, 평균급여, 급여총합, 행의 갯수 등을 조회할 수 있다.
*/

-- 직종별 사원수를 조회하기
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- 부서별 사원수를 조회하기
SELECT D.department_name,COUNT(*)
FROM employees E, departments D
WHERE E.department_id = D.department_id
GROUP BY D.department_name;

-- 근무지별 사원수를 조회하기
SELECT L.city, COUNT(*)
FROM employees E, departments D, locations L
WHERE E.department_id = D.department_id
AND D.location_id = L.location_id
GROUP BY L.city;

-- 입사년도별 사원수를 조회하기
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

-- 부서별, 입사년도별 사원수를 조회하기
SELECT department_id, TO_CHAR(hire_date, 'YYYY'), COUNT(*)
FROM employees
GROUP BY department_id, TO_CHAR(hire_date, 'YYYY')
ORDER BY 1 ASC, 2 ASC;

/*
그룹함수 실행결과를 필터링하기
    HAVING을 이용하면 그룹함수 실행결과를 필터링할 수 있다.
    
    SELECT 컬럼명, 그룹함수()
    FROM 테이블명
    [WHERE 조건식]
    [GROUP BY 컬럼명]
    [HAVING 조건식]
    [ORDER BY 컬럼명]
    * HAVING절은 GROUP BY절과 함께 사용된다.
    * WHERE절의 조건식에는 그룹함수를 사용할 수 없지만, HAVING절의 조건식에는 그룹함수를 사용할 수 있다.
*/
-- 부서별 직원수를 조회했을 때 직원수가 10명 이상인 부서의 아이디와 직원수를 조회하기
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING count(*) >= 10;

-- 2005년 이전에 입사한 직원들을 부서별로 직원수를 조회했을 때 직원수가 5명 이상인 부서아이디와 직원수를 조회하기
SELECT department_id, COUNT(*)
FROM employees
WHERE hire_date <'2005/01/01'
GROUP BY department_id
HAVING COUNT(*) >= 5;



