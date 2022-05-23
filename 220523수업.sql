--<220523 20번째 수업>

-- (정리) 영업사원이 15만명이다. 연봉 1억 이상 받는 영업사원이 10명 이상 있는 영업지점을 대상으로 
--        몇 명이나 있는지 조회하시오. 
select 영업지점, count(사원번호)
from 영업사원
where 연봉 >= 1억 -- where절에는 그룹함수(=집계함수)를 사용할 수 없다. 
group by 영업지점
having count(*) >= 10 -- having절에는 그룹함수 사용 가능 / count(*)이나 사원번호나 똑같다. 
order by 영업지점; -- 1


-- (정리) 남자 영업사원 중에서 연봉 1억 이상 받는 영업사원이 10명 이상 있는 영업지점을 대상으로
--        몇 명이나 있는지 조회하시오. 
select 영업지점, count(*)
from 영업사원
where 연봉 >= 1억 and 성별 = '남자'
group by 영업지점
having count(*) >= 10
order by 영업지점;


-- (문제) K-리그 선수들의 각 팀의 팀별 평균키가 얼마인지 조회하고, 팀별 평균키가 큰 팀이 먼저 나오도록 조회하시오. 
-- 나의 풀이
select team_id, trunc(avg(height))
from player_t
group by team_id
order by 1;

-- 선생님 풀이
select team_id 팀, trunc(avg(height), 1) 팀별평균키
from player_t
group by team_id -- 외래키
order by avg(height) desc; -- 2 desc도 가능


-- (문제) K-리그 선수들의 평균키가 180보다 큰 포지션의 평균키와 선수의 수를 조회하시오. 
-- 나의 풀이
select position 포지션, trunc(avg(height)) 평균키
from player_t
group by position
having trunc(avg(height)) > 180 -- X(잘못된 풀이) trunc는 select절에서만 간편하게 보기 위해서 사용하고, 연산할 때는 avg 함수만 써서 표현하기!!
order by 1;

-- 선생님 풀이
select position 포지션, trunc(avg(height), 1) 평균키
from player_t
group by position
having avg(height) > 180; -- O(알맞은 풀이)


-- (문제) 포지션이 DF인 선수들이 각 팀에 몇 명씩 있는지 조회하시오. 
-- 나의 풀이
select team_id, count(*) 
from player_t
group by team_id, position 
having position = 'DF'
order by 1;

-- 선생님 풀이
select team_id, count(*) 
from player_t
where position = 'DF'
group by team_id
order by 1;


-- (문제) 같은 이름으로 2명 이상 등록되어 있는 동명이인의 선수들의 이름과 수를 조회하시오. 
select player_name, count(*) -- player_name은 not null 하지만, 더 정확하게 하고 싶으면 player_id 또는 player_name으로 넣어줘도 됨!!!
from player_t 
group by player_name
having count(*) >= 2
order by 1;
