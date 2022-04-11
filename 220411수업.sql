--<220401 11��° ����>

-- ����) �μ����� ����� ������ �Ի��� �� ���� �Ի����� ��ȸ�Ͻÿ�.
select deptno �μ���ȣ, max(hiredate), min(hiredate)
from emp
group by deptno
order by 1;

-- ����) �޿��� 1000 �̻��� ������� �������� ����� ���踦 �����ϼ���. (�����, ������ �ִ�޿�, ������ �ּұ޿�)
-- (��, ������ �ּұ޿��� 2,000 �̻��� ����� ����ϵ��� ��ȸ�Ͻÿ�.) 
select job ����, count(*) �����������, max(sal) �������ִ�޿�, min(sal) �������ּұ޿�    -- ������� 5
from emp                                    -- ������� 1
where sal >= 1000                           -- ������� 2
group by job                                -- ������� 3
having min(sal) >= 2000                     -- ������� 4
order by job;                               -- ������� 6
--order by 1; -- �� ����!!
--order by ����; -- �� ����!!

-- ����) Ŀ�̼��� ���� �ʴ� ����� �μ����� �� ������ ��ȸ�Ͻÿ�. 
-- (��, Ŀ�̼��� ���� �ʴ� ����� 3�� �̻��� ����� ����Ͻÿ�.)
select deptno �μ���ȣ, count(*)
from emp
where comm is null
group by deptno
having count(*) >= 3
--having comm >= 3
order by 1;

-- ����) �μ��� �ο� ���� ���Ͻÿ�. (��, ��������� 20�� �μ��� �����Ͻÿ�.)
-- <���� Ǯ��>
select deptno, count(*)
from emp
where deptno is not 20 -- is not�� �ƴ�, <>�� ���־�� �Ѵ�.  (!= ������ <>�� ����!)
group by deptno
order by 1;

-- (where, having �� �� ����� �� ����)
-- where
select deptno, count(*)
from emp
where deptno <> 20
group by deptno
order by 1;

-- having
select deptno, count(*)
from emp
group by deptno
having deptno <> 20
order by 1;

-- <>�� ����, ���ִ� ��

-- ����) �μ��� �ο����� ���� �� �ο����� 5�� �̻��� ����� ������� �Ѵ�. 
select deptno �μ���ȣ, count(*) �μ����ο���
from emp
--where count(*) >= 5       -- ���� �߻�, where������ �����Լ��� ����� �� ����.
group by deptno
having count(*) >= 5
order by 1; -- "order by deptno"�� �ᵵ �ȴ�. �Ǵ� "order by �μ���ȣ"�� ����!! (��������� ���� �������̱� ������ alias�� �ᵵ �ȴ�!!)

-- �� ���������� group by�� �ؾ߸� ���� �� �ִ� �����̰�,
-- group by���� whre�� �켱������ �� ������ ������, �� ���������� where���� ���� ���Ѵ�. 
