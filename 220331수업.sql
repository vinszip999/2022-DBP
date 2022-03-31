--substr(e_player_name, 시작인덱스, 갯수)
--substr은 0과 1이 똑같다

--문제) player_t에서 이름이 두 글자인 선수들의 한글이름, 영문이름 중 첫번째 공백 앞글자까지만 나오도록 출력하시오.
-- 예) KIM, HO --> KIM, 
--        Garbriel Popescu ==> Garbriel
select player_name, e_player_name, substr(e_player_name, 1, instr(e_player_name, ' ', 1, 1) - 1) -- instr은 공백 
-- instr(대상, 찾을 문자열 검색, 시작 위치, 횟수)
from player_t
where length(player_name) = 2 and e_player_name is not null;
--where player_name like '__';

-- 공백 문자 뒤에 오는 문자열 출력
select player_name, e_player_name, substr(e_player_name, 1, instr(e_player_name, ' ', 1, 1) + 1)
from player_t
where length(player_name) = 2 and e_player_name is not null;


select * from team_t;
desc team_t; -- 구조

--문제) team_t 테이블에서 팀이름, 전화번호, 한글 전화번호를 출력하시오.
-- 특히 한글 전화번호는 전화번호가 202-9998인 경우에 ===> 이영이-구구구팔
select team_name, tel, translate(tel, '0123456789', '영일이삼사오육칠팔구')
from team_t;


-- 숫자 함수
select 7677.567
from dual; -- 임시함수, 하나

select * from dual;

select round(7677.567) -- 정수만 남겨둬라반올림
from player_t;

select round(7677.567, 2) -- 7에서 반올림
from player_t;

select round(7677.567, -3) -- 백의 자리에서 반올림
from player_t;

select round(7677.567) 결과1, select round(7677.567, 2) 결과2, select round(7677.567, -3) 결과3 -- 정수만 남겨둬라반올림
from player_t;
--결과1 : 소수점 이하 첫번째 자리에서 반올림, 정수만 출력
--결과2 : 소수점 둘째자리까지 표현, 소수점 셋째자리에서 반올림
--결과3 : 백의 자리에서 반올림

select trunc(7677.567) 결과1, trunc(7677.567, 2) 결과2, trunc(7677.567, -3) 결과3 -- trunc 함수는 소수점 버리는 함수
from dual;
-- 결과1 : 소수점 이하 첫번째 자리에서 잘림. 즉, 소수점은 무조건 다 잘림. 
-- 결과2 : 소수점 이하 두번재 자리만 남기고 잘림. 즉, 소수점 이하 세번째 자리에서 잘림.
-- 결과3 : 백의 자리에서 잘림. 


-- ceil : 주어진 값보다 큰 정수 중에 가장 작은 정수.
-- floor : 주어진 값보다 작은 정수 중에 가장 큰 정수.

select ceil(3.3) -- 3.3보다 가장 큰 값 중에 제일 먼저 만나는 수 : 4
from dual;

select ceil(3.3), floor(3.3) -- 작은 정수보다 가장 큰 것
from dual;

select ceil(-3.3), floor(-3.3) -- 작은 정수보다 가장 큰 것
from dual;

select 100/3 from dual; -- 몫(정수+소수점)
select trunc(100/3) from dual; -- 소수점 때고, 몫만 구하기     몫(정수)

select mod(100, 3) from dual; -- mod 함수는 , 로 구분하기!

-- sign(x) 함수 : x값이 0보다 작으면(음수) -1, 0이면 0, 0보다 크면(양수) 1을 반환
--         어떠한 함수가 양수인지 음수인지를 판단할 때 유용하게 사용
select sign(3/7500), sign(15*0), sign(1-85000)
from dual;



























