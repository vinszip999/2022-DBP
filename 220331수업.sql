--substr(e_player_name, �����ε���, ����)
--substr�� 0�� 1�� �Ȱ���

--����) player_t���� �̸��� �� ������ �������� �ѱ��̸�, �����̸� �� ù��° ���� �ձ��ڱ����� �������� ����Ͻÿ�.
-- ��) KIM, HO --> KIM, 
--        Garbriel Popescu ==> Garbriel
select player_name, e_player_name, substr(e_player_name, 1, instr(e_player_name, ' ', 1, 1) - 1) -- instr�� ���� 
-- instr(���, ã�� ���ڿ� �˻�, ���� ��ġ, Ƚ��)
from player_t
where length(player_name) = 2 and e_player_name is not null;
--where player_name like '__';

-- ���� ���� �ڿ� ���� ���ڿ� ���
select player_name, e_player_name, substr(e_player_name, 1, instr(e_player_name, ' ', 1, 1) + 1)
from player_t
where length(player_name) = 2 and e_player_name is not null;


select * from team_t;
desc team_t; -- ����

--����) team_t ���̺��� ���̸�, ��ȭ��ȣ, �ѱ� ��ȭ��ȣ�� ����Ͻÿ�.
-- Ư�� �ѱ� ��ȭ��ȣ�� ��ȭ��ȣ�� 202-9998�� ��쿡 ===> �̿���-��������
select team_name, tel, translate(tel, '0123456789', '�����̻�����ĥ�ȱ�')
from team_t;


-- ���� �Լ�
select 7677.567
from dual; -- �ӽ��Լ�, �ϳ�

select * from dual;

select round(7677.567) -- ������ ���ֶܵ�ݿø�
from player_t;

select round(7677.567, 2) -- 7���� �ݿø�
from player_t;

select round(7677.567, -3) -- ���� �ڸ����� �ݿø�
from player_t;

select round(7677.567) ���1, select round(7677.567, 2) ���2, select round(7677.567, -3) ���3 -- ������ ���ֶܵ�ݿø�
from player_t;
--���1 : �Ҽ��� ���� ù��° �ڸ����� �ݿø�, ������ ���
--���2 : �Ҽ��� ��°�ڸ����� ǥ��, �Ҽ��� ��°�ڸ����� �ݿø�
--���3 : ���� �ڸ����� �ݿø�

select trunc(7677.567) ���1, trunc(7677.567, 2) ���2, trunc(7677.567, -3) ���3 -- trunc �Լ��� �Ҽ��� ������ �Լ�
from dual;
-- ���1 : �Ҽ��� ���� ù��° �ڸ����� �߸�. ��, �Ҽ����� ������ �� �߸�. 
-- ���2 : �Ҽ��� ���� �ι��� �ڸ��� ����� �߸�. ��, �Ҽ��� ���� ����° �ڸ����� �߸�.
-- ���3 : ���� �ڸ����� �߸�. 


-- ceil : �־��� ������ ū ���� �߿� ���� ���� ����.
-- floor : �־��� ������ ���� ���� �߿� ���� ū ����.

select ceil(3.3) -- 3.3���� ���� ū �� �߿� ���� ���� ������ �� : 4
from dual;

select ceil(3.3), floor(3.3) -- ���� �������� ���� ū ��
from dual;

select ceil(-3.3), floor(-3.3) -- ���� �������� ���� ū ��
from dual;

select 100/3 from dual; -- ��(����+�Ҽ���)
select trunc(100/3) from dual; -- �Ҽ��� ����, �� ���ϱ�     ��(����)

select mod(100, 3) from dual; -- mod �Լ��� , �� �����ϱ�!

-- sign(x) �Լ� : x���� 0���� ������(����) -1, 0�̸� 0, 0���� ũ��(���) 1�� ��ȯ
--         ��� �Լ��� ������� ���������� �Ǵ��� �� �����ϰ� ���
select sign(3/7500), sign(15*0), sign(1-85000)
from dual;



























