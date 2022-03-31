-- ���� ��, ������ ���� ������ Ư������(����) ���� �� 
--����, ���� ���� ���� �Լ� : trim 
--ltrim(���, ������ ����)
--rtrim(���, ������ ����)

select ename, ltrim(ename, ' ') -- ���ʿ� ������ ������ ������
from emp;

select ename, ename, rtrim(ename, 'H') -- �����ʿ� H�� ������ ������
from emp;

select ename, ename, rtrim(ename, 'T') -- *SCOTT�� �� �� T �� ������*
from emp;

-- ���� ���� ������ ������ ���� ���� ��
select ename, trim('' from ename) from emp

-- Ư�� ���ڿ��� �ٸ� ���ڿ��� ����
-- replace(���, ã�� ���ڿ�, ������ ���ڿ�)
select ename, replace(ename, 'SC', '*?') from emp; -- SC�� *?�� �ٲ���. ****
select ename, translate(ename, 'SC', '*?') from emp; -- S�� *��, C�� ?�� �ٲ���. *** ���� ***

-- ������ ���ڰ� ��� ��ġ�� �������� �˷��ִ� �Լ�
-- instr(���, ã�� ���ڿ� �˻�, ������ġ, Ƚ��)
select ename, instr(ename, 'A', 1, 1) from emp; -- (ename, 'A', 0, 1) ������ġ�� 0�� ���� �ȵȴ�***
-- instr('A', 1, 2) �� �ٲٸ� ADAMS�� ����� 3�� ���´�. ***

--����) k-����
--player_t ���� �߿��� �̸��� 1����, 3���ڰ� �ƴ� �������� �̸��� �Ʒ� ���·� �������� ����Ͻÿ�.
--�̸� ù����**�ι�° ���ں��� ���� ���� ���
--��) ��� ==> ��**��, �츣��� ==> ��**�����

select player_name, substr(player_name, 1, 1) || '**' || substr(player_name, 2) -- substr(player_name, 0, 1) substr�� 0�� ���� �������.
from player_t
--where length(player_name) != 1 and length(player_name) != 3
where length(player_name) not in (1, 3); -- �̸��� �� ���� �̰ų�, �� ���ڰ� �ƴ� �����̸� ���

--where player_name[1] and player_name[2];
--where concat(substr(player_name,1,2),':',substr(player_name,3,2))

--�÷��� �� ��
select ename, job from emp;
select concat(ename, job) from emp; -- Ȯ�� �Ұ��� 2���� �÷��� ������ �� ����. 
select ename || ' ' || job  || ' ' || sal from emp; -- Ȯ�� ����

select ename, 'ȫ�浿' from emp;

--��� ���̺�
desc dual;
select * from dual;
select 'ȫ�浿' from emp;
select 'ȫ�浿' from dual;
select sysdate from emp;
--����Ŭ�� ������ ������
--������ �����ڴ� ���̺�� �����. 
--select�� from�� �ʼ��̴�. 

select initCap('choi') from dual;

select substr(' I am here with you', 6) from dual
select substr('I am here with you', 1, 6) from dual

select 'a', 'A' from dual;
select ascii('a'). ascii('A') from dual;

-- ����) k-����
--1) player_t���� �����̸��� E�� 4�� �̻� ������ �������� �̸�, �����̸��� ��ȸ�Ͻÿ�.

--���1)
select player_name, e_player_name
from player_t
where e_player_name like '%E%E%E%E%';

--where e_player_name == 'k' and e_player_name >= '4'
----if e_player_name == k and e_player_name >= 4
--if e_player_name == 'k' 

--���2)
--instr(���, ã�� ���ڿ��� �˻�, ���� ��ġ, Ƚ��)
select player_name, e_player_name
from player_t
--where instr(e_player_name, 'E', 1, 4) != 0;
where instr(e_player_name, 'E', 1, 4) > 0;
