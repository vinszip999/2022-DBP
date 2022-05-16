--<220516 18��° ����>

-- ** �׷�(����)�Լ��� Ư¡
-- 1. ���� Ʃ���� ��� ó����. ������ ������ ������ table ��ü�� �ϳ��� �ָӴ�(=����)�� ��� ó����. 
select min(ename), sum(sal), min(hiredate)
from emp;


-- 2. �׷� �Լ� ��� �� null ���� �ڵ����� ���ܵ�. (��, count(*)�� null ���� ����)
select count(empno), count(*), count(mgr), count(comm) -- mgr(�Ŵ���) 13�� ����(null ���� ���)
from emp;

-- �׷��Լ��� null ���� �ڵ����� �����ϰ� ó����. 

-- ��ü ����� ��� ���ʽ� ���ϱ�
select avg(comm) from emp; -- null�� ���� �����

select avg(nvl(comm, 0)) -- null���� 0���� �ٲ�
from emp;

select avg(comm) ���1, avg(nul(comm, 0)) ���2 from emp; -- ���1�� ���2�� Ʃ���� count���� �ٸ��Ƿ� ������� �ٸ�.  

--��ü ����� ���ʽ� ��
select sum(nvl(comm, 0)) ���1, sum(comm) ���2 from emp; -- ���� ��Ȳ������ nvl �Լ��� �� �ʿ䰡 �����Ƿ�, ���2 ������ �� ����. 

-- ���1�� ��� Ʃ���� ���� 0���� ������ ��ȯ�� ���� �� �հ踦 ���ϹǷ�, ������ ������. 
-- ���2�� null ���� ������ ä ������ �����ϹǷ�, �ӵ��� ���� ������ ����. 

-- * ��, nvl() �Լ��� �� �ʿ��� ���� ����ؾ� �Ѵ�. *


-- 3. ���� �׷����� �з��ؼ� ó�� �� group by(= ���) ���� ��� 

-- �μ��� �޿� �հ�� �޿� ���
select deptno, sum(sal), avg(sal)
from emp
group by deptno; -- group by�� ������ select ������ �׷��Լ��� �� �� ����!!
--order by deptno; -- 1 (�������� ����)

-- (����) player_t ���� �߿��� Ű�� 185���� ū ������ �̸��� Ű�� ��ȸ�Ͻÿ�. 
select player_name, height
from player_t
where height > 185; 

select  * from player_t;

-- (����) player_t ���� �߿��� Ű�� 185���� ū ������ �� ���ΰ�?
select count(player_id) -- player_id : �⺻Ű // �⺻Ű �־��ִ� ���� ���� ����. 
from player_t
where height > 185;

-- (����) Ű�� 185���� ū �������� �� ���� �� �� �ִ°�?
select team_id, count(team_id)
from player_t
where height > 185
group by team_id
order by 1;
