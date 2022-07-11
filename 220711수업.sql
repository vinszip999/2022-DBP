--<220711 27번째 수업>

-- (문제) 본인의 상사보다 급여를 더 많이 받는 사원이름, 사원급여, 상사이름, 상사급여를 조회하시오. (self 조인)
select s.ename 사원이름, s.sal 사원급여, m.ename 상사이름, m.sal 상사급여
from emp s, emp m -- 셀프 조인 
where (s.mgr = m.empno) and -- 조인 조건
        (s.sal > m.sal); -- 문제를 해결하기 위한 조건    


-- (문제) 급여를 2300 보다 많이 받는 사원의 이름, 급여, 부서명, 근무지, 급여등급을 조회하시오. 

select * from tab;

select e.ename, e.sal, d.dname, l.city, s.grade
from emp e, dept d, locations l, salgrade s
where (e.deptno = d.deptno) and -- 조인 조건 (공통된 속성 : 외래키 (현재는 dept))
        (d.loc_code = l.loc_code) and -- 조인 조건
        (e.sal between s.losal and s.hisal) and -- 조인 조건    
        (e.sal > 2300); -- 문제를 해결하기 위한 조건


-- (문제) 부서원들의 급여합계, 소속인원수를 조회하시오.
select deptno, sum(sal), count(*) 
from emp
group by deptno
order by deptno;


-- (문제) 부서별 부서원들의 급여합계, 소속인원수를 조회하시오. 
-- (단, 소속사원이 없더라도 모든 부서명이 나올 수 있도록 조회하시오.)
select d.dname, sum(e.sal), count(ename) -- count(*)은 null값도 숫자로 세기 때문에 ename으로 바꿔줌. 
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname
order by 1;
