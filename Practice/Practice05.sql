--문제1)
--조건)담당 매니저 배정 커미션비율 없음 월급 3000초과한 직원
--이름, 매니저아이디, 커미션 비율, 월급 출력
select first_name 이름,
       manager_id 매니저아이디,
       commission_pct 커미션비율,
       salary 월급
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000
order by salary desc;

--문제2) *보류(조건절,전화번호 변경)*
--조건)각 부서별 최고 급여 받는 사원
--조건1)조건절비교 방법, 급여 내림차순 
--조건2)입사일 2001-01-13 토요일 형식, 전화번호 515-123-4567 형식
--직원번호, 이름, 급여, 입사일, 전화번호, 부서번호 조회
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       to_char(hire_date, 'YYYY-MM-DD DAY') 입사일,
       phone_number 전화번호,
       department_id 부서번호
from employees
order by salary asc;

--문제3) *보류*
--조건)매니저별 담당직원들의 평균급여 최소급여 최대급여
--조건1)통계대상(직원) 2005년 이후(2005/01/01 ~ 현재)의 입사자
--조건2)매니저별 평균급여 5000이상만, 내림차순, 소수점 첫째짜리 반올림
--매니저 아이디, 매니저이름, 매니저별평균급여, 매니저별최소급여,매니저별최대급여
select manager_id
from employees;

--문제4)
--조건)부서가 없는 직원도 표시
--사원, 사번, 이름, 부서명, 매니저 이름
select e.employee_id,
       e.first_name,
       e.department_id,
       e.manager_id,
       m.first_name ManagerName
from employees e, employees m
where e.manager_id = m.employee_id;

--문제5)
--조건)2005년 이후 입사, 11번~20번쨰 직원들, 입사일 순서로 출력
--사번, 이름, 부서명, 급여, 입사일

--2005년 이후 입사자
select employee_id,
       first_name,
       department_id,
       salary,
       hire_date
from employees
where hire_date > '2005/12/31'
order by hire_date asc;

--11~20
select ort.rn,
       ort.employee_id,
       ort.first_name,
       ort.department_id,
       ort.salary,
       ort.hire_date
from (select rownum rn,
             ot.employee_id,
             ot.first_name,
             ot.department_id,
             ot.salary,
             ot.hire_date
      from (select employee_id,
                   first_name,
                   department_id,
                   salary,
                   hire_date
            from employees
            where hire_date > '2005/12/31'
            order by hire_date asc) ot
      ) ort
where ort.rn >= 11
and ort.rn <= 20;

--문제6) *보완필요*
--조건)가장 늦게 입사한 직원
--이름, 연봉, 부서명
select e.first_name || last_name 이름,
       e.salary 연봉,
       d.department_name 부서이름,
       e.hire_date       
from employees e, departments d
where hire_date > '08/04/20'
and d.department_name = 'Sales';

--문제7)
--조건)평균 연봉이 가장 높은 부서의 직원들
--직원번호, 이름, 성, 업무, 연봉

--평균연봉이 높은 부서
select *
from employees;

--문제8)
--평균 급여가 가장 높은 부서

--문제9)
--평균 급여가 가장 높은 지역

--문제10)
--평균 급여가 가장 높은 업무