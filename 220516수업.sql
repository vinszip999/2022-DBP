--<220516 18번째 수업>

-- ** 그룹(집계)함수의 특징
-- 1. 여러 튜플을 묶어서 처리함. 별도의 지정이 없으면 table 전체를 하나의 주머니(=봉투)로 묶어서 처리함. 
select min(ename), sum(sal), min(hiredate)
from emp;


-- 2. 그룹 함수 계산 시 null 값은 자동으로 제외됨. (단, count(*)는 null 값을 포함)
select count(empno), count(*), count(mgr), count(comm) -- mgr(매니저) 13이 나옴(null 빼고 계산)
from emp;

-- 그룹함수는 null 값은 자동으로 제외하고 처리함. 

-- 전체 사원의 평균 보너스 구하기
select avg(comm) from emp; -- null값 빼고 계산함

select avg(nvl(comm, 0)) -- null값을 0으로 바꿈
from emp;

select avg(comm) 결과1, avg(nul(comm, 0)) 결과2 from emp; -- 결과1과 결과2는 튜플의 count수가 다르므로 결과값이 다름.  

--전체 사원의 보너스 합
select sum(nvl(comm, 0)) 결과1, sum(comm) 결과2 from emp; -- 지금 상황에서는 nvl 함수를 쓸 필요가 없으므로, 결과2 연산이 더 좋음. 

-- 결과1은 모든 튜플의 값을 0으로 일일이 변환한 다음 총 합계를 구하므로, 성능이 떨어짐. 
-- 결과2는 null 값을 제외한 채 연산을 수행하므로, 속도가 빨라 성능이 좋음. 

-- * 즉, nvl() 함수는 꼭 필요할 때만 사용해야 한다. *


-- 3. 작은 그룹으로 분류해서 처리 시 group by(= 깃발) 절을 사용 

-- 부서별 급여 합계와 급여 평균
select deptno, sum(sal), avg(sal)
from emp
group by deptno; -- group by로 묶으면 select 절에는 그룹함수만 쓸 수 있음!!
--order by deptno; -- 1 (오름차순 정렬)

-- (문제) player_t 선수 중에서 키가 185보다 큰 선수의 이름과 키를 조회하시오. 
select player_name, height
from player_t
where height > 185; 

select  * from player_t;

-- (문제) player_t 선수 중에서 키가 185보다 큰 선수는 몇 명인가?
select count(player_id) -- player_id : 기본키 // 기본키 넣어주는 것이 가장 안전. 
from player_t
where height > 185;

-- (문제) 키가 185보다 큰 선수들이 각 팀에 몇 명씩 있는가?
select team_id, count(team_id)
from player_t
where height > 185
group by team_id
order by 1;
