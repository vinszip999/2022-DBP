--<220421 15번째 수업>
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- 매 수업 전 실행하고 진행하기!

-- to_date()
select sysdate, to_date(sysdate) from dual;
select to_date('12', 'yy') from dual; -- 2012
select to_date('12', 'mm') from dual; -- 2022-12-01
select to_date('12', 'ss') from dual; -- 2022-04-01 00:00:12

select to_date('2004-11-29', 'yyyy-mm-dd') from dual; -- select to_date('문자열', '포맷') from dual;

-- to_char('날짜', 'day')
select to_date('2004-11-29', 'yyyy-mm-dd') from dual; 

select to_date('1212', 'yymm') 결과1,
       to_date('1212', 'mmdd') 결과2
from dual;

--to_date() 함수 사용 시 주의점
select to_date('1225', 'mmdd') from dual; -- 2022-12-25
select to_date('1225', 'yymm') from dual; -- 에러 발생 mm 값에 이상 (달이 25월이 없어서)
select to_date('0230', 'mmdd') from dual; -- 에러 발생 2월 달은 30일이 존재하지 않음. 


-- 년도 지정 시 끝에 2자리만 사용한 경우

-- 1) yy 옵션은 sysdate 년도 앞에 2자리를 사용함.
select to_date('77', 'yy'), to_date('33', 'yy')from dual;

-- 2) rr 옵션은 00~49까지는 20을, 50~99까지는 19를 앞자리로 사용
select to_date('77', 'rr'), to_date('33', 'rr') from dual;


-- 문제) player_t 선수중에서 K10팀 선수들의 [이름, 생일, 태어난 요일]을 출력하시오. 
desc player_t;
select * from player_t;
-- select player_name 이름, birth 생일, player_id 태어난 요일 
select player_name 이름, birth 생일, to_char(birth, 'day') 
from player_t
where team_id = 'K10';
-- 만약 birth가 없으면 is not null 넣어주기


-- 문제) 일요일에 태어난 선수들만 이름을 조회하시오. 
select player_name
from player_t
--where to_date('day', 1)
where to_char(birth, 'day') = '일요일';


-- 문제) K-리그 선수들의 [이름, 생일, 본인의 환갑이 몇요일]인지 조회하시오.
select player_name, birth, to_char(add_months(birth, 12*60), 'day') -- birth + (365*60) 과 birth + 21900 는 에러가 난다. *윤달 때문에*
from player_t;


-- 문제) 1973년 12월 25일에 태어난 선수들의 [이름, 생일, 팀ID]를 조회하시오.
select player_name, birth, team_id
from player_t
where to_date('1973-12-25');

-- <문자열 = date 비교될 수 있게 처리하는 방법>

-- 방법 1) 문자열로 변환하여 처리
select player_name, birth, team_id
from player_t
where to_char(birth, 'yyyymmdd') = '19731225';

-- 방법 2) Date로 변환하여 처리
select player_name, birth, team_id
from player_t
where to_date('19731225', 'yyyymmdd') = birth;


-- 문제) 1975년도에 태어난 선수들의 [이름, 생일]을 조회하시오.
select player_name, birth
from player_t
--where to_date('1973', 'yyyy') = birth;
where to_char(birth, 'yyyy') = '1975';

-- (주의) 미완성 : 오늘 날짜를 기준으로 비교하므로 1976년 데이터도 출력됨.
select player_name, birth
from player_t
where birth >= to_date('1975', 'yyyy') and birth < to_date('1976', 'yyyy') -- *논리적 오루 발생*
-- 초기값이 오늘날짜를 기준으로 달은 4, 날짜는 21일로 처리되기 때문에 OOO 1975.04.21 <= OOO 1976.04.21 으로 처리되어 1975년부터 1976년까지 출력된다.


-- 문제) 2099년 12월 25일이 무슨 요일인지 조회하시오.
select to_char(to_date('20991225', 'yyyymmdd'), 'day')
from dual;


-- 문제) 올해 나의 생일은 몇요일인지 조회하시오.
select to_char(to_date('20221129', 'yyyymmdd'), 'day')
from dual;


-- (중요) ***** : 수행평가에 출제할 가능성이 아주 많음.
-- 문제) K-리그 고종수 선수의 올해 생일은 무슨 요일인지 조회하시오.
-- *query 한번으로 처리해야함*

-- 하나의 결과 값을 얻기 위해 연산을 두 번 수행해야 하므로 비효율적인 방법
select birth
from player_t
where player_name = '고종수';

select to_char(to_date('20221030', 'yyyymmdd'), 'day')
from dual;

select player_name, birth, to_char(to_date('2022' || to_char(birth, 'mmdd'), 'yyyymmdd'), 'day')
from player_t
where player_name = '고종수';

