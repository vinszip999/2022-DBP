--<220526 21��° ����>

-- (����) player_t �������� �̸��� ���� ���� �������� �� �� �ִ��� ��ȸ�Ͻÿ�. 
select length(player_name), count(*)
from player_t
group by length(player_name)
order by 2 desc; -- ���� �������


-- (����) ������ ��ϵ� �������� ������� ���� �����ڰ� �� ������ ��ȸ�Ͻÿ�. 

-- (���-1) to_char() �̿�
select to_char(birth, 'mm'), count(*)
from player_t
where birth is not null
group by to_char(birth, 'mm')
order by 1;
-- to_char() �Լ� ����
select to_char(sysdate, 'mm') from dual;

-- (���-2) extract() �̿�
select extract(month from birth), count(*)
from player_t
where birth is not null
group by extract(month from birth)
order by 1;


-- (����) ������ ��ϵ� �������� (�̸�, ����, ���ɴ�)�� ��ȸ�Ͻÿ�. 
-- (20~30�� ������ 20��, 30~40�� ������ 30�� ���� �ֱ�)

-- (1�ܰ�) �� ����
select player_name, birth, '��' || trunc(months_between(sysdate, birth) / 12) || '��'
from player_t
where birth is not null;

-- (2�ܰ�) ���ɴ� ���ϱ�
select player_name, birth, trunc(months_between(sysdate, birth) / 12, -1) || '��' ���ɴ�
from player_t
where birth is not null
order by ���ɴ�;


-- (����) ������ ��ϵ� �������� ������� ���ɴ뺰 �ο��� �� ������ ��ȸ�Ͻÿ�. 
select trunc(months_between(sysdate, birth) / 12, -1) || '��' ���ɴ�, count(*)
from player_t
where birth is not null
group by trunc(months_between(sysdate, birth) / 12, -1)
order by 1;


-- ���� �߻��ϴ� ���� ������...

-- ù��°
select position ������, avg(height) ���Ű -- ���� �߻� : �׷��Լ�(=�����Լ�)�� �׷��Լ��鳢���� ���� ����� �� �ִ�. 
from player_t; 
--�׷��Լ�(=�����Լ�) max, min, sum, count

-- �ذ� ���
select position ������, avg(height) ���Ű
from player_t
group by position


-- �ι�°
select position ������, avg(height) ���Ű
from player_t
group by ������; -- ���� �߻� : where���̳� group by������ ��Ī(alias)�� ������� ����. 

-- �ذ� ���
select position ������, avg(height) ���Ű
from player_t
group by position;


-- ����°
select team_id, avg(height) ���Ű
from player_t
where avg(height) >= 180 -- ���� �߻� : where������ �׷��Լ��� ������� ����. 
group by team_id;


-- rollup : �κк� �Ǵ� ��ü �Ѱ踦 �����ִ� �Լ�

-- ��ü �Ѱ� ���
select deptno, count(*), sum(sal), trunc(avg(sal)), max(sal), min(sal)
from emp
group by rollup(deptno);

-- �κк� ���
select deptno, job, count(*), sum(sal)
from emp
group by rollup(deptno, job);

-- rollup(job, deptno) �������� : ������ �ٲ�� ������� �ٲ�. 
select job, deptno, count(*), sum(sal)
from emp
group by rollup(job, deptno);

-- cube �Լ� ����
select deptno, count(*), sum(sal)
from emp
group by cube(deptno);

select job, deptno, count(*), sum(sal)
from emp
group by cube(job, deptno);

select deptno, job, count(*), sum(sal)
from emp
group by cube(deptno, job);
