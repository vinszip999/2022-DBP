--<220407 ����>

select * from emp;
-- ����) (�μ���, ������) [�����, ���� �Ի���, ������ �Ի���]�� ��ȸ�Ͻÿ�. 
select deptno, job, count(*), min(hiredate), max(hiredate)
from emp
group by deptno, job
order by 1;


-- ����) ��ü ������� ��� ���ʽ��� ���ϼ���. 
select avg(comm),            -- 4���� ���� ��հ��� ����. 
    -- ���� �Լ��� �ƴѰ� ���� ������ ����. 
    trunc(avg(nvl(comm, o))) -- 14�� ���� ��հ��� ����.  
from emp;


create table t1(
    coll number
);

insert into t1 values(1000);
insert into t1 values(1000);
insert into t1 values(2000);
insert into t1 values(2000);
insert into t1 values(null);
insert into t1 values(null);

select * from t1;

select count(*), count(coll), count(distinct coll) from t1;

drop table t1; -- table ������

-- ����) �޿��� 1000 �̻��� ������� ������(�������� ����)�� ����� �����, �ִ�޿�, �ּұ޿��� ���Ͻÿ�. 
select * from emp;

select job, count(*), max(sal), min(sal)    -- ������� 4
from emp                                    -- ������� 1
where sal >= 1000                           -- ������� 2
group by job                                -- ������� 3
order by job ASC;                           -- ������� 5

-- ����) �� �μ����� 'clerk'�� �� ������ ��ȸ�Ͻÿ�. clerk�� ����
select deptno, count(*)
from emp
where job = 'CLERK'
group by deptno
order by deptno; -- order by 1;

-- ����) ���ʽ��� ���� �ʴ� ����� �μ����� �� ������ ��ȸ�Ͻÿ�. 
select deptno, count(*)
from emp
where comm is null
group by deptno
order by 1;


-- ����) 5�� �̻� �ٹ��ϴ� �μ��� �ο���, �ִ�޿�, �ּұ޿��� ���Ͻÿ�. 
select * from emp;
desc emp;

--select empno, count(*), max(sal), min(sal)
--from emp
--where empno >= 5 
--group by empno
--order by 1;

select deptno �μ���ȣ, count(*) �μ��ο�, max(sal) �ִ�޿� , min(sal) �ּұ޿�    -- ������� : 4
from emp                                        -- ������� : 1
group by deptno -- �μ�����                      -- ������� : 2
having count(*) >= 5                            -- ������� : 3
order by �μ��ο�; -- deptno                           -- ������� : 5


--����) �ְ�޿��� �����޿��� ���̰� 500 �̻��� ������ ��ȸ�Ͻÿ�.
-- count(*) : �ο� ��, �Ҽ� �ο�
select job ����, count(*) �Ҽ��ο�, max(sal) �ִ�޿�, min(sal) �ּұ޿�, max(sal) - min(sal) �޿���
from emp
group by job -- �������� ����
--having �޿��� >= 500   -- ���� �߻�, having ������ alias�� ����� �� ����. 
having max(sal) - min(sal) >= 500
order by �Ҽ��ο�; -- order by ������ alias�� ����� �� �ִ�.
