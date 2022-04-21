--<220421 15��° ����>
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- �� ���� �� �����ϰ� �����ϱ�!

-- to_date()
select sysdate, to_date(sysdate) from dual;
select to_date('12', 'yy') from dual; -- 2012
select to_date('12', 'mm') from dual; -- 2022-12-01
select to_date('12', 'ss') from dual; -- 2022-04-01 00:00:12

select to_date('2004-11-29', 'yyyy-mm-dd') from dual; -- select to_date('���ڿ�', '����') from dual;

-- to_char('��¥', 'day')
select to_date('2004-11-29', 'yyyy-mm-dd') from dual; 

select to_date('1212', 'yymm') ���1,
       to_date('1212', 'mmdd') ���2
from dual;

--to_date() �Լ� ��� �� ������
select to_date('1225', 'mmdd') from dual; -- 2022-12-25
select to_date('1225', 'yymm') from dual; -- ���� �߻� mm ���� �̻� (���� 25���� ���)
select to_date('0230', 'mmdd') from dual; -- ���� �߻� 2�� ���� 30���� �������� ����. 


-- �⵵ ���� �� ���� 2�ڸ��� ����� ���

-- 1) yy �ɼ��� sysdate �⵵ �տ� 2�ڸ��� �����.
select to_date('77', 'yy'), to_date('33', 'yy')from dual;

-- 2) rr �ɼ��� 00~49������ 20��, 50~99������ 19�� ���ڸ��� ���
select to_date('77', 'rr'), to_date('33', 'rr') from dual;


-- ����) player_t �����߿��� K10�� �������� [�̸�, ����, �¾ ����]�� ����Ͻÿ�. 
desc player_t;
select * from player_t;
-- select player_name �̸�, birth ����, player_id �¾ ���� 
select player_name �̸�, birth ����, to_char(birth, 'day') 
from player_t
where team_id = 'K10';
-- ���� birth�� ������ is not null �־��ֱ�


-- ����) �Ͽ��Ͽ� �¾ �����鸸 �̸��� ��ȸ�Ͻÿ�. 
select player_name
from player_t
--where to_date('day', 1)
where to_char(birth, 'day') = '�Ͽ���';


-- ����) K-���� �������� [�̸�, ����, ������ ȯ���� �����]���� ��ȸ�Ͻÿ�.
select player_name, birth, to_char(add_months(birth, 12*60), 'day') -- birth + (365*60) �� birth + 21900 �� ������ ����. *���� ������*
from player_t;


-- ����) 1973�� 12�� 25�Ͽ� �¾ �������� [�̸�, ����, ��ID]�� ��ȸ�Ͻÿ�.
select player_name, birth, team_id
from player_t
where to_date('1973-12-25');

-- <���ڿ� = date �񱳵� �� �ְ� ó���ϴ� ���>

-- ��� 1) ���ڿ��� ��ȯ�Ͽ� ó��
select player_name, birth, team_id
from player_t
where to_char(birth, 'yyyymmdd') = '19731225';

-- ��� 2) Date�� ��ȯ�Ͽ� ó��
select player_name, birth, team_id
from player_t
where to_date('19731225', 'yyyymmdd') = birth;


-- ����) 1975�⵵�� �¾ �������� [�̸�, ����]�� ��ȸ�Ͻÿ�.
select player_name, birth
from player_t
--where to_date('1973', 'yyyy') = birth;
where to_char(birth, 'yyyy') = '1975';

-- (����) �̿ϼ� : ���� ��¥�� �������� ���ϹǷ� 1976�� �����͵� ��µ�.
select player_name, birth
from player_t
where birth >= to_date('1975', 'yyyy') and birth < to_date('1976', 'yyyy') -- *���� ���� �߻�*
-- �ʱⰪ�� ���ó�¥�� �������� ���� 4, ��¥�� 21�Ϸ� ó���Ǳ� ������ OOO 1975.04.21 <= OOO 1976.04.21 ���� ó���Ǿ� 1975����� 1976����� ��µȴ�.


-- ����) 2099�� 12�� 25���� ���� �������� ��ȸ�Ͻÿ�.
select to_char(to_date('20991225', 'yyyymmdd'), 'day')
from dual;


-- ����) ���� ���� ������ ��������� ��ȸ�Ͻÿ�.
select to_char(to_date('20221129', 'yyyymmdd'), 'day')
from dual;


-- (�߿�) ***** : �����򰡿� ������ ���ɼ��� ���� ����.
-- ����) K-���� ������ ������ ���� ������ ���� �������� ��ȸ�Ͻÿ�.
-- *query �ѹ����� ó���ؾ���*

-- �ϳ��� ��� ���� ��� ���� ������ �� �� �����ؾ� �ϹǷ� ��ȿ������ ���
select birth
from player_t
where player_name = '������';

select to_char(to_date('20221030', 'yyyymmdd'), 'day')
from dual;

select player_name, birth, to_char(to_date('2022' || to_char(birth, 'mmdd'), 'yyyymmdd'), 'day')
from player_t
where player_name = '������';

