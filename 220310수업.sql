select * from tab;
select * from emp; 
--| | | 세로를 컬럼(Colume), 열, 데이터 필드
--- - - 가로를 로우(row), 행, 레코드
--emp 테이블의 모든 것(*)
--emp 테이블에 있는 모든 레코드와 컬럼을 다 보여라
--from 다음에는 table이 나옴. 
--select와 from은 꼭 들어가야 한다.
select ename, sal from emp; --emp의 ename과 sal(급여)

select ename, sal, sal * 2 + 100 from emp;
--select 다음에는 컬럼명 또는 *연산*이 올 수 있다. 
select ename, sal, sal*2+100, 'BTS' from emp; -- select 다음에 ''를 쓰면 문자열도 올 수 있다. 
select ename, sal, sal*700 from emp; -- 7개월치 월급은 sal*700으로 계산.
select ename as "사원이름", sal "급여", sal * 7 "7개월 급여" from emp;
--as 얼라이어스 별명, 별칭
--얼라이어스는 꼭 "" 쌍따옴표로, 띄어쓰기 넣을때는 꼭 "" 아니면 생략해도 된다. / as는 생략해도 된다.!!!!

select ename, '홍길동' as "이   름" from emp;

select ename, 'sal*2+100', 77 from emp;
--select 다음에는 컬럼명과, 
--컬럼명 자리에 수식을 써도 되고 문자열 써도 되고, 정수를 써줘도 되고, 컬럼명을 바꿀 때는 as를 써도 되고 (as는 생략 가능)

select ename, job from emp;

select ename + job from emp; -- 에러 발생(오라클에서만 에러) MySQL, MSSQL, 등 에서는 정상적으로 실행
select ename || job as "이름과 직업" from emp;

--퀴즈) 사원이름(사원번호) 형태로 조회하시오.

select ename || empno as "사원이름(사원번호)" from emp;
--<정답>
select ename || '(' || empno || ')' "사원이름(사원번호)" from emp;


--중복된 직업 없애기 : distinct
--distinct 중복된 값은 하나만 출력
select distinct job from emp;

select distinct deptno from emp;

select distinct deptno from emp order by deptno asc;
--asc 내림차순 정렬

select distinct deptno from emp order by deptno desc; -- desc는 디센딩 오름차순 정렬
desc emp; -- desc 디스크라이브 명세화하다, 상세화하다 라는 뜻

select ename from emp;
-- 입력한 순서대로 이름이 나옴. 

select ename from emp order by ename asc; -- asc는 생략가능!!

select deptno, job from emp;

select distinct deptno, job from emp order by deptno; --deptno과 job 중복된 값 없애서 보여주기

-- 에러 발생, distinct는 select 바로 다음에만 사용 가능
select deptno, distinct job from emp order by deptno;


-- 퀴즈) 윌급을 3000 달러 받는 사람 검색
select * from emp;
-- 조건을 검색할 때 사용 : where절 
select ename, sal from emp
where sal = 3000;

--급여가 3000달러 이상 검색
select ename, sal from emp
where sal >= 3000;

--select *
--from book
--where title = "태백산맥";

--select ename, sal from emp where 1000 >= 3000; -- false : 출력값 없음
select ename, sal from emp where 1000 <= 3000; -- true : 전체 레코드 출력
select ename, sal from emp where 0=0; -- true : 전체 레코드 출력


--퀴즈)Allen의 이름, 급여, 입사날짜를 조회하시오.
--select * from emp;
select ename, SAL, hiredate from emp where ename = 'ALLEN'; -- 명령어는 대소문자를 구분하지 않는다.
select ename, sal, hiredate from emp where ename = 'ALLEN'; -- 문자열은 대소문자 구분


desc player_t; -- desc는 테이블의 구조를 보는 명령어

select * from player_t;

----퀴즈) K-리그
--K-리그 선수 중에서 포지션이 fw인 선수들의 이름, 키, 팀ID를 조회하시오. (성공!)
select player_name, height, player_id from player_t 
where position = 'FW';

--퀴즈2) K-리그 선수중에서
--몸무게가 80보다 큰 선수들의 이름과 몸무게를 조회하시오.
select player_name, weight 
from player_t
where weight > 80;


--실행순서는 from부터!! 실행순서 잘 알아야 함!!!!!*****
select player_name, weight -- 실행순서 3
from player_t -- 실행순서 1
where weight > 80; -- 실행순서 2


--퀴즈3)
--포지션이 GK인 선수들중에서 키가 190보다 큰 선수들의 이름, 키, 포지션을 조회하시오.
select player_name, height, position
from player_t
where position = 'GK' and height > 190;


--퀴즈4)
--키가 165, 195, 196인 선수들의 이름, 키 팀ID를 조회하시오. 
select player_name, height, team_id
from player_t
where height = '165' or height = '195' or height = '196';

--방법1)
select player_name, height, team_id
from player_t
where height = 165 or height = 195 or height = 196;

--방법2)
select player_name, height, team_id
from player_t
where height in (165, 195, 196);

--방법3)
select player_name, height, team_id
from player_t
where height = any(165, 195, 196);

--all은 모두 만족, any는 in하고 똑같은 말로 하나만 만족해도 보여준다.


--퀴즈5)
--키가 192보다 크거나 같고, 195보다 작거나 같은 범위내에서 해당되는 선수들만 이름, 키를 조회하시오.
select player_name, height
from player_t
where height >= 192 and height <= 195;


--방법1)
select player_name, height
from player_t
where height >= 192 and height <= 195;

--방법2)
select player_name, height
from player_t
where height between 192 and 195; -- between A and B;
--between 연산자는 이상, 이하 들어감. !!!!!*** 초과, 미만 아님!!!!!!!!

-- 문자열도 정상적으로 처리됨.
select player_name, height
from player_t
where player_name between '나길동' and '박길동'; -- 가나다순으로 문자열 부여 / '나'와 '박' 사이에 이름 보여줌 / 이상, 이하라 나길동, 박길동 이름 있으면 포함해서 보여줌!!

select player_name, height
from player_t
where player_name between '박길동' and '나길동'; -- 선택된 행 없음. 박 <=> 나 바꿈

-- like 연산자 : 와일드 카드(_ : one, % : zero or more)
select player_name
from player_t
where player_name like '__'; -- 이름이 두 글자인 사람 출력

select player_name
from player_t
where player_name like '_오'; -- 언더바는 한글자, 뒤는 반드시 '오'가 와야 함. 

select player_name, e_player_name
from player_t
where player_name like '가%'; -- 이름이 '가' 인 사람도 나옴. '가'로만 시작하면 다 나온다. (중요한 건 이름이 '가'인 사람도 나온다!**)
--where player_name = '가%'; -- 에러 발생
where player_name like '가_';

--퀴즈) K-리그
--1)이름 2번째 글자가 '수'인 선수들의 이름과 영문이름을 조회하시오.
select player_name, e_player_name
from player_t
where player_name like '_수%';
--내 오답> _수_ 가 아닌, _수%로 해주어야 한다**
--where player_name like '_수_';












