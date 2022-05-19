--<220519 19��° ����>

-- (����) Ű�� 185���� ū �������� �� ���� �� �� �ִ°�?
-- <���� Ǯ��>
select team_id, count(team_id)
from player_t
where height > 185
group by team_id
order by 1;

-- <������ Ǯ��>
select team_id, count(player_id) --count(*), count(player_id) �Ǵ� count(Not null�� �÷� �ֱ�)
--*�⺻Ű���� null�� ����*
from player_t
where height > 185
group by team_id
order by 1; -- ��𿡳� �� �� ������, order by�� ��������� �� �������̴�.


-- (����) Ű�� 185���� ū ������ 7�� �̻� ������ ���� team_id�� ������ ��ȸ�Ͻÿ�. 
select team_id, count(team_id) -- count(player_name)�� ����!!
from player_t
where height > 185 and count(team_id) >= 7 -- ���� �߻� : ���� ��������
group by team_id
order by 1;

select team_id, count(player_name)
from player_t
where height > 185
group by team_id
having count(player_name) >= 7 -- ���������� ����. �׷��Լ� �̿��� ������ having������ ó����. 
order by team_id asc;


-- extract(�������� from ��¥ ) : ���ڸ� ǥ�� �����ϸ� ��, ��, ���� ȥ���ؼ��� ����� �� ����. 
select extract(day from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(year from sysdate) from dual;


-- ������̺��� ��ü������� ������� �׷��Լ��� �����Ͻÿ�. 
-- ��ü���, �ִ�޿�, �ּұ޿�, �޿��հ�, �޿����
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp;


-- �̸��� 'A'�� ����ִ� ������� ������� �׷��Լ��� �����Ͻÿ�. 
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp
where ename like '%A%';


-- 20�� �μ��� ������� ������� �׷��Լ��� �����Ͻÿ�. 
select count(*), max(sal), min(sal), sum(sal), avg(sal)
from emp
where deptno like 20; 


-- �μ��� �׷��Լ��� �����Ͻÿ�. 
select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
order by 1;


-- �μ��� �׷��Լ��� �����Ͻÿ�. (��, �μ��� ��ձ޿��� 2000 �̻� ���ð�!)
select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
where avg(sal) >= 2000 -- ���� �߻� : �׷��Լ��� where������ ����� �� ����. 
group by deptno
order by 1;

select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000; -- ���������� ����

select deptno, count(*), max(sal), min(sal), sum(sal), trunc(avg(sal))
from emp
group by deptno
having avg(sal) >= 2000
order by deptno; -- ���� ����
