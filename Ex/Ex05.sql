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
