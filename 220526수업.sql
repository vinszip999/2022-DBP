--<220526 21번째 수업>

-- (문제) player_t 선수들의 이름의 글자 수를 기준으로 몇 명 있는지 조회하시오. 
select length(player_name), count(*)
from player_t
group by length(player_name)
order by 2 desc; -- 많은 순서대로


-- (문제) 생일이 등록된 선수들을 대상으로 월별 생일자가 몇 명인지 조회하시오. 

-- (방법-1) to_char() 이용
select to_char(birth, 'mm'), count(*)
from player_t
where birth is not null
group by to_char(birth, 'mm')
order by 1;
-- to_char() 함수 형식
select to_char(sysdate, 'mm') from dual;

-- (방법-2) extract() 이용
select extract(month from birth), count(*)
from player_t
where birth is not null
group by extract(month from birth)
order by 1;


-- (문제) 생일이 등록된 선수들의 (이름, 생일, 연령대)를 조회하시오. 
-- (20~30대 까지는 20대, 30~40대 까지는 30대 조건 주기)

-- (1단계) 만 나이
select player_name, birth, '만' || trunc(months_between(sysdate, birth) / 12) || '세'
from player_t
where birth is not null;

-- (2단계) 연령대 구하기
select player_name, birth, trunc(months_between(sysdate, birth) / 12, -1) || '대' 연령대
from player_t
where birth is not null
order by 연령대;


-- (문제) 생일이 등록된 선수들을 대상으로 연령대별 인원이 몇 명인지 조회하시오. 
select trunc(months_between(sysdate, birth) / 12, -1) || '대' 연령대, count(*)
from player_t
where birth is not null
group by trunc(months_between(sysdate, birth) / 12, -1)
order by 1;


-- 자주 발생하는 에러 유형들...

-- 첫번째
select position 포지션, avg(height) 평균키 -- 에러 발생 : 그룹함수(=집계함수)는 그룹함수들끼리만 같이 사용할 수 있다. 
from player_t; 
--그룹함수(=집계함수) max, min, sum, count

-- 해결 방법
select position 포지션, avg(height) 평균키
from player_t
group by position


-- 두번째
select position 포지션, avg(height) 평균키
from player_t
group by 포지션; -- 에러 발생 : where절이나 group by절에는 별칭(alias)을 사용하지 못함. 

-- 해결 방법
select position 포지션, avg(height) 평균키
from player_t
group by position;


-- 세번째
select team_id, avg(height) 평균키
from player_t
where avg(height) >= 180 -- 에러 발생 : where절에는 그룹함수를 사용하지 못함. 
group by team_id;


-- rollup : 부분별 또는 전체 총계를 구해주는 함수

-- 전체 총계 계산
select deptno, count(*), sum(sal), trunc(avg(sal)), max(sal), min(sal)
from emp
group by rollup(deptno);

-- 부분별 계산
select deptno, job, count(*), sum(sal)
from emp
group by rollup(deptno, job);

-- rollup(job, deptno) 순서주의 : 순서가 바뀌면 결과값도 바뀜. 
select job, deptno, count(*), sum(sal)
from emp
group by rollup(job, deptno);

-- cube 함수 정리
select deptno, count(*), sum(sal)
from emp
group by cube(deptno);

select job, deptno, count(*), sum(sal)
from emp
group by cube(job, deptno);

select deptno, job, count(*), sum(sal)
from emp
group by cube(deptno, job);
