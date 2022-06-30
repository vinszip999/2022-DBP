--<220630 24번째 수업>

-- 조인정리
select * from emp;
select * from dept;


select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;


-- 조인조건 : N개의 테이블을 조인하려면 N-1개의 조인조건이 필요하다. 
select * from emp;
select * from dept;
select * from locations;


-- 사원이름, 부서이름, 도시이름을 조회
select emp.ename, dept.dname, locations.city
from emp, dept, locations -- 속성 13개
where emp.deptno = dept.deptno and
      dept.loc_code = locations.loc_code;
      
-- alias 사용해서 간결하게 바꾸기
select e.ename, d.dname, l.city
from emp e, dept d, locations l
where e.deptno = d.deptno and
      d.loc_code = l.loc_code;


-- 문제) 업무(job)가 clerk인 사원들의 이름, 급여, 업무, 부서명(deptno)을 조회하시오. 
select e.ename, e.sal, e.job, d.dname
from emp e, dept d
where e.deptno = d.deptno and
      e.job = 'CLERK'; -- 문제를 해결하기 위한 조건이기 때문에 조인 조건은 아님. (현재 식에서 조인 조건은 하나)
      

-- 문제) 부서명이 SALES인 부서에 소속된 사원이름, 급여를 조회하시오. 
select e.ename, e.sal -- 중복이 있을 수도 있기 때문에 꼭 emp, dept인지 명시해주기!!
from emp e, dept d
where e.deptno = d.deptno and
      d.dname = 'SALES'; -- dname : 부서명

      
-- 문제) 부서번호가 30번 부서가 아닌 사원 중에서 급여를 1500보다 많이 받는 사원들의 
--         이름, 급여, 부서번호, 부서명, 근무도시를 조회하시오. 
select e.ename, e.sal, e.deptno, d.dname, l.city
from emp e, dept d, locations l
where e.deptno = d.deptno and
      d.loc_code = l.loc_code and
      e.deptno <> 30 and -- d.deptno도 상관없음 / !=, ^=
      e.sal > 1500; 
      

-- 사원별 급여등급 및 등급간 최저급여와 최고급여를 조회하시오. 
select * from tab;
select * from salgrade;

select e.ename, e.sal, s.grade, s.losal, s.hisal
from emp e, salgrade s
where e.sal >= s.losal and
      e.sal <= s.hisal;

-- (방법 1)      
select e.ename, e.sal, s.*
from emp e, salgrade s
where e.sal >= s.losal and
      e.sal <= s.hisal;
      
-- (방법 2)      
select e.ename, e.sal, s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
