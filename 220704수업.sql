--<220704 25번째 수업>

-- 외부 조인(outer join) : 조인 조건에 포함되지 않은, 어느 한 쪽 집합의 튜플을 모두 출력하고 싶을 때 사용함. 

desc emp;

insert into emp(empno, ename, sal) -- 참조무결성 : 외래키 제약 조건 (null값 가질 수 있다, 참조된 값만 갖는다)
values(9999, 'TOMMY', 700);

select * from emp;

select e.ename, d.dname, e.deptno
from emp e, dept d -- 어트리뷰트(attribute) 8 + 3 : 11
where e.deptno = d.deptno;


-- left outer 조인 : from 절 다음에 기술된 테이블 이름 중 왼쪽에 기술된 emp 집합 내의 모든 레코드를 출력하고 싶다면
--                   반대편에 (+) 기호를 붙인다. 
select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno = d.deptno(+);


-- right outer 조인 : from 절 다음에 기술된 테이블 이름 중 오른쪽에 기술된 emp 집합 내의 모든 레코드를 출력하고 싶다면
--                   반대편에 (+) 기호를 붙인다. 
select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno(+) = d.deptno;


select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno(+) = d.deptno(+); -- 에러 발생 : 양쪽 중 한 곳에만 (+) 기호를 사용


select * from tab;

select * from player_t;
select * from team_t;

select *
from player_t, team_t;

select p.player_name, p.team_id, t.team_name
from player_t p, team_t t
where p.team_id(+) = t.team_id;


select * from player_t; -- 선수 정보
select * from team_t; -- 팀 정보
select * from stadium_t; -- 구장 정보

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id = s.stadium_id;

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id = s.stadium_id(+); -- K-리그 전용 구장 없는 팀 찾기

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id(+) = s.stadium_id; -- 수행평가에 나옴!!!
