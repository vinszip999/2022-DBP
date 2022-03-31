select * from tab; -- scott�� ����� �� �ִ� ���̺� ������
select * from emp; -- ��� ���̺� ����
desc emp; -- emp ���̺��� ���� ���� ��ũ���̺� ��ȭ �ϴ�, ����ȭ�ϴ�
select * from player_t;
desc player_t;

--������ �Լ�
SELECT ename, ENAME -- ��ɾ�� ��ҹ��� ������ ����.
FrOm Emp;

select * from emp;
select ename, lower(ename) from emp; -- ���� ����Ǿ� �ִ� ���� �빫��, ȭ�鿡 ���̴� ���� �ҹ��ڷ� // ȭ�鿡 ���̴� ���� "��"
-- ���� ���� : �������� ���̺�κ��� ������ ������ ���̺�
--���� ���̺��� emp ���̺� 

select ename, lower(ename) from emp; -- ��� �ҹ��ڷ�
select ename, upper(ename) from emp; -- ��� �빮�ڷ�
select ename, initcap(ename) from emp; -- ù���� �ϳ��� �빮�ڷ�
select ename, length(ename) from emp; -- ���ڿ� ���̸� ���

select ename, length('ȫ�浿') from emp; -- ���ڿ� ���̸� ���
select ename, length('Hong Gil Dong') from emp; -- ���ڿ� ���̸� ���

--�������� ���̺��� player_t ������, ���⿡�� ���� ����, ��µ� ���� ������ ���̺�, "��" �̴�.
select player_name, e_player_name, upper(e_player_name), initCap(e_player_name)
from player_t
where player_name like '��%';

-- ���ڿ� �Ϻ� ��� - substr(subString)
-- ���ڿ� �Ϻθ� �����ؼ� ����ϴ� substr(���, ������ġ, ����), ���� : ���� ��ġ 0, 1�� ��� ���� ����
-- select e_player_name, substr(e_player_name, 1) -- 0�� 1�� ����� �Ȱ���. 

select e_player_name, substr(e_player_name, 3, 4), substr(e_player_name, 3) -- 0�� 1�� ����� �Ȱ���. 
from player_t
where player_name like '��%';

--player_t���� �����̸��� ���̸����� ����� �ѱ��̸� ã��
select player_name
from player_t
where player_name = '���̸���';

--�ѱ��� �ѱ��ڿ� 3����Ʈ
select player_name, substr(player_name, 1, 2) --  substr�� ���ڼ� ������ �ڸ�
from player_t
where player_name = '���̸���';

select player_name, substrb(player_name, 1, 3) -- substrb�� ����Ʈ ������ �ڸ� : �ѱ� �� ���ڴ� 3����Ʈ, ����� 1����Ʈ
from player_t
where player_name = '���̸���';

-- length : ���ڼ� (�ѱ�, ���� ��� ����) 1���ڰ� 1
select player_name, length(player_name), e_player_name, length(e_player_name)
from player_t
where player_name like '��%';

-- lengthb : ����Ʈ�� (�ѱ� 1���� 3byte, ���� 1���ڴ� 1byte) ������ 1byte
select player_name, lengthb(player_name), e_player_name, lengthb(e_player_name)
from player_t
where player_name like '��%';

--Ư�� �ڸ�����ŭ ä���� ǥ���� ��
--lpad(���, Ȯ���� ũ��, ���� ���� ������ ä�� ����)
--rpad(���, Ȯ���� ũ��, ������ ���� ������ ä�� ����)

select ename, lpad(ename, 20, '*') -- ���� ����, 20 ����� ä���
from emp;

select ename, rpad(ename, 20, '-')
from emp;

-- ���� ��, ������ ���� ������ Ư������(����) ���� �� 
����, ���� ���� ���� �Լ� : trim 
ltrim(���, ������ ����)
rtrim(���, ������ ����)

select ename, ltrim(ename, ' ') -- ���ʿ� ������ ������ ������
from emp;

select ename, ename, rtrim(ename, 'H') -- �����ʿ� H�� ������ ������
from emp;

select ename, ename, rtrim(ename, 'T') -- *SCOTT�� �� �� T �� ������*
from emp;
