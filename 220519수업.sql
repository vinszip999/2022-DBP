--<220519 19번째 수업>

-- (문제) 키가 185보다 큰 선수들이 각 팀에 몇 명씩 있는가?
-- <나의 풀이>
select team_id, count(team_id)
from player_t
where height > 185
group by team_id
order by 1;

-- <선생님 풀이>
select team_id, count(player_id) --count(*), count(player_id) 또는 count(Not null인 컬럼 넣기)
--*기본키에는 null이 없음*
from player_t
where height > 185
group by team_id
order by 1; -- 어디에나 쓸 수 있지만, order by는 실행순서가 맨 마지막이다.


-- (문제) 키가 185보다 큰 선수를 7명 이상 보유한 팀의 team_id의 선수를 조회하시오. 
select team_id, count(team_id) -- count(player_name)도 가능!!
from player_t
where height > 185 and count(team_id) >= 7 -- 에러 발생 : 실행 순서주의
group by team_id
order by 1;

select team_id, count(player_name)
from player_t
where height > 185
group by team_id
having count(player_name) >= 7 -- 정상적으로 실행. 그룹함수 이용한 조건은 having절에서 처리함. 
order by team_id asc;


-- extract(추출정보 from 날짜 ) : 숫자만 표현 가능하며 년, 월, 일을 혼합해서는 사용할 수 없다. 
select extract(day from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(year from sysdate) from dual;


-- 사원테이블에서 전체사원들을 대상으로 그룹함수를 적용하시오. 
-- 전체사원, 최대급여, 최소급여, 급여합계, 급여평균
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp;


-- 이름에 'A'가 들어있는 사원들을 대상으로 그룹함수를 적용하시오. 
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp
where ename like '%A%';


-- 20번 부서의 사원들을 대상으로 그룹함수를 적용하시오. 
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp
where deptno like 20; 


-- 부서별 그룹함수를 적용하시오. 
select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
order by 1;


-- 부서별 그룹함수를 적용하시오. (단, 부서별 평균급여가 2000 이상만 나올것!)
select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
where avg(sal) >= 2000 -- 에러 발생 : 그룹함수는 where절에는 사용할 수 없다. 
group by deptno
order by 1;

select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000; -- 정상적으로 실행

select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000
order by deptno; -- 정렬 실행
