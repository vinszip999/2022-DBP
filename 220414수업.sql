--<220414 12번째 수업>

-- 문제) 부서번호가 10, 30번 부서의 부서번호, 급여 합을 조회하시오. 
select deptno, count(*), sum(sal)
from emp
--where deptno = 10 or deptno = 30
where deptno in (10, 30)
group by deptno
order by 1;
    

-- 문제) 매니저별 부하직원의 숫자를 출력하시오. 
-- (단, 부하직원이 2명 이상이 있는 매니저만 부하직원이 많은 순서대로 출력하시오.)
select mgr 매니저, count(*) 부하직원수
from emp
where mgr is not null
group by mgr
having count(*) >= 2
--order by count(*) desc;
--order by 2 desc;
order by 부하직원수 desc;


-- 문제) 급여가 2000 이상, 5000 이하인 사원들의 직업별 평균급여와 급여총합을 구하시오. 
-- 또한 직업별 급여 합이 6000 이상만 급여합이 높은 순으로 출력하시오. 
select job, count(*), trunc(avg(sal)), sum(sal)
from emp
--where sal >= 2000 and sal <= 5000
where sal between 2000 and 5000 -- where sal between a and b
group by job
having sum(sal) >= 6000
--order by 4 desc;
--order by count(*) desc;
order by sum(sal) desc;


-- dual 테이블
desc dual;
select * from dual;


-- 날짜 관련
select sysdate from dual;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
commit -- 테이블 날라감 방지


-- 1. 날짜 + 정수

-- 100일 구하기
select sysdate 오늘날짜, (sysdate + 100) 백일
from dual;

-- 다음날 구하기
select sysdate 오늘날짜, (sysdate + 1) 내일
from dual;

-- 현재 시간을 기준으로 한 시간 뒤가 나오도록 조회하시오. 
select sysdate, sysdate + 1/24
from dual;

-- 현재 시간을 기준으로 70분 뒤가 나오도록 조회하시오. 
select sysdate, sysdate + (70/(24*60))
from dual;

-- 현재 시간을 기준으로 5초 뒤가 나오도록 조회하시오. 
select sysdate, sysdate + (5/(24*60*60))
from dual;


-- 2. add_months(날짜, 개월수)
select sysdate, add_months(sysdate, 10)
from dual;


-- 3. 날짜 - 날짜
select ename, hiredate, trunc(sysdate - hiredate)
from emp

-- 태어난 후 몇일 지났는지 확인하기
to_date('2004-11-20', 'yyyy-mm-dd') -- to_date : string 타입을 date 타입으로 바꿔주는 함수

select '이유빈', trunc(sysdate - to_date('2004-11-20', 'yyyy-mm-dd'))
from dual;


-- 4. 두 날짜 사이에 몇 개월이 지났는지를 조회하시오. 
select ename, hiredate, trunc(months_between(sysdate, hiredate))
from emp;

-- 태어난 후 몇 개월이 지났는지 확인하기
select '이유빈', trunc(months_between(sysdate, to_date('2004-11-29', 'yyyy-mm-dd')))
from dual;


-- 5. 이번달의 마지막 날
select last_day(sysdate) from emp;

-- 태어난 달의 마지막 날 구하기
select last_day(to_date('2004-11-29', 'yyyy-mm-dd')) from emp;
