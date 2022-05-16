/******(여러줄 주석)******
select 문 
    select 절
    froma 절
    where 절
    order by 절
*************************/

--(한줄주석)모든 컬럼 조회하기
select *  --(*)모든 컬럼명
from employees;

select *
from departments;

-------------------------------------------------------------------------------

--원하는 컬럼만 조회하기
select employees_id, 
       first_name, 
       last_name
from employees;

--예제1)
--사원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name,     --이름
       phone_number,   --전화번호
       hire_date,      --입사일
       salary          --연봉
from employees;

--예제2)
--사원의 이름(fisrt_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select  first_name   --이름
       ,last_name    --성
       ,salary       --급여
       ,phone_number --전화번호
       ,email        --이메일
       ,hire_date    --입사일
from employees;

--출력할때 컬럼명 별명 사용하기
--사원의 이름(fisrt_name)과 전화번호 입사일 금여 로 표시되도록 출력하세요
select  first_name   "이름"
       ,phone_number "전화번호"
       ,hire_date    "입사일"
       ,salary       "금여"
from employees;

select * from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 
--입사일로 표시되도록 출력하세요
select first_name as 이름, -- as="" 같은 역할(생략도 가능)
       last_name 성,
       salary "Salary",
       phone_number "hp", -- "" 소문자 출력 가능해짐(있는 그대로 출력)
       email "이 메 일",   -- 공백도 가능
       hire_date
from employees;

-------------------------------------------------------------------------------

--연결연산자(커럼을 붙이기)
select first_name, --이름
       last_name   --성
from employees;

--||합치기 ' '합치기 사이에 몬가 넣을때 사용
select first_name || ' ' || last_name 
from employees;

select first_name || ' hire date is ' || hire_date 입사일
from employees;

-------------------------------------------------------------------------------

--산술 연산자
select first_name, 
       salary, 
       salary*12,
       (salary+300)*12
from employees;


--예제1)오류를 찾아보세요
/*
select job id*12 _바를 안붙였다 문자를 곱할수없다
from employees;
*/

--예제2)전체직원의 정보를 다음과 같이 출력하세요
--성명(first_name last_name) 성과 이름사이에 _로 구분 급여 연봉(급여*12) 
--연봉2(급여*12+5000) 전화번호
select first_name || ' _ ' || last_name 성명,
       salary 급여,
       salary*12 연봉,
       salary*12+5000 연봉2,
       phone_number 전화번호
from employees;

-------------------------------------------------------------------------------

/*where절 (조건을 붙일수있다?)*/
select first_name
from employees
where department_id = 10;

--예제)
--연봉이 15000이상인 사원들의 이름과 월급을 출력하세요
select first_name 이름,
       salary 월급
from employees
where salary >= 15000;

--07/01/01일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name 이름, 
       hire_date 입사일 
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary 연봉
from employees
where first_name >= 'Lex';

-------------------------------------------------------------------------------

--조건이 2개이상 일때 한꺼번에 조회하기 (and연상자 - 둘다 or연상자 - 하나만)
--연봉이 14000이상 17000이하인 사원의 이름과 연봉을 출력하세요
select first_name 이름,
       salary 연봉
from employees
where salary >= 14000 
    and salary <= 17000;

--연봉이 14000이하 17000이상인 사원의 이름과 연봉을 출력하세요
select first_name 이름,
       salary 연봉
from employees
where salary <= 14000
    or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name 이름,
       hire_date 입사일
from employees
where hire_date >= '04/01/01'
    and hire_date <= '05/12/31';

--BETWEEN 연산자로 특정구간 값 출력하기 - 교집합인경우 사용 가능
select first_name,
       salary
from employees
where salary BETWEEN 14000 and 17000;

-------------------------------------------------------------------------------

--IN 연산자로 여러 조건을 검사하기
select first_name,
       last_name,
       salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name,
       last_name,
       salary
from employees
where first_name = 'Neena'
    or first_name = 'Lex'
    or first_name = 'John';
    
--예제)
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name 이름,
       salary 연봉
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name 이름,
       salary 연봉
from employees
where salary = 2100
    or salary = 3100
    or salary = 4100
    or salary = 5100;
    
-------------------------------------------------------------------------------

--Like 연산자로 비슷한것들 모두 찾기  % = 뭐가있든 상관없다 _ = 자리수를 나타낼수있다
select first_name, 
       last_name, 
       salary
from employees
where first_name like 'L%'; --뒤에는 상관없고 앞이 L인것

select first_name, 
       last_name, 
       salary
from employees
where first_name like '%s'; --앞은 상관없고 맨뒤에 s인것

select first_name, 
       last_name, 
       salary
from employees
where first_name like '%s%'; --s있는건 다

select first_name, 
       last_name, 
       salary
from employees
where first_name like 'L___'; --몇자

--예제)
--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where first_name like '%am%'; 

--이름의 두번째 글자가 a인 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_';

-------------------------------------------------------------------------------

select first_name,
       salary,
       commission_pct,
       salary*commission_pct 
from employees
where salary between 13000 and 15000;

--수당 없는사람 null
select first_name,
       salary,
       commission_pct,
       salary*commission_pct 
from employees
where commission_pct is null;

--수당 있는사람 
select first_name,
       salary,
       commission_pct,
       salary*commission_pct 
from employees
where commission_pct is not null;

--예제)
--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null 
    and commission_pct is null;

-------------------------------------------------------------------------------
    
select first_name,
       salary
from employees
where salary >= 10000;

--order by 절을 사용해 보기 좋게 정렬하기 (desc 내림차순 큰->작 asc 오름차순 작->큰)
select first_name,
       salary
from employees
order by salary desc;

select first_name,
       salary
from employees
order by salary asc;

--급여가 9000이상인 사람만 
select first_name,
       salary
from employees
where salary >= 9000
order by salary asc;
 
--예제)
--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc;

--급여가 10000이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name,
       salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 
--부서번호 급여 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc, salary desc, first_name asc;

-------------------------------------------------------------------------------
/*
단일행 함수
*/
--문자함수 - INITCAP (컬럼명) 첫글자 대문자
--부서번호 100인 직원의 이메일주소와 부서번호를 출력하세요
select email, 
       initcap(email) "email2", 
       department_id
from employees
where department_id = 100;

--문자함수 - LOWER(컬럼명)소문자 / UPPER(컬럼명)대문자
select first_name,
       upper(first_name) upper,
       lower(first_name) "lower"
from employees
where department_id = 100;

--문자함수 - SUBSTR(컬럼명, 시작위치, 글자수)
select first_name,
       substr(first_name, 1, 4),
       substr(first_name, -3, 2) --(-)뒤에서부터 세어옴
from employees
where department_id = 100;

--문자함수 
-- LPAD(컬럼명, 자리수, '채울문자')왼쪽공백 / RPAD(컬럼명, 자리수, '채울문자')오른쪽공백
select first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
       --rpad(lpad(first_name, 10, '*'), 10, '*')
from employees;

--문자함수 - REPLACE(컬럼명, 문자1, 문자2) 문자 바꾸기
select first_name,
       replace(first_name, 'a', '*'),
       substr(first_name, 2, 3),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

-------------------------------------------------------------------------------

--테스트용 dual 가상테이블
select replace('abcdefg', 'bc', '*****')
from dual;

select substr('900214-1234234', 8, 1)
from dual;

-------------------------------------------------------------------------------

/*
숫자함수
*/
--숫자함수 - ROUND(숫자, 출력을 원하는 자리수) 마지막수 반올림해서 표기 -올라가서 반올림
select round(123.355, 2) r2, 
       round(123.456, 0) r0,
       round(124.456, -1) "r-1"
from dual;

--숫자함수 -TRUNC(숫자, 출력을 원하는 자리수) 버리고 출력
select trunc(123.565, 2) r2,
       trunc(123.456, 0) r0,
       trunc(123.456, -1) "r-1"
from dual;

-------------------------------------------------------------------------------

/*
날짜함수
*/
--날짜함수 -SYSDATE()
select sysdate --오늘 날짜
from dual;

select months_between(sysdate, hire_date)
from employees
where department_id = 110;

-------------------------------------------------------------------------------

/*
변환함수
*/
--변환함수 -TO_CHAR(숫자, '출력모양') 숫자형->문자형으로 변환하기 
select first_name,
       to_char(salary*12, '$099999')
from employees
where department_id = 110;

--fmt(출력모양) 나타내는 방법 9를 기호로 사용
select to_char(9876, '99999'),
       to_char(9876, '099999'),
       to_char(9876, '$99999'),
       to_char(9876, '9999.99'),
       to_char(987654321, '999,999,999')
from dual;

--변환함수 -TO_CHAR(날짜, '출력모양') 날짜->문자형으로 변환하기
select sysdate,
       to_char(sysdate, 'YYYY-MM-DD'),
       to_char(sysdate, 'HH24:MI:SS'),
       to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),  
       to_char(sysdate, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"'),
       to_char(sysdate, 'YYYY'),  --년도
       to_char(sysdate, 'YY'),    --년
       to_char(sysdate, 'MM'),    --월
       to_char(sysdate, 'MONTH'), --n월
       to_char(sysdate, 'DD'),    --일
       to_char(sysdate, 'DAY'),   --요일
       to_char(sysdate, 'HH24'),  --시
       to_char(sysdate, 'MI'),    --분
       to_char(sysdate, 'SS')     --초
from dual;