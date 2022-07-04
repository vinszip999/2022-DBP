--<220704 25��° ����>

-- �ܺ� ����(outer join) : ���� ���ǿ� ���Ե��� ����, ��� �� �� ������ Ʃ���� ��� ����ϰ� ���� �� �����. 

desc emp;

insert into emp(empno, ename, sal) -- �������Ἲ : �ܷ�Ű ���� ���� (null�� ���� �� �ִ�, ������ ���� ���´�)
values(9999, 'TOMMY', 700);

select * from emp;

select e.ename, d.dname, e.deptno
from emp e, dept d -- ��Ʈ����Ʈ(attribute) 8 + 3 : 11
where e.deptno = d.deptno;


-- left outer ���� : from �� ������ ����� ���̺� �̸� �� ���ʿ� ����� emp ���� ���� ��� ���ڵ带 ����ϰ� �ʹٸ�
--                   �ݴ��� (+) ��ȣ�� ���δ�. 
select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno = d.deptno(+);


-- right outer ���� : from �� ������ ����� ���̺� �̸� �� �����ʿ� ����� emp ���� ���� ��� ���ڵ带 ����ϰ� �ʹٸ�
--                   �ݴ��� (+) ��ȣ�� ���δ�. 
select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno(+) = d.deptno;


select e.ename, d.dname, e.deptno
from emp e, dept d
where e.deptno(+) = d.deptno(+); -- ���� �߻� : ���� �� �� ������ (+) ��ȣ�� ���


select * from tab;

select * from player_t;
select * from team_t;

select *
from player_t, team_t;

select p.player_name, p.team_id, t.team_name
from player_t p, team_t t
where p.team_id(+) = t.team_id;


select * from player_t; -- ���� ����
select * from team_t; -- �� ����
select * from stadium_t; -- ���� ����

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id = s.stadium_id;

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id = s.stadium_id(+); -- K-���� ���� ���� ���� �� ã��

select t.team_name, s.stadium_name
from team_t t, stadium_t s
where t.stadium_id(+) = s.stadium_id; -- �����򰡿� ����!!!
