-- 왼쪽 끝, 오른쪽 끝에 나오는 특정문자(공백) 제거 시 
--앞쪽, 뒷쪽 공백 제거 함수 : trim 
--ltrim(대상, 제거할 문자)
--rtrim(대상, 제거할 문자)

select ename, ltrim(ename, ' ') -- 왼쪽에 공백이 있으면 지워라
from emp;

select ename, ename, rtrim(ename, 'H') -- 오른쪽에 H가 있으면 지워라
from emp;

select ename, ename, rtrim(ename, 'T') -- *SCOTT는 두 개 T 다 지워짐*
from emp;

-- 양쪽 끝에 나오는 지정된 문자 제거 시
select ename, trim('' from ename) from emp

-- 특정 문자열을 다른 문자열로 변겅
-- replace(대상, 찾을 문자열, 변경할 문자열)
select ename, replace(ename, 'SC', '*?') from emp; -- SC를 *?로 바꿔줌. ****
select ename, translate(ename, 'SC', '*?') from emp; -- S는 *로, C는 ?로 바꿔줌. *** 수행 ***

-- 지정한 문자가 어느 위치에 나오는지 알려주는 함수
-- instr(대상, 찾을 문자열 검색, 시작위치, 횟수)
select ename, instr(ename, 'A', 1, 1) from emp; -- (ename, 'A', 0, 1) 시작위치에 0을 쓰면 안된다***
-- instr('A', 1, 2) 로 바꾸면 ADAMS만 결과가 3이 나온다. ***

--퀴즈) k-리그
--player_t 선수 중에서 이름이 1글자, 3글자가 아닌 선수들의 이름을 아래 형태로 나오도록 출력하시오.
--이름 첫글자**두번째 글자부터 남은 글자 출력
--예) 사사 ==> 사**사, 우르모브 ==> 우**르모브

select player_name, substr(player_name, 1, 1) || '**' || substr(player_name, 2) -- substr(player_name, 0, 1) substr은 0이 들어가도 상관없다.
from player_t
--where length(player_name) != 1 and length(player_name) != 3
where length(player_name) not in (1, 3); -- 이름이 한 글자 이거나, 세 글자가 아닌 선수이름 출력

--where player_name[1] and player_name[2];
--where concat(substr(player_name,1,2),':',substr(player_name,3,2))

--컬럼은 두 개
select ename, job from emp;
select concat(ename, job) from emp; -- 확장 불가능 2개의 컬럼만 연결할 수 있음. 
select ename || ' ' || job  || ' ' || sal from emp; -- 확장 가능

select ename, '홍길동' from emp;

--듀얼 테이블
desc dual;
select * from dual;
select '홍길동' from emp;
select '홍길동' from dual;
select sysdate from emp;
--오라클은 관계형 연산자
--관계형 연산자는 테이블로 연산됨. 
--select와 from은 필수이다. 

select initCap('choi') from dual;

select substr(' I am here with you', 6) from dual
select substr('I am here with you', 1, 6) from dual

select 'a', 'A' from dual;
select ascii('a'). ascii('A') from dual;

-- 퀴즈) k-리그
--1) player_t에서 영문이름에 E가 4번 이상 나오는 선수들의 이름, 영문이름을 조회하시오.

--방법1)
select player_name, e_player_name
from player_t
where e_player_name like '%E%E%E%E%';

--where e_player_name == 'k' and e_player_name >= '4'
----if e_player_name == k and e_player_name >= 4
--if e_player_name == 'k' 

--방법2)
--instr(대상, 찾을 문자여려 검색, 시작 위치, 횟수)
select player_name, e_player_name
from player_t
--where instr(e_player_name, 'E', 1, 4) != 0;
where instr(e_player_name, 'E', 1, 4) > 0;
