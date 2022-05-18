--rownum

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--급여순으로 정렬
select employee_id,
        first_name,
        salary
from employees
order by salary desc;

--1~5등만 출력
--rownum 가 먼저 적용 desc는 나중에 적용 되기에 순서가 깨진다
select rownum, 
       employee_id,
       first_name,
       salary
from employees
order by salary desc;

select rownum, --번호가 부여되도 깨지지않는다
       ot.employee_id,
       ot.first_name,
       ot.salary,
       ot.phone_number --추가시 사용 가능
       --ot.phone_number 테이블에 추가가 되지 않았기에 쓸수 없다
from (select employee_id, --하나로 묶어줘서 정렬
       first_name,
       salary,
       phone_number
       from employees
       order by salary desc) ot
where rownum >= 1
and rownum <= 5;

--꼭 1번이 아니라도 출력 가능하게 
select ort.rn,
       ort.employee_id,
       ort.first_name,
       ort.salary
from (select rownum rn,
             ot.employee_id,
             ot.first_name,
             ot.salary
      from (select employee_id,
                   first_name,
                   salary
            from employees
            order by salary desc) ot 
      ) ort
where rn >= 1
and rn <= 5;

--예제) 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
--07년 입사한 직원들 급여 많은순
select first_name,
       salary,
       hire_date
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc;

--3~7등
select hsr.rn,
       hsr.employee_id,
       hsr.first_name,
       hsr.salary,
       hsr.hire_date
from (select rownum rn,
             hs.employee_id,
             hs.first_name,
             hs.salary,
             hs.hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc) hs 
      ) hsr
where hsr.rn >= 3
and hsr.rn <= 7;

