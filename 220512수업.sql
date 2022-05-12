--<220512 17번째 수업>

-- 퀴즈) emp 테이블에서 [사원이름, 사원번호, 이름에 A가 있으면 'A팀' 없으면 'B팀']으로 표시하시오. 

-- 방법 1) case문 (like 연산자 사용)
select ename, empno, case when ename like '%A%' then 'A팀'
                          else 'B팀'
                     end
from emp;

-- 방법 2) case문 (instr() 함수 사용)
select ename, empno, case when instr(ename, 'A') > 0 then 'A팀'
                          else 'B팀'
                     end
from emp;
 
-- 방법 3) decode 사용
select ename, empno, decode(instr(ename, 'A', 1, 1), 0, 'B팀', 'A팀') -- 시작위치 1, A를 처음 만나는 것
from emp;



-- 문제) emp 테이블에서 [사원이름, 급여, 급여가 2700보다 크거나 같으면 'A팀', 2700 미만은 'B팀']으로 조회하시오. 

-- 방법 1) case 사용
select ename, sal, case when sal >= 2700 then 'A팀'
                        else 'B팀'
                   end
from emp;

-- 방법 2) decode & trunc() 사용
select ename, sal, decode(trunc(sal/2700), 0, 'B팀', 'A팀') -- 조건을 반대로 줘서 0일 때 'B팀' 나머지는 'A팀'으로 주기
from emp;

-- 방법 3) decode & sign() 사용
select ename, sal, decode(sign(sal-2700), -1, 'B팀', 'A팀') -- sign 함수 : 양수면 1, 음수면 -1, 0이면 0
from emp;

-- 그룹함수(=집계함수)
select lower(ename) from emp; -- *단일행 함수* / lower : 소문자로 바꾸는 함수 (*단일행 함수이다!!*)
select max(ename) from emp;  -- *그룹함수*

-- ** 그룹(집계)함수의 특징
-- 여러 튜플을 묶어서 처리함. 별도의 지정이 없으면 table 전체를 하나의 주머니(=봉투)로 묶어서 처리함. 
select min(ename), sum(sal), min(hiredate)
from emp;
