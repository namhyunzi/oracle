/* 문자함수

   lower (컬럼 혹은 표현식) : 소문자로 변환된 값을 반환한다
   upper (컬럼 혹은 표현식) : 대문자로 변환된 문자를 반환한다,

    concat(컬럼 혹은 표현식 ,  컬럼 혹은 표현식) : 두 문자열을 연결해서 반환한다

    length (컬럼 혹은 표현식) : 문자열의 길이를 반환

    substr (컬럼 혹은 표현식, 시작위치, 길이): 문자열을 시작위치부터 길이만큼 잘라서 반환
                                                시작위치는 1부터 시작한다

    instr (컬럼 혹은 표현식 , 문자열) : 지정된 문자열이 등장위치를 반환

    trim(컬럼 혹은 표현식) : 불필요한 좌우 여백이 제거된 문자열 반환

    LPAD(컬럼 혹은 표현식 , 길이 , 문자) : 컬럭혹은 표현식의 길이가 지정된 길이보다
                                    짧으면 부족한 길이만큼 왼쪽에 지정된 문자가 채워진 문자열이 반환

 */

-- 60번 부서에 소속된 직원들의 이름을 소문자 대문자로 조회
select first_name , lower(FIRST_NAME) , upper(FIRST_NAME)
from EMPLOYEES
where DEPARTMENT_ID = 60;

-- 60번 부서에 소속된 직원들의 FIRST_name 과 LAST_NAME 을 연결해서 조회


select CONCAT(first_name , last_name)
from employees
WHERE department_id = 60;


-- 60번 부서에 소속된 직원들의 FIRST_NAME 과 LAST_NAME 연결해서 조회
SELECT FIRST_NAME || LAST_NAME
from EMPLOYEES
WHERE DEPARTMENT_ID = 60;

SELECT FIRST_NAME || '' || LAST_NAME
from EMPLOYEES
WHERE DEPARTMENT_ID = 60;


-- 60번 부서에 소속된 직원들의 이름과 이름의 길이를 조회하기
SELECT first_name , LENGTH (first_name)
FROM employees
WHERE department_id = 60;

-- 이름이 6글자 이상인 직원의 아이디와 이름 조회
SELECT employee_id , first_name
FROM EMPLOYEES
WHERE LENGTH(first_name) >= 6;

-- SAMPLE_BOOKS 에서 저자 이름을 조회하기
SELECT book_writer , SUBSTR(book_writer,1,1)
FROM sample_books;

-- 전화번호에서 국번만 조회하기
SELECT substr('031)1234-5678' , 1, instr('031)1234-5678', ')' )-1)
from DUAL;

-- DUAL은 오라클에서 제공하는 DUMMY 테이블이다
-- DUAL은 1행 1열짜리 테이블이다
-- 실제 테이블 조회없이 간단한 연산을 수행할 때 이용
select *
from DUAL;

-- 좌우 여백만 비워줌
SELECT TRIM('     123     Hello,sqlDevelpoer!   42  4')
from dual;

-- 지정된 길이만큼 문자열의 왼쪽에 '3' 을 채워서 조회
select LPAD('100' , 10 , '3')
from dual;

-- 지정된 길이만큼 문자열의 오른쪽에 '2'를 채워서 조회
select RPAD('100' , 10 , '2')
from dual;

/*
숫자함수

ROUND(컬럼 혹은 표현식 , 자리수) : 지정된 자리수까지 반올림한다

TRUNC(컬럼 혹은 표현식 , 자리수) : 지정된 자리수까지 남기고 전부 버린다

MOD(숫자1 , 숫자2) : 나머지 값을반환

ABS (컬럼 혹은 표현식) : 절대값을 반환한다

ceil (컬럼 혹은 표현식) : 지정된 값보다 크거나 같은 정수중에서 가장 작은 정수반환
FLOOR(컬럼 혹은 표현식) : 지정된 값보다 작거나 같은 정수 중에서 가장 큰 정수를 반환



*/

select round(1234.5678 ),
       round(1234.5678 , 3),
       round(1234.5678 , 2),
       round(1234.5678 , 1),
       round(1234.5678 , 0),
       round(1234.5678 , -1),
       round(1234.5678 , -2), -- 100의 자리까지 남아있음?
       round(1234.5678 , -3),    -- 1000의 자리까지 남아있음?
       round(1554.5678 , -2)
from dual;



select TRUNC(1234.5678 ),
       TRUNC(1234.5678 , 3),
       TRUNC(1234.5678 , 2),
       TRUNC(1234.5678 , 1),
       TRUNC(1234.5678 , 0),
       TRUNC(1234.5678 , -1),
       TRUNC(1234.5678 , -2),
       TRUNC(1234.5678 , -3),
       TRUNC(1554.5678 , -2)
from dual;

-- 80번 부서에 소속된 직원의 아이디 이름 급여에 대한 # 출력
-- # 하나는 1000달러
select EMPLOYEE_id , first_name , lpad('#',TRUNC(salary/1000),'#')
from employees
where department_id = 80;


slect  10 % 4
from dual;

select MOD(10,4) ,abS(-10)
from dual;

select ceil(1), ceil(1.2), ceil(1.5) , ceil(1.9), ceil(2.0)
from dual;

select FLOOR(1) ,FLOOR(1.1) , FLOOR(1.5) , FLOOR(1.9) , FLOOR(2)
from dual;





/*
날짜 함수

SYSDATE : 시스템의 현재 일자와 시간을 DATE 타입으로 반환
        + 데이터가 추가 될 때 , 데이터가 변경 될 때 현재 날짜와 시간정보를 저장하는 용도
SYSTIMESTAMP :  시스템 현재 일자와 시간을 TIMESTAMP 타입으로 반환

// 개월 수 관련
add_months(날짜 , 숫자) : 날짜에 지정된 숫자 만큼의 월을 더한 날짜를 반환
MONTHS_BETWEEN(날짜 , 날짜 ) :  두날짜 사이의 개월수를 반환

// 일수 관련 연산
날짜 +숫자 = 숫자만큼 일자가 경과된 날짜를 반환
날짜 - 숫자 = 숫자만큼 이전 날짜를 반환
날짜 - 날짜 = 두 날짜 사이의 일수를 반환
날짜 + 1/24 = 1시간 이후의 날짜를 반환

TRUNC(날짜) : 지정된 날짜의 모든 시간 정보를 0시0분0초로
ROUND(날짜) : 지정된 날짜의 시간 정보를 정오를 지나기 전이라면 해당 날짜가 반환
                                    정오를 지났으면 하루증가된 날짜가 반환
                                시간정보는 0시 0분 0초다


EXTRACT (포맷 from 날짜) : 날짜에서 형식에 해당하는 값을 조회한다
                    형식 :  YEAR , MONTH , DAY , HOUR ,

LAST_DAY (날짜) : 지정된 날짜를 기준으로 해당 월의 마지막 일자를 반환

NEXT_DAY(날짜 , 요일) : 지정된 날짜를 기준으로 앞으로 다가올 날짜중에 요일에 해당하는 날짜를 반환한다


*/

select SYSDATE , SYSTIMESTAMP from dual;

select sysdate , -- 오늘
       add_months(sysdate,1) , -- 1달후
       add_months(sysdate,2) , -- 2달후
       add_months(sysdate , 3) -- 3달후
from dual;

--  오늘이 12월 31일이라면 , 2달후의 날짜를 조회하면 2.28 혹은 2.29 로 반환됨
select add_months('2023/12/31' , 2) from dual;

-- 시스템의 현재 일자와 시간 정보에서 년 월 일 시 분 초 조회하기
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(day FROM SYSDATE),
       EXTRACT(hour FROM SYSTIMESTAMP),
       EXTRACT(minute FROM SYSTIMESTAMP),
       EXTRACT(second FROM SYSTIMESTAMP)
from dual;


-- 현재 일자가 속한 월의 마지막 일자 조회하기
select LAST_DAY (SYSDATE),
       LAST_DAY ('2024/01/01'),
       LAST_DAY ('2024-02-01')
from dual;

-- 현재 일자를 기준으로 다음 월요일을 조화ㅣ
select NEXT_DAY(sysdate , '월요일') from dual;


select MONTHS_BETWEEN(sysdate,'2023-03-11') from dual;

select SYSDATE +1
from dual;

-- 현재 일자를 기준으로 1일후 3일후 7일후 10일후  , 7일전 3일전 날짜 조회하기
select SYSDATE +1,
       SYSDATE + 3 , -- 3일후
       SYSDATE + 7, -- 7일후
       SYSDATE + 10 -- 10일후
           SYSDATE -7, -- 7일전
        SYSDATE -3 -- 3일전
from dual;

select TRUNC(SYSDATE) - 3 ,TRUNC(SYSDATE)
from dual;

select ADD_MONTHS(TRUNC(SYSDATE),-1 ) ,TRUNC(SYSDATE)
from dual;

-- 지정된 날짜를 기준으로 7일전 날짜 조회하기
select TRUNC(TO_DATE('2023/12/01')) -7
from dual;

-- 지정된 날짜 기준 1달전 , 1달후 날짜 조회
select add_months(TO_DATE('2023/12/01'),-1),
       add_months(TO_DATE('2023/12/01'), 1)
from dual;

-- 오늘 기준 7일전 날짜 조회
select TRUNC(SYSDATE) -7
from dual;

-- 오늘 기준 한달전 날짜조회
select ADD_MONTHS(TRUNC(SYSDATE),-1)
from dual;



-- 오늘 기준 7일동안의 주문내역 조회 (오늘은 포함 되지않음)
select *
from orders
where order_date >= trunc(SYSDATE) -7 and order_date < trunc(sysdate);



select SYSDATE,
       SYSDATE + 1/24,  -- 1시간후
       SYSDATE + 3/24, -- 3시간후
       SYSDATE + 6/24, -- 6시간후
       SYSDATE + 9/24, -- 9시간후
       SYSDATE + 12/24 -- 12시간후
from dual;


/*
문자 -> '날짜'    to_date()
'날짜' -> 문자:  ' '
숫자 -> 문자    to_char()
문자 -> 숫자    to_number()

*/

/*
변환 함수

    묵시적 변환
            변환함수를 사용하지 않아도 데이터의 타입이 자동으로 변화하는 것이다.
            문자 -> 날짜 : '문자'가 유효한 날짜 형식의 문자인 경우 날짜로 변경된다
            문자 -> 숫자 : '문자'가 숫자로만 구성되어 있으면 숫자로 변경된다

    select
    from employees
    where hird_date >= '2005/01/01' and hire_date<'2005/07/1' ;

    * 위 SQL에서 HIRE_DATE가 DATE 타입 컬럼이기 때문에 '2005/01/01'문자가
    DATE 타입의 값으로 자동 변환
    '2005/01/01' 이나 '2005-01-01' 형식인 경우 자동으로 변환

    select *
    from employees
    where deparatment_id = '10';

    DEPARTMENT_ID가 number 타입의 컬럼이기 때문에 '10'문자가 number 타입의 값으로 자동으로 변환





    명시적 변환
        변환 함수를 사용해서 '문자' <--> 날짜 , '문자' <--> 숫자간의 데이터 변환을 하는것
        TO_DATE('날짜 형식의 문자열' , '패턴')
        예시) TO_DATE('2023/01/01')
        * 문자열이 날짜형식의 텍스트이기 때문에 패턴을 지정하지 않아도 DATE 타입으로 변환된다

        TO_DATE('20230101','YYYYMMDD')
        * 문자열이 일반적이니 날짜 형식이 아닌 경우에는 패턴을 지정해야 한다
*/
select TO_DATE('2023/03/01'),
       TO_DATE('20230301'),
       TO_DATE('2023 01 01')
from dual;


-- 날짜를 문자로 변환하기
select TO_CHAR(SYSDATE,'YYYY'),
       TO_CHAR(SYSDATE,'MM'),
       TO_CHAR(SYSDATE,'DD'),
       TO_CHAR(SYSDATE,'DAY'),
       TO_CHAR(SYSDATE,'AM'),
       TO_CHAR(SYSDATE,'HH'),
       TO_CHAR(SYSDATE,'HH24')
from dual;


-- 직원 테이블에서 2005년도에 입사한 직원의 아이디 이름 입사일자 조회
select employee_id , first_name , hire_date
from employees
where TO_CHAR(hire_date , 'YYYY') = '2005';


select employee_id , first_name, hire_date
from employees
where hire_date >= '2005-01-01' and hire_date < '2006/01/01';



-- 숫자를 , 가 포함된 문자로 변환
select TO_CHAR(100000,'999,999')
from dual;

-- 문자를 숫자로 변환
select TO_NUMBER('10000'),TO_NUMBER('100,000','999,999')
from dual;