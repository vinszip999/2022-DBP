select * from tab;
select * from emp; 
--| | | ���θ� �÷�(Colume), ��, ������ �ʵ�
--- - - ���θ� �ο�(row), ��, ���ڵ�
--emp ���̺��� ��� ��(*)
--emp ���̺� �ִ� ��� ���ڵ�� �÷��� �� ������
--from �������� table�� ����. 
--select�� from�� �� ���� �Ѵ�.
select ename, sal from emp; --emp�� ename�� sal(�޿�)

select ename, sal, sal * 2 + 100 from emp;
--select �������� �÷��� �Ǵ� *����*�� �� �� �ִ�. 
select ename, sal, sal*2+100, 'BTS' from emp; -- select ������ ''�� ���� ���ڿ��� �� �� �ִ�. 
select ename, sal, sal*700 from emp; -- 7����ġ ������ sal*700���� ���.
select ename as "����̸�", sal "�޿�", sal * 7 "7���� �޿�" from emp;
--as ����̾ ����, ��Ī
--����̾�� �� "" �ֵ���ǥ��, ���� �������� �� "" �ƴϸ� �����ص� �ȴ�. / as�� �����ص� �ȴ�.!!!!

select ename, 'ȫ�浿' as "��   ��" from emp;

select ename, 'sal*2+100', 77 from emp;
--select �������� �÷����, 
--�÷��� �ڸ��� ������ �ᵵ �ǰ� ���ڿ� �ᵵ �ǰ�, ������ ���൵ �ǰ�, �÷����� �ٲ� ���� as�� �ᵵ �ǰ� (as�� ���� ����)

select ename, job from emp;

select ename + job from emp; -- ���� �߻�(����Ŭ������ ����) MySQL, MSSQL, �� ������ ���������� ����
select ename || job as "�̸��� ����" from emp;

--����) ����̸�(�����ȣ) ���·� ��ȸ�Ͻÿ�.

select ename || empno as "����̸�(�����ȣ)" from emp;
--<����>
select ename || '(' || empno || ')' "����̸�(�����ȣ)" from emp;


--�ߺ��� ���� ���ֱ� : distinct
--distinct �ߺ��� ���� �ϳ��� ���
select distinct job from emp;

select distinct deptno from emp;

select distinct deptno from emp order by deptno asc;
--asc �������� ����

select distinct deptno from emp order by deptno desc; -- desc�� �𼾵� �������� ����
desc emp; -- desc ��ũ���̺� ��ȭ�ϴ�, ��ȭ�ϴ� ��� ��

select ename from emp;
-- �Է��� ������� �̸��� ����. 

select ename from emp order by ename asc; -- asc�� ��������!!

select deptno, job from emp;

select distinct deptno, job from emp order by deptno; --deptno�� job �ߺ��� �� ���ּ� �����ֱ�

-- ���� �߻�, distinct�� select �ٷ� �������� ��� ����
select deptno, distinct job from emp order by deptno;


-- ����) ������ 3000 �޷� �޴� ��� �˻�
select * from emp;
-- ������ �˻��� �� ��� : where�� 
select ename, sal from emp
where sal = 3000;

--�޿��� 3000�޷� �̻� �˻�
select ename, sal from emp
where sal >= 3000;

--select *
--from book
--where title = "�¹���";

--select ename, sal from emp where 1000 >= 3000; -- false : ��°� ����
select ename, sal from emp where 1000 <= 3000; -- true : ��ü ���ڵ� ���
select ename, sal from emp where 0=0; -- true : ��ü ���ڵ� ���


--����)Allen�� �̸�, �޿�, �Ի糯¥�� ��ȸ�Ͻÿ�.
--select * from emp;
select ename, SAL, hiredate from emp where ename = 'ALLEN'; -- ��ɾ�� ��ҹ��ڸ� �������� �ʴ´�.
select ename, sal, hiredate from emp where ename = 'ALLEN'; -- ���ڿ��� ��ҹ��� ����


desc player_t; -- desc�� ���̺��� ������ ���� ��ɾ�

select * from player_t;

----����) K-����
--K-���� ���� �߿��� �������� fw�� �������� �̸�, Ű, ��ID�� ��ȸ�Ͻÿ�. (����!)
select player_name, height, player_id from player_t 
where position = 'FW';

--����2) K-���� �����߿���
--�����԰� 80���� ū �������� �̸��� �����Ը� ��ȸ�Ͻÿ�.
select player_name, weight 
from player_t
where weight > 80;


--��������� from����!! ������� �� �˾ƾ� ��!!!!!*****
select player_name, weight -- ������� 3
from player_t -- ������� 1
where weight > 80; -- ������� 2


--����3)
--�������� GK�� �������߿��� Ű�� 190���� ū �������� �̸�, Ű, �������� ��ȸ�Ͻÿ�.
select player_name, height, position
from player_t
where position = 'GK' and height > 190;


--����4)
--Ű�� 165, 195, 196�� �������� �̸�, Ű ��ID�� ��ȸ�Ͻÿ�. 
select player_name, height, team_id
from player_t
where height = '165' or height = '195' or height = '196';

--���1)
select player_name, height, team_id
from player_t
where height = 165 or height = 195 or height = 196;

--���2)
select player_name, height, team_id
from player_t
where height in (165, 195, 196);

--���3)
select player_name, height, team_id
from player_t
where height = any(165, 195, 196);

--all�� ��� ����, any�� in�ϰ� �Ȱ��� ���� �ϳ��� �����ص� �����ش�.


--����5)
--Ű�� 192���� ũ�ų� ����, 195���� �۰ų� ���� ���������� �ش�Ǵ� �����鸸 �̸�, Ű�� ��ȸ�Ͻÿ�.
select player_name, height
from player_t
where height >= 192 and height <= 195;


--���1)
select player_name, height
from player_t
where height >= 192 and height <= 195;

--���2)
select player_name, height
from player_t
where height between 192 and 195; -- between A and B;
--between �����ڴ� �̻�, ���� ��. !!!!!*** �ʰ�, �̸� �ƴ�!!!!!!!!

-- ���ڿ��� ���������� ó����.
select player_name, height
from player_t
where player_name between '���浿' and '�ڱ浿'; -- �����ټ����� ���ڿ� �ο� / '��'�� '��' ���̿� �̸� ������ / �̻�, ���϶� ���浿, �ڱ浿 �̸� ������ �����ؼ� ������!!

select player_name, height
from player_t
where player_name between '�ڱ浿' and '���浿'; -- ���õ� �� ����. �� <=> �� �ٲ�

-- like ������ : ���ϵ� ī��(_ : one, % : zero or more)
select player_name
from player_t
where player_name like '__'; -- �̸��� �� ������ ��� ���

select player_name
from player_t
where player_name like '_��'; -- ����ٴ� �ѱ���, �ڴ� �ݵ�� '��'�� �;� ��. 

select player_name, e_player_name
from player_t
where player_name like '��%'; -- �̸��� '��' �� ����� ����. '��'�θ� �����ϸ� �� ���´�. (�߿��� �� �̸��� '��'�� ����� ���´�!**)
--where player_name = '��%'; -- ���� �߻�
where player_name like '��_';

--����) K-����
--1)�̸� 2��° ���ڰ� '��'�� �������� �̸��� �����̸��� ��ȸ�Ͻÿ�.
select player_name, e_player_name
from player_t
where player_name like '_��%';
--�� ����> _��_ �� �ƴ�, _��%�� ���־�� �Ѵ�**
--where player_name like '_��_';












