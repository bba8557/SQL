/*
기본 SQL 문제
*/
--문제1)
--정렬 입사일(hire_date)의 올림차순(asc) 가장 선임부터 출력
--이름(first_name last_name), 월급(salary), 전화번호(phone_number), 입사일(hire_date)
--컬럼이름 대체 "이름","월급","전화번호","입사일"
select first_name || ' ' || last_name 이름,
       salary 월급,
       phone_number 전화번호,
       hire_date 입사일
from employees
order by hire_date asc;

--문제2)
--최고월급(max_salary)의 내림차순(desc)로 출력
--업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)
select  job_id,
        job_title,
        max_salary
from jobs
order by max_salary desc;

--문제3)
--담당 매니저가 배정되있으나 커미션비율 없음, 월급 3000초과인 직원의 이름(first_name),
--매니저 아이디(manager_id),커미션 비율(commission_pct), 월급(salary)을 출력하세요
select first_name,
       manager_id,
       commission_pct,
       salary
from employees  
where manager_id is not null 
    and commission_pct is null
    and salary > 3000;
    
--문제4)
--최고월급(max_salary) 내림차순(desc)로 정렬하여 출력
--최고월급(max_salary) 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)
select job_title,
       max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;
      
--문제5)
--월급(salary) 내림차순(desc)로 정렬하여 출력 단,커미션퍼센트가 unll 이면 0으로 나타냄
--월급 14000 미만 10000 이상인 직원의 이름(first_name), 월급(salary),커미션퍼센트
select first_name,
       salary,
       replace(commission_pct, 'null', '0')
from employees
where salary < 14000
    or salary >= 10000
order by salary desc;

--문제6)
--부서번호가 10, 90, 100인 직원의 이름(first_name), 월급(salary), 
--입사일(hire_date),부서번호(department_id) 입사일은 1997-12 와 같이 표시
select first_name,
       salary,
       hire_date,
       department_id
from employees;

--문제7)
--이름(first_name)에 S 또는 s 가 들어가는 직원 이름(first_name),월급(salary)
select first_name,
       salary
from employees
where first_name like '%S%'
    and first_name like '%s%';

--문제8)
--전체 부서 출력 순서는 부서이름이 긴 순서, 내림차순(desc)
select *
from departments
order by department_id desc;

--문제9)
--지사가 있을것으로 예상되는 나라들을 나라이름을 대문자로 출력 올림차순(asc)로 정렬
select upper(country_name)
from countries
order by country_name asc;

--문제10)
--입사일이 03/12/31일 이전 입사한 직원의 이름,월급,전화번호,입사일 출력
--전화번호 545-343-3433 과 같이 출력
select first_name,
       salary,
       phone_number, 
       hire_date
from employees
where hire_date < '03/12/31';