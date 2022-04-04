--count �Լ�
select count(*) from emp; -- *�� �ǹ̴� '��� ��', �� null�� count�϶�� ��
select count(*), count(comm) from emp;

select count(*) from player_t;
select count(*), count(e_player_name) from player_t;

--emp table���� �޿��� ���� ���� �޴� ���
select count(*), max(sal) from emp;

select * from emp;

select count(*), min(sal) from emp;

select count(*), sum(sal) from emp;

-- �Ҽ��� �����
select count(*), trunc(avg(sal)) from emp;

select count(*), max(height) from player_t;

--count() �ȿ� *�� ���� null ������ counting�ϰ�, 
-- *�� �ƴ϶� �÷����� ���� null�� �ƴ� ���� ã��

--�����Լ�( = �����Լ�)
select count(*), max(sal), min(sal), sum(sal), avg(sal) from emp;

--�����Լ��� �ڱ�鳢���� ����. (select �࿡ �����Լ� ����, ���� �Լ� ����) 
--select �࿡ �����Լ��� ���� �����Լ��� �� ����. 


-- �μ����� counting �ϱ� (group by ���)
select deptno, count(*) -- 3����
from emp -- 1����
group by deptno -- 2����
order by deptno;

-- ** group by ������ �����ִ� ���� �� �� �ִ�. ***
--group by�� �� ����, select�� �� �� �ִ�. 
--��, order by�� ��� ������ �� �� �ִ�. 

select * from emp;

select job, count(*)
from emp
group by job
order by 1;

-- smith�� ���ϴ� �μ� �̸�
select ename, deptno
from emp
where ename='SMITH';

select deptno, dname
from dept
where deptno = 20;

select ename, deptno
from emp
where ename='SCOTT';

-- �����ͺ��̽��� �̻����� -> �ɰ��� ����

select * from dept;
select * from locations;


--�μ����� �ִ� �޿�, �ּ� �޿��� �޴� ��� ���
select deptno �μ���ȣ, max(sal) �μ����ִ�޿�, min(sal) �μ����ּұ޿� -- 4
from emp -- 1
group by deptno -- 2
-- * ���� where���� ���ٸ� where���� ���� ����ȴ�
order by deptno; -- 3


select max(sal) ��ü�ְ�޿�, min(sal) ��ü�ּұ޿�  -- 2
from emp;    











