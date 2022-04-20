--<220420 14번째 수업>

-- 변환 함수
select '00700', 00700
from dual;

-- 숫자형 숫자(사칙연산), 문자형 숫자(문자 연산)

select '00700' + 500 from dual; -- intger로 통일!!!! 앞에 문자열을 intger로 변환하여 계산함!!!
-- '00700'을 내부적으로 문자열을 숫자로 변환하여 처리함. 

-- 문제) k-리그에서 player_id가 1997051인 선수이름과 키를 조회하시오.
-- 문제 풀기 전에 어떤 타입인지 확인하기!!!
desc player_t; -- player_id는 char 문자타입이다.

select player_name, height
from player_t
-- where player_id = '1997051';
where player_id = 1997051; -- *오류가 안남* 컴파일러가 자동으로 문자열로 처리해줌**!!


alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- 매 수업 전 실행하고 진행하기!

-- to_char(date) : 날짜 정보 중 필요한 일부요소만 추출해서 사용할 수 있음. 
select to_char(sysdate)
from dual;

select sysdate, to_char(sysdate, 'day') from dual; -- 요일
select sysdate, to_char(sysdate, 'd') from dual; -- 일주일 중에 며칠 째(일요일:1, 월요일:2, 화요일:3,....)
select sysdate, to_char(sysdate, 'dd') from dual; -- 한달 중 며칠
select sysdate, to_char(sysdate, 'ddd') from dual; -- 일년 중 며칠
select sysdate, to_char(sysdate, 'yyyymm') from dual; -- 200404
select sysdate, to_char(sysdate, 'mmdd') from dual; -- 0420
select sysdate, to_char(sysdate, 'ss') from dual;
select sysdate, to_char(sysdate, 'sssss') from dual; -- 자정부터 몇 초가 흘렀는지

-- 2050년 식목일은 몇일인가 (수행평가 예상문제)

select 'vins', to_char(to_date('2004-11-29', 'yyyy-mm-dd'), 'day')
from dual;

select '크리스마스', to_char(to_date('2022-12-24', 'yyyy-mm-dd'), 'day')
from dual;

-- to_char(number) : 숫자 표시형태 지정 ex) 천자리 쉼표, 마이너스 값 표시 ex) 1,000, -123, 123-, <123>
select 12345, to_char(12345) from dual;
select 12345, to_char(12345, '999,999') from dual; -- 12345 -> 12,345
select 12345, to_char(12345, '000,000') from dual; -- 012,345 빈 앞자리 수 0으로 채움
select 12345, to_char(-12345, '999,999') from dual; -- -12345
select 12345, to_char(-12345, '999,999mi') from dual; --  -가 뒤에 붙음
select 12345, to_char(-12345, '999,999pr') from dual; --  공학에서 - 표현방법
select 12345, to_char(-12345, '000,000') from dual; -- 공학에서 - 표현방법
select 12345, to_char(1234567, '999,999') from dual; -- *에러발생* #으로 찍힘
select 12345, to_char(1234567, '999,999,999') from dual; -- *자리수 늘려줘서 # 에러 고치기*
