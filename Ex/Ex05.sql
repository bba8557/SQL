/***********************
        SubQuery 
************************/

--subquery(단일행) 

--'Den' 보다 급여를 많은 사람의 이름과 급여는?
select first_name,
       salary
from employees
where first_name = 'Den'; --11000

select first_name,
       salary
from employees
where salary >= (select salary
                 from employees
                 where first_name = 'Den')
order by salary desc;

--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select first_name,
       salary,
       employee_id
from employees
--order by salary asc; --TJ 2100 50
where salary = (select min(salary)
                from employees);

--가장 작은 급여를 구한다
select min(salary)
from employees;

--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
--(1)평균 급여를 구한다
select avg(salary)
from employees;

--(2)
select first_name,
       salary
from employees
where salary <= (select avg(salary)
                 from employees)
order by salary asc;

----------------------------------------------------------------------------------
--subquery(다중행) 

--?? 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--110 12008
--110 8300

select salary
from employees
where department_id = 110;

select employee_id,
       first_name,
       salary
from employees
--비교
/*where salary = 12008
or salary = 8300;*/
--사용
where salary in (select salary
                 from employees
                 where department_id = 110);  --12008, 8300
