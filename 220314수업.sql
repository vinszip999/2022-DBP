--select *
--from book
--where title like '%�¹���';

--����) K-����
--1) �̸� 2��° ���ڰ� '��'�� �������� �̸��� �����̸��� ��ȸ�Ͻÿ�.
select player_name, e_player_name
from player_t
--where player_name like '_��%';
--�� ����> _��_ �� �ƴ�, _��%�� ���־�� �Ѵ�**
where player_name like '_��_';

desc player_t;
--2) �̸��� �� ������ �����鸸 �̸��� �����̸��� ��ȸ�Ͻÿ�.
select player_name, e_player_name
from player_t -- ������� 1��°
where player_name like '__'; -- ������� 2����

--�ϳ��� �����ͺ��̽� �ȿ��� ������ ���� '���̺�'���� �ִ�. 


--3) �����̸��� 'T' ���ڰ� ���Ե� �����鸸 �̸��� �����̸��� ��ȸ�Ͻÿ�. 
select player_name, e_player_name
from player_t
where e_player_name like '%T%';

--4) �����̸��� '%' ���ڰ� ���Ե� �����鸸 �̸��� �����̸��� ��ȸ�Ͻÿ�.
select player_name, e_player_name
from player_t
--where e_player_name like '%'; -- �����̸��� null ���� �ƴ� ��� ��(row, ���ڵ�, Ʃ��)�� ���
where e_player_name like '%$%%' escape '$'; -- escape ���� ó�� '%$%%' ��ſ� '%$_%' _ �� �ᵵ �ȴ�. (_�� �� �̸� ã��)

where e_player_name like '%!_%' escape '$'; -- '$' Ư����ȣ�� �ƹ��ų� �������. ***

--null : ������� �������� ���� ������ ���� �ǹ���. 
--       null�� ���Ե� ��� �������� null ������ ó����. 

--����̸�, �޿�, ���� ���� ���ʽ�, 300�޷� ���� ���ʽ�
select ename, sal, comm from emp;
select ename, sal, comm, NVL(comm, 0) + 300 from emp; -- ���� �����򰡿� ���� **** NVL *****
--null�� ���Ե� ���갪�� ������ null�̴�.

--���ʽ� �� �޴� ������� �̸�, Ŀ�̼� ���
select ename, sal, comm
from emp
where comm = null; -- ���õ� ���� ����, null ���� ������ �� ����. 
where comm is null; -- ���õ� ���� ����. null ���� ������ �� ����. 

select ename, sal, comm
from emp
where comm is not null;

--not ������

--����� �̸�, �޿�, �Ի��� ��¥
select ename, sal, hiredate
from emp
--where sal <= 2000;
--where sal > 2000;
where sal not > 2000; -- ���� �߻� =, <, > �ٷ� �տ��� not ������ ��� �Ұ�

select * from emp; -- ���̺� �ִ� ��� �÷��� ������ ������. 
