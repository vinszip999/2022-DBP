-- <220425 16번째 수업>
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- 매 수업 전 실행하고 진행하기! (날짜 format 바꾸기)

-- 문제) K-리그의 모든 선수들의 올해 생일이 무슨 요일인지 조회하시오. 
select player_name, birth, to_char(to_date('2022' || to_char(birth, 'mmdd'), 'yyyymmdd'), 'day')
from player_t
where birth is not null; -- 생일이 있는 사람들만 나오게

-- 유용한 함수 정리
-- 1. nvl(비교대상, null일 때 지정값) : null 값을 다른 값으로 변경해주는 함수
select ename, sal, comm, nvl(comm, 0) + 100
from emp;

select ename, sal, comm, sal + comm -- null 값에 더하면 결과 값도 null
from emp;

select ename, sal, comm, sal + nvl(comm, 0) -- nvl 써서 해결
from emp;

select ename, sal, nvl(comm, -7)
from emp;

-- (주의)
select ename, sal, comm
from emp;

select ename, sal, comm, nvl(comm, '미지급') -- 에러 발생 : 데이터 타입을 일치 시켜주어야 함. 
from emp;

select ename, sal, comm, nvl(to_char(comm), '미지급') -- 정상적으로 실행
from emp;

-- 2. nvl2(비교대상, null이 아닐 때 값, null일 때 값)
select ename, comm, nvl2(comm, 9999, 1111)
from emp;

select ename, comm, nvl2(comm, comm+100, 500)
from emp;

-- 3. nullif(비교대상, 비교값) : 비교대상 = 비교값 인 경우에 null
select ename, deptno, comm, nullif(deptno, 30) -- 30번 부서만 null 처리
from emp;

-- 4. case 표현식 - switch case문
select ename, deptno, case when deptno = 30 then 'A팀'
                           when deptno = 20 then 'B팀'
                           when deptno = 40 then 'C팀'
                           else 'F팀'
                        end
from emp;

-- 5. decode(비교대상, 값1, 처리1, 값2, 처리2, 값3, 처리3, ..... 값N, 처리N,   기타처리) // 앞에 조건을 만족하지 않으면 기타처리
select ename, deptno, decode(deptno, 30, 'A팀', 20, 'B팀', 40, 'C팀',   'F팀')
from emp;

-- 퀴즈) emp 테이블에서 [사원이름, 사원번호, 이름에 A가 있으면 'A팀' 없으면 'B팀']으로 표시하시오. 


