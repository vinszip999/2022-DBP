--<220418 13��° ����>

-- 6. trunc(), round() �Լ����� ����
--trunc() : �Ҽ��� ���� �ڸ�, round() : �ݿ縲

alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- �����ϰ� �����ϱ�!

select sysdate, trunc(sysdate) ���1, trunc(sysdate, 'mm') ���2, trunc(sysdate, 'yy') ���3 -- ��, ��, �� ������ ��, ��, �� �߸�!!
from dual;

--round �Լ��� �ݿø�. �� 12�ø� �������� �������� ��ȯ
select sysdate, round(sysdate)
from dual;

select sysdate, round(sysdate) ���1, round(sysdate, 'mm') ���2
from dual;

select sysdate, round(sysdate) ���1, round(sysdate, 'mm') ���2 -- 4�� 15�� �߸� (4�� 1�Ϸ� ���) / 4�� 16�� (5�� 1�Ϸ� ���)!!
from dual;

select sysdate, round(sysdate) ���1, round(sysdate, 'mm') ���2, trunc(sysdate, 'yy') ���3
from dual;


-- ����) k-����
-- k-���� ������ �߿��� �������� 'GK'�� �������� �̸�, ����, 70��° ������ �������� ��ȸ�Ͻÿ�. 
desc player_t;

-- ��� 1)
-- 4�⸶�� ������ �߻�, ��¥�� ������ �߻���. 
select player_name, birth, birth + (365*70) -- round(birth, 'mm' + 70) -- round(sysdate, player_id)
from player_t
where position = 'GK';

-- ���2)
select player_name "�̸�", birth "����", add_months(birth, 12*70) "ĥ��"
from player_t
where position = 'GK';

-- ���� ĥ���� �������� ���ϱ�

-- to_date : ���ڿ��� date�Լ��� �ٲ���
select 'vins', add_months(to_date('2004-11-29', 'yyyy-mm-dd'), 12*70) "ĥ��" -- 2004-11-29 "����", add_months(2004-11-29, 12*70) "ĥ��"
from dual;


-- ����) player_t �������� �̸�, ����, �� ���̸� ���ϼ���. (�۳� �����򰡿� ���Դ� ����!!!!)
-- ex) 27�� 3����
select player_name, birth, '��' || trunc(months_between(sysdate, birth) / 12) || '��' || -- || : �ٿ��ֱ�
                trunc(mod(months_between(sysdate, birth), 12))  || '����'
from player_t;




















