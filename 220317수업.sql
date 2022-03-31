--<0317 수업> 시작

--emp 테이블에서 이름에 A가 들어가지 않는 사원의 이름, 급여, 입사날짜를 조회
--like, between, in 연산자는 바로 앞에도 not 연산자를 사용 가능함. 
select ename, sal, hiredate
from emp
where ename not like '%A%';

--퀴즈) K-리그
--선수들 중에서 키가 170보다 작거나, 195보다 큰 선수들만 이름, 키, 팀ID를 조회하시오. 
--(미만, 초과, or 사용)

--방법1)
select player_name, height, team_id
from player_t
where height < 170 or height > 195; 

--방법2) between 연산자를 이용
select player_name, height, team_id
from player_t
--where height between 170 and 195; -- 170 이상, 195 이하
where height not between 170 and 195; -- 170 미만, 195 초과


--포지션이 GK, MF, FW, DE, TC가 모두 아닌 선수들만 이름, 포지션, 팀ID를 조회

--방법1)
select player_name, position, team_id
from player_t
where position not like 'GK' and position not like 'MF' and position not like 'FW' and position not like 'DF' 
and position not like 'TC';

--방법2)
select player_name, position, team_id
from player_t
where position not in ('GK', 'MF', 'FW', 'DF', 'TC');

--방법3)
select player_name, position, team_id
from player_t
where not position = any ('GK', 'MF', 'FW', 'DF', 'TC'); -- any는 in과 같다.

--방법4)
select player_name, position, team_id
from player_t
where position != all('GK', 'MF', 'FW', 'DF', 'TC');


--영문이름에 T문자가 하나도 포함되지 않는 선수들만 이름, 영문이름을 조회하시오.

select * from player_t;

select player_name, e_player_name
from player_t
where e_player_name not like '%T%';

--포지션이 GK인 선수들 중에서 키가 192보다 크거나, 소속팀이 K10팀인 
--선수들의 이름, 키, 포지션, 팀ID를 조회하시오.
select player_name, position, height, team_id
from player_t
where position = 'GK' and (height > 192 or team_id = 'K10'); -- == 쓰지 않게 주의하기!!

--emp 사원 중에서 ename에 A 문자가 2번 이상 들어있는 사원의 이름을 출력하시오.
select ename
from emp
where ename like '%A%A%'; -- 와일드카드는 like로 하기


--emp 사원 중에서 A문자가 1번만 나오는 사원의 이름을 출력하시오.
select ename
from emp
where ename like '%A%' and ename not like '%A%A%';

select ename, sal from emp; -- 사원의 이름과 급여
-- smith가 제일 먼저 나오는 이유는 제일 처음에 insert 했기 때문이다.

select ename, sal from emp
--order by sal desc; -- 내림차순
order by sal asc; -- 오름차순


--이름순으로 내림차순 정렬
select ename, sal from emp
order by ename desc;

--정렬 시 null 값의 순서 확인
-- 오름차순 정렬 : 마지막에 출력
-- 내림차순 정렬 : 처음에 출력
select ename, sal, comm
from emp
--order by comm desc;
order by comm asc;

--내림차순 정렬이지만, 오름차순 정렬처럼 null 값을 마지막에 출력
from emp
order by comm desc nulls last;

--<못 들은 내용>
------------------------------
---- 오름차순 정렬이지만, 내림차순 정렬처럼 null 값을 처음에 출력
--select ename, sal, comm
--from emp
--order by comm asc nulls first;
--
---- 여러개 컬럼으로 정렬 시
--select ename, deptno, sal
--from emp
--order by deptno desc, sal asc;
--
--select ename, deptno, sal
--from emp
--order by deptno desc, sal desc;
--
---- 사원이름, 급여, 입사날짜를 최근에 입사한 사원이 먼저 나오도록 출력
--select ename, sal, hiredate
--from emp
--order by hiredate desc;
--------------------------------

-- alias(별칭)은 where절에서 사용할 수 없다, select는 이 쿼리에서 가장 마지막으로 실행되기 때문이다.
select ename 이름, sal 급여, sal * 12 연봉 -- 3
from emp -- 1
where sal*12 > 10000;
--where 연봉 > 10000; -- 2 에러 발생 : 실행 순서
----실행순서 때문에 where 절에 "연봉"을 못 쓴다.

select ename 이름, sal*12 연봉, 연봉 + 200 -- 에러 발생 : 같은 행에 위치
from emp;



select ename 이름, sal*12 연봉, (sal*12) + 200
from emp
where sal*12 > 10000
order by 연봉 desc;

order by sal*12 desc;
order by 2 desc; -- 선생님이 제일 많이 쓰시는 방법
order by 1 desc; -- 이름으로 내림차순 정렬









