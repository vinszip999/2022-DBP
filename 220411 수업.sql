--<220401 11번째 수업>

-- 문제) 부서별로 사원의 마지막 입사일 및 최초 입사일을 조회하시오.
select deptno 부서번호, max(hiredate), min(hiredate)
from emp
group by deptno
order by 1;

-- 문제) 급여가 1000 이상인 사원들을 업무별로 나누어서 집계를 수행하세요. (사원수, 업무별 최대급여, 업무별 최소급여)
-- (단, 업무별 최소급여가 2,000 이상인 결과만 출력하도록 조회하시오.) 
select job 업무, count(*) 업무별사원수, max(sal) 업무별최대급여, min(sal) 업무별최소급여    -- 실행순서 5
from emp                                    -- 실행순서 1
where sal >= 1000                           -- 실행순서 2
group by job                                -- 실행순서 3
having min(sal) >= 2000                     -- 실행순서 4
order by job;                               -- 실행순서 6
--order by 1; -- 다 가능!!
--order by 업무; -- 다 가능!!

-- 문제) 커미션을 받지 않는 사원이 부서별로 몇 명인지 조회하시오. 
-- (단, 커미션을 받지 않는 사원이 3명 이상인 결과만 출력하시오.)
select deptno 부서번호, count(*)
from emp
where comm is null
group by deptno
having count(*) >= 3
--having comm >= 3
order by 1;

-- 문제) 부서별 인원 수를 구하시오. (단, 결과값에서 20번 부서는 제외하시오.)
-- <나의 풀이>
select deptno, count(*)
from emp
where deptno is not 20 -- is not이 아닌, <>를 써주어야 한다.  (!= 문법이 <>와 같다!)
group by deptno
order by 1;

-- (where, having 둘 다 사용할 수 있음)
-- where
select deptno, count(*)
from emp
where deptno <> 20
group by deptno
order by 1;

-- having
select deptno, count(*)
from emp
group by deptno
having deptno <> 20
order by 1;

-- <>가 제외, 없애는 것

-- 문제) 부서별 인원수를 구한 뒤 인원수가 5명 이상인 결과만 남기려고 한다. 
select deptno 부서번호, count(*) 부서별인원수
from emp
--where count(*) >= 5       -- 에러 발생, where절에는 집계함수를 사용할 수 없다.
group by deptno
having count(*) >= 5
order by 1; -- "order by deptno"를 써도 된다. 또는 "order by 부서번호"도 가능!! (실행순서가 제일 마지막이기 때문에 alias로 써도 된다!!)

-- 이 문제에서는 group by를 해야만 구할 수 있는 문제이고,
-- group by보다 whre이 우선순위가 더 빠르기 때문에, 이 문제에서는 where절을 쓰지 못한다. 
