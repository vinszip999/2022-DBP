--<220707 26번째 수업>

-- (문제) 사원의 이름과 그 사원의 상사 이름을 조회하시오. 

-- self 조인 : 자기 자신의 테이블과 조인하는 경우
select s.ename 사원이름, m.ename 상사이름
from emp s, emp m
where s.mgr = m.empno;

-- 상사가 없는 직원도 모두 출력하세요. : left outer join (오른쪽에 + 붙임)
select s.ename 사원이름, m.ename 상사이름
from emp s, emp m
where s.mgr = m.empno(+); -- left outer 조인!!

-- 부하직원이 없는 직원도 모두 출력하세요. : right outer join (왼쪽에 + 붙임)
select s.ename 사원이름, m.ename 상사이름
from emp s, emp m
where s.mgr(+) = m.empno; -- right outer 조인!!


-- 테이블 지우기
delete from emp
where empno = 9999;


-- (문제) 사원이름에 'S'가 들어있는 사원의 이름, 급여, 급여등급을 조회하시오. 

-- (방법 1)
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal >= s.losal and e.sal <= s.hisal) and -- 조인 조건
        e.ename like '%S%'; -- 문제를 해결하기 위한 조건

-- (방법 2) between 연산자를 사용
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal between s.losal and s.hisal) and -- 조인 조건
        e.ename like '%S%'; -- 문제를 해결하기 위한 조건

-- (방법 3) instr 연산자를 사용
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal between s.losal and s.hisal) and -- 조인 조건
        instr(e.ename, 'S', 1, 1) > 0; -- 문제를 해결하기 위한 조건


-- (참조) player_t에서 영문 이름에 _ 문자가 포함된 선수이름, 영문이름을 조회하시오. 

-- (방법 1) escape 사용
select player_name, e_player_name
from player_t
where e_player_name like '%$_%' escape '$'; -- $ 기호는 의미 없음!

-- (방법 2) instr 사용
select player_name, e_player_name
from player_t
where instr(e_player_name, '_', 1, 1) > 0;


-- (문제) 급여 등급이 4등급인 사원의 이름, 급여, 급여등급, 부서명을 조회하시오. 
select e.ename, e.sal, s.grade, d.dname
from emp e, dept d, salgrade s
where (e.deptno = d.deptno) and -- 조인 조건1
        (e.sal between s.losal and s.hisal) and -- 조인 조건2
        s.grade = 4; -- 문제를 해결하기 위한 조건


-- (문제) 입사일자가 1981년 11월 20일 오후 3시 17분 20초 이후에 입사한 사원들의 이름, 입사일, 상사이름, 상사의 입사일자를 조회하시오. (self 조인)
select s.ename 사원이름, s.hiredate 입사일, m.ename 상사이름, m.hiredate 상사입사일
from emp s, emp m
where (s.mgr = m.empno) and -- 조인 조건
        (to_date('1981-11-20:15:17:20', 'yyyy-mm-dd:hh24:mi:ss') <= s.hiredate); -- 문제를 해결하기 위한 조건
