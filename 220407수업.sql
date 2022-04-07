--<220407 수업>

select * from emp;
-- 문제) (부서별, 업무별) [사원수, 최초 입사자, 마지막 입사자]를 조회하시오. 
select deptno, job, count(*), min(hiredate), max(hiredate)
from emp
group by deptno, job
order by 1;


-- 문제) 전체 사원들의 평균 보너스를 구하세요. 
select avg(comm),            -- 4개의 행의 평균값을 구함. 
    -- 집계 함수가 아닌게 들어가서 오류가 난다. 
    trunc(avg(nvl(comm, o))) -- 14개 행의 평균값을 구함.  
from emp;


create table t1(
    coll number
);

insert into t1 values(1000);
insert into t1 values(1000);
insert into t1 values(2000);
insert into t1 values(2000);
insert into t1 values(null);
insert into t1 values(null);

select * from t1;

select count(*), count(coll), count(distinct coll) from t1;

drop table t1; -- table 날리기

-- 문제) 급여가 1000 이상인 사람들을 업무별(오름차순 정렬)로 나누어서 사원수, 최대급여, 최소급여를 구하시오. 
select * from emp;

select job, count(*), max(sal), min(sal)    -- 실행순서 4
from emp                                    -- 실행순서 1
where sal >= 1000                           -- 실행순서 2
group by job                                -- 실행순서 3
order by job ASC;                           -- 실행순서 5

-- 문제) 각 부서별로 'clerk'은 몇 명인지 조회하시오. clerk는 점원
select deptno, count(*)
from emp
where job = 'CLERK'
group by deptno
order by deptno; -- order by 1;

-- 문제) 보너스를 받지 않는 사원이 부서별로 몇 명인지 조회하시오. 
select deptno, count(*)
from emp
where comm is null
group by deptno
order by 1;


-- 문제) 5명 이상 근무하는 부서의 인원수, 최대급여, 최소급여를 구하시오. 
select * from emp;
desc emp;

--select empno, count(*), max(sal), min(sal)
--from emp
--where empno >= 5 
--group by empno
--order by 1;

select deptno 부서번호, count(*) 부서인원, max(sal) 최대급여 , min(sal) 최소급여    -- 실행순서 : 4
from emp                                        -- 실행순서 : 1
group by deptno -- 부서별로                      -- 실행순서 : 2
having count(*) >= 5                            -- 실행순서 : 3
order by 부서인원; -- deptno                           -- 실행순서 : 5


--문제) 최고급여와 최저급여의 차이가 500 이상인 업무를 조회하시오.
-- count(*) : 인원 수, 소속 인원
select job 업무, count(*) 소속인원, max(sal) 최대급여, min(sal) 최소급여, max(sal) - min(sal) 급여차
from emp
group by job -- 업무별로 나눔
--having 급여차 >= 500   -- 에러 발생, having 절에는 alias를 사용할 수 없다. 
having max(sal) - min(sal) >= 500
order by 소속인원; -- order by 절에는 alias를 사용할 수 있다.
