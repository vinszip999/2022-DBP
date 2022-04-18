--<220418 13번째 수업>

-- 6. trunc(), round() 함수와의 결합
--trunc() : 소수점 이하 자름, round() : 반욜림

alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- 실행하고 진행하기!

select sysdate, trunc(sysdate) 결과1, trunc(sysdate, 'mm') 결과2, trunc(sysdate, 'yy') 결과3 -- 년, 월, 일 나오고 시, 분, 초 잘림!!
from dual;

--round 함수는 반올림. 낮 12시를 기준으로 다음날로 반환
select sysdate, round(sysdate)
from dual;

select sysdate, round(sysdate) 결과1, round(sysdate, 'mm') 결과2
from dual;

select sysdate, round(sysdate) 결과1, round(sysdate, 'mm') 결과2 -- 4월 15일 잘림 (4월 1일로 출력) / 4월 16일 (5월 1일로 출력)!!
from dual;

select sysdate, round(sysdate) 결과1, round(sysdate, 'mm') 결과2, trunc(sysdate, 'yy') 결과3
from dual;


-- 문제) k-리그
-- k-리그 선수들 중에서 포지션이 'GK'인 선수들의 이름, 생일, 70번째 생일이 언제인지 조회하시오. 
desc player_t;

-- 방법 1)
-- 4년마다 윤달이 발생, 날짜에 오차가 발생함. 
select player_name, birth, birth + (365*70) -- round(birth, 'mm' + 70) -- round(sysdate, player_id)
from player_t
where position = 'GK';

-- 방법2)
select player_name "이름", birth "생일", add_months(birth, 12*70) "칠순"
from player_t
where position = 'GK';

-- 나의 칠순이 언제인지 구하기

-- to_date : 문자열을 date함수로 바꿔줌
select 'vins', add_months(to_date('2004-11-29', 'yyyy-mm-dd'), 12*70) "칠순" -- 2004-11-29 "생일", add_months(2004-11-29, 12*70) "칠순"
from dual;


-- 문제) player_t 선수들의 이름, 생일, 만 나이를 구하세요. (작년 수행평가에 나왔던 질문!!!!)
-- ex) 27세 3개월
select player_name, birth, '만' || trunc(months_between(sysdate, birth) / 12) || '세' || -- || : 붙여주기
                trunc(mod(months_between(sysdate, birth), 12))  || '개월'
from player_t;




















