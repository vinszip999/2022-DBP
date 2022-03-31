select * from tab; -- scott이 사용할 수 있는 테이블 보여줌
select * from emp; -- 사원 테이블 보기
desc emp; -- emp 테이블의 구조 보기 디스크라이브 상세화 하다, 세분화하다
select * from player_t;
desc player_t;

--단일행 함수
SELECT ename, ENAME -- 명령어는 대소문자 구분이 없다.
FrOm Emp;

select * from emp;
select ename, lower(ename) from emp; -- 실제 저장되어 있는 것은 대무낮, 화면에 보이는 것은 소문자로 // 화면에 보이는 것은 "뷰"
-- 뷰의 정의 : 물리적인 테이블로부터 유도된 가상의 테이블
--실제 테이블을 emp 테이블 

select ename, lower(ename) from emp; -- 모두 소문자로
select ename, upper(ename) from emp; -- 모두 대문자로
select ename, initcap(ename) from emp; -- 첫글자 하나만 대문자로
select ename, length(ename) from emp; -- 문자열 길이를 출력

select ename, length('홍길동') from emp; -- 문자열 길이를 출력
select ename, length('Hong Gil Dong') from emp; -- 문자열 길이를 출력

--물리적인 테이블은 player_t 이지만, 여기에서 나온 것은, 출력된 것은 가상의 테이블, "뷰" 이다.
select player_name, e_player_name, upper(e_player_name), initCap(e_player_name)
from player_t
where player_name like '가%';

-- 문자열 일부 출력 - substr(subString)
-- 문자열 일부만 추출해서 사용하는 substr(대상, 시작위치, 개수), 주의 : 시작 위치 0, 1은 결과 값이 동일
-- select e_player_name, substr(e_player_name, 1) -- 0과 1의 출력이 똑같다. 

select e_player_name, substr(e_player_name, 3, 4), substr(e_player_name, 3) -- 0과 1의 출력이 똑같다. 
from player_t
where player_name like '가%';

--player_t에서 선수이름이 가이모토인 사람의 한글이름 찾기
select player_name
from player_t
where player_name = '가이모토';

--한글은 한글자에 3바이트
select player_name, substr(player_name, 1, 2) --  substr은 글자수 단위로 자름
from player_t
where player_name = '가이모토';

select player_name, substrb(player_name, 1, 3) -- substrb는 바이트 단위로 자름 : 한글 한 글자는 3바이트, 영어는 1바이트
from player_t
where player_name = '가이모토';

-- length : 글자수 (한글, 영어 모두 동일) 1글자가 1
select player_name, length(player_name), e_player_name, length(e_player_name)
from player_t
where player_name like '가%';

-- lengthb : 바이트수 (한글 1글자 3byte, 영어 1글자는 1byte) 공백은 1byte
select player_name, lengthb(player_name), e_player_name, lengthb(e_player_name)
from player_t
where player_name like '가%';

--특정 자리수만큼 채워서 표시할 때
--lpad(대상, 확보할 크기, 왼쪽 남은 공간에 채울 문자)
--rpad(대상, 확보할 크기, 오른쪽 남은 공간에 채울 문자)

select ename, lpad(ename, 20, '*') -- 왼쪽 정렬, 20 빈공간 채우기
from emp;

select ename, rpad(ename, 20, '-')
from emp;

-- 왼쪽 끝, 오른쪽 끝에 나오는 특정문자(공백) 제거 시 
앞쪽, 뒷쪽 공백 제거 함수 : trim 
ltrim(대상, 제거할 문자)
rtrim(대상, 제거할 문자)

select ename, ltrim(ename, ' ') -- 왼쪽에 공백이 있으면 지워라
from emp;

select ename, ename, rtrim(ename, 'H') -- 오른쪽에 H가 있으면 지워라
from emp;

select ename, ename, rtrim(ename, 'T') -- *SCOTT는 두 개 T 다 지워짐*
from emp;
