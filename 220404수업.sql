--count 함수
select count(*) from emp; -- *의 의미는 '모든 것', 즉 null도 count하라는 뜻
select count(*), count(comm) from emp;

select count(*) from player_t;
select count(*), count(e_player_name) from player_t;

--emp table에서 급여를 제일 많이 받는 사람
select count(*), max(sal) from emp;

select * from emp;

select count(*), min(sal) from emp;

select count(*), sum(sal) from emp;

-- 소수점 지우기
select count(*), trunc(avg(sal)) from emp;

select count(*), max(height) from player_t;

--count() 안에 *을 쓰면 null 값까지 counting하고, 
-- *이 아니라 컬럼명을 쓰면 null이 아닌 값만 찾음

--집계함수( = 집단함수)
select count(*), max(sal), min(sal), sum(sal), avg(sal) from emp;

--집계함수는 자기들끼리만 쓴다. (select 행에 집단함수 쓰면, 단일 함수 못들어감) 
--select 행에 집계함수가 들어가면 단일함수는 못 들어간다. 


-- 부서별로 counting 하기 (group by 사용)
select deptno, count(*) -- 3순위
from emp -- 1순위
group by deptno -- 2순위
order by deptno;

-- ** group by 다음에 나와있는 것은 쓸 수 있다. ***
--group by에 쓴 값만, select에 쓸 수 있다. 
--또, order by는 모든 구문에 쓸 수 있다. 

select * from emp;

select job, count(*)
from emp
group by job
order by 1;

-- smith가 일하는 부서 이름
select ename, deptno
from emp
where ename='SMITH';

select deptno, dname
from dept
where deptno = 20;

select ename, deptno
from emp
where ename='SCOTT';

-- 데이터베이스에 이상현상 -> 심각한 오류

select * from dept;
select * from locations;


--부서별로 최대 급여, 최소 급여를 받는 사람 출력
select deptno 부서번호, max(sal) 부서별최대급여, min(sal) 부서별최소급여 -- 4
from emp -- 1
group by deptno -- 2
-- * 만약 where절을 쓴다면 where절이 먼저 실행된다
order by deptno; -- 3


select max(sal) 전체최고급여, min(sal) 전체최소급여  -- 2
from emp;    











