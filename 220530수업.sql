--<220530 22��° ����>

-- grouping : ���ϴ� ���� ����ϰ��� �� �� - *��ü ����� ���*
select deptno, count(*), sum(sal)
from emp
group by deptno;

select deptno, count(*), sum(sal)
from emp
group by grouping sets(deptno, null);

select deptno, job, count(*), sum(sal)
from emp
group by grouping sets((deptno, job), null) -- (deptno, job) �׷��� �� ��ü ����� ���
order by deptno;

-- deptno �������� ��ü �հ�, job�� �������� ��ü �հ�
select deptno, job, count(*), sum(sal)
from emp
group by grouping sets(deptno, job, null) -- deptno, job ���� �׷��� �� ��ü ����� ���
order by deptno;


select position ������, count(*) �Ҽ��ο�
from player_t
where position is not null -- position �� ���� ����� ����
group by rollup(position);

-- (�̿ϼ�)
select nvl(position, '��ü�ο�') ������, count(*) �Ҽ��ο�
from player_t
--where position is not null -- position �� ���� ����� ����
group by rollup(position);

select position, grouping(position), count(*)
from player_t
group by rollup(position);

select case when grouping(position) = 1 then '��ü�ο�'
            else position
       end ������, count(*)
from player_t
group by rollup(position);


-- join(����) ����
select * from dept;

-- ��ƾ�� �ٹ��ϰ� �ִ� �μ� �̸� ���ϱ�
select ename, deptno
from emp
where ename = 'MARTIN';

select dname
from dept
where deptno = 30;
