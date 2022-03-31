--<0317 ����> ����

--emp ���̺��� �̸��� A�� ���� �ʴ� ����� �̸�, �޿�, �Ի糯¥�� ��ȸ
--like, between, in �����ڴ� �ٷ� �տ��� not �����ڸ� ��� ������. 
select ename, sal, hiredate
from emp
where ename not like '%A%';

--����) K-����
--������ �߿��� Ű�� 170���� �۰ų�, 195���� ū �����鸸 �̸�, Ű, ��ID�� ��ȸ�Ͻÿ�. 
--(�̸�, �ʰ�, or ���)

--���1)
select player_name, height, team_id
from player_t
where height < 170 or height > 195; 

--���2) between �����ڸ� �̿�
select player_name, height, team_id
from player_t
--where height between 170 and 195; -- 170 �̻�, 195 ����
where height not between 170 and 195; -- 170 �̸�, 195 �ʰ�


--�������� GK, MF, FW, DE, TC�� ��� �ƴ� �����鸸 �̸�, ������, ��ID�� ��ȸ

--���1)
select player_name, position, team_id
from player_t
where position not like 'GK' and position not like 'MF' and position not like 'FW' and position not like 'DF' 
and position not like 'TC';

--���2)
select player_name, position, team_id
from player_t
where position not in ('GK', 'MF', 'FW', 'DF', 'TC');

--���3)
select player_name, position, team_id
from player_t
where not position = any ('GK', 'MF', 'FW', 'DF', 'TC'); -- any�� in�� ����.

--���4)
select player_name, position, team_id
from player_t
where position != all('GK', 'MF', 'FW', 'DF', 'TC');


--�����̸��� T���ڰ� �ϳ��� ���Ե��� �ʴ� �����鸸 �̸�, �����̸��� ��ȸ�Ͻÿ�.

select * from player_t;

select player_name, e_player_name
from player_t
where e_player_name not like '%T%';

--�������� GK�� ������ �߿��� Ű�� 192���� ũ�ų�, �Ҽ����� K10���� 
--�������� �̸�, Ű, ������, ��ID�� ��ȸ�Ͻÿ�.
select player_name, position, height, team_id
from player_t
where position = 'GK' and (height > 192 or team_id = 'K10'); -- == ���� �ʰ� �����ϱ�!!

--emp ��� �߿��� ename�� A ���ڰ� 2�� �̻� ����ִ� ����� �̸��� ����Ͻÿ�.
select ename
from emp
where ename like '%A%A%'; -- ���ϵ�ī��� like�� �ϱ�


--emp ��� �߿��� A���ڰ� 1���� ������ ����� �̸��� ����Ͻÿ�.
select ename
from emp
where ename like '%A%' and ename not like '%A%A%';

select ename, sal from emp; -- ����� �̸��� �޿�
-- smith�� ���� ���� ������ ������ ���� ó���� insert �߱� �����̴�.

select ename, sal from emp
--order by sal desc; -- ��������
order by sal asc; -- ��������


--�̸������� �������� ����
select ename, sal from emp
order by ename desc;

--���� �� null ���� ���� Ȯ��
-- �������� ���� : �������� ���
-- �������� ���� : ó���� ���
select ename, sal, comm
from emp
--order by comm desc;
order by comm asc;

--�������� ����������, �������� ����ó�� null ���� �������� ���
from emp
order by comm desc nulls last;

--<�� ���� ����>
------------------------------
---- �������� ����������, �������� ����ó�� null ���� ó���� ���
--select ename, sal, comm
--from emp
--order by comm asc nulls first;
--
---- ������ �÷����� ���� ��
--select ename, deptno, sal
--from emp
--order by deptno desc, sal asc;
--
--select ename, deptno, sal
--from emp
--order by deptno desc, sal desc;
--
---- ����̸�, �޿�, �Ի糯¥�� �ֱٿ� �Ի��� ����� ���� �������� ���
--select ename, sal, hiredate
--from emp
--order by hiredate desc;
--------------------------------

-- alias(��Ī)�� where������ ����� �� ����, select�� �� �������� ���� ���������� ����Ǳ� �����̴�.
select ename �̸�, sal �޿�, sal * 12 ���� -- 3
from emp -- 1
where sal*12 > 10000;
--where ���� > 10000; -- 2 ���� �߻� : ���� ����
----������� ������ where ���� "����"�� �� ����.

select ename �̸�, sal*12 ����, ���� + 200 -- ���� �߻� : ���� �࿡ ��ġ
from emp;



select ename �̸�, sal*12 ����, (sal*12) + 200
from emp
where sal*12 > 10000
order by ���� desc;

order by sal*12 desc;
order by 2 desc; -- �������� ���� ���� ���ô� ���
order by 1 desc; -- �̸����� �������� ����









