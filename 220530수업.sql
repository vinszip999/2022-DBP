--<220530 22번째 수업>

-- grouping : 원하는 값만 출력하고자 할 때 - *전체 결과만 출력*
select deptno, count(*), sum(sal)
from emp
group by deptno;

select deptno, count(*), sum(sal)
from emp
group by grouping sets(deptno, null);

select deptno, job, count(*), sum(sal)
from emp
group by grouping sets((deptno, job), null) -- (deptno, job) 그룹핑 후 전체 결과만 출력
order by deptno;

-- deptno 기준으로 전체 합계, job을 기준으로 전체 합계
select deptno, job, count(*), sum(sal)
from emp
group by grouping sets(deptno, job, null) -- deptno, job 각각 그룹핑 후 전체 결과만 출력
order by deptno;


select position 포지션, count(*) 소속인원
from player_t
where position is not null -- position 이 없는 사람은 제외
group by rollup(position);

-- (미완성)
select nvl(position, '전체인원') 포지션, count(*) 소속인원
from player_t
--where position is not null -- position 이 없는 사람은 제외
group by rollup(position);

select position, grouping(position), count(*)
from player_t
group by rollup(position);

select case when grouping(position) = 1 then '전체인원'
            else position
       end 포지션, count(*)
from player_t
group by rollup(position);


-- join(조인) 정리
select * from dept;

-- 마틴이 근무하고 있는 부서 이름 구하기
select ename, deptno
from emp
where ename = 'MARTIN';

select dname
from dept
where deptno = 30;
