--select *
--from book
--where title like '%태백산맥';

--퀴즈) K-리그
--1) 이름 2번째 글자가 '수'인 선수들의 이름과 영문이름을 조회하시오.
select player_name, e_player_name
from player_t
--where player_name like '_수%';
--내 오답> _수_ 가 아닌, _수%로 해주어야 한다**
where player_name like '_수_';

desc player_t;
--2) 이름이 두 글자인 선수들만 이름과 영문이름을 조회하시오.
select player_name, e_player_name
from player_t -- 실행순서 1번째
where player_name like '__'; -- 실행순서 2번쨰

--하나의 데이터베이스 안에는 무수히 많은 '테이블'들이 있다. 


--3) 영문이름에 'T' 문자가 포함된 선수들만 이름과 영문이름을 조회하시오. 
select player_name, e_player_name
from player_t
where e_player_name like '%T%';

--4) 영문이름에 '%' 문자가 포함된 선수들만 이름과 영문이름을 조회하시오.
select player_name, e_player_name
from player_t
--where e_player_name like '%'; -- 영문이름이 null 값이 아닌 모든 행(row, 레코드, 튜플)이 출력
where e_player_name like '%$%%' escape '$'; -- escape 문자 처리 '%$%%' 대신에 '%$_%' _ 도 써도 된다. (_가 들어간 이름 찾기)

where e_player_name like '%!_%' escape '$'; -- '$' 특수기호는 아무거나 상관없음. ***

--null : 현재까지 정해지지 않은 미정의 값을 의미함. 
--       null이 포함된 모든 연산결과는 null 값으로 처리됨. 

--사원이름, 급여, 현재 받은 보너스, 300달러 받은 보너스
select ename, sal, comm from emp;
select ename, sal, comm, NVL(comm, 0) + 300 from emp; -- 올해 수행평가에 나옴 **** NVL *****
--null이 포함된 연산값은 무조건 null이다.

--보너스 못 받는 사람들의 이름, 커미션 출력
select ename, sal, comm
from emp
where comm = null; -- 선택된 행이 없음, null 값은 연산할 수 없음. 
where comm is null; -- 선택된 행이 없음. null 값은 연산할 수 없음. 

select ename, sal, comm
from emp
where comm is not null;

--not 연산자

--사원의 이름, 급여, 입사한 날짜
select ename, sal, hiredate
from emp
--where sal <= 2000;
--where sal > 2000;
where sal not > 2000; -- 에러 발생 =, <, > 바로 앞에는 not 연산자 사용 불가

select * from emp; -- 테이블에 있는 모든 컬럼과 데이터 보여줌. 
