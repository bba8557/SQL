/***************************
*       계정관리(DCL)
***************************/
--system 계정으로 작업해야함
--계정 만들기
create user webdb identified by 1234;

--권한설정
grant resource, connect to webdb;

--계정 비밀번호변경
alter user webdb IDENTIFIED BY webdb;

--계정 삭제
drop user webdb cascade;

-----------------------------------------------------------------

create user webdb identified by webdb;
grant resource, connect to webdb;

/**********************************
*       테이블관리(DDL)
**********************************/

--테이블 생성 ( 컬럼명    자료형 )
create table book(
    book_id  number(5),
    title    varchar2(50),
    author   varchar2(10),
    pub_date date
);

--수정 자료형 변경
alter table book modify(title varchar2(100));

--수정 컬럼명 변경
alter table book rename column title to subject;

--수정 타이틀명 변경
rename book to article;

--추가
alter table book add(pubs varchar2(50));

--삭제
drop table article;

--조회
select *
from article;


