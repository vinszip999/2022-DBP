--<220420 14��° ����>

-- ��ȯ �Լ�
select '00700', 00700
from dual;

-- ������ ����(��Ģ����), ������ ����(���� ����)

select '00700' + 500 from dual; -- intger�� ����!!!! �տ� ���ڿ��� intger�� ��ȯ�Ͽ� �����!!!
-- '00700'�� ���������� ���ڿ��� ���ڷ� ��ȯ�Ͽ� ó����. 

-- ����) k-���׿��� player_id�� 1997051�� �����̸��� Ű�� ��ȸ�Ͻÿ�.
-- ���� Ǯ�� ���� � Ÿ������ Ȯ���ϱ�!!!
desc player_t; -- player_id�� char ����Ÿ���̴�.

select player_name, height
from player_t
-- where player_id = '1997051';
where player_id = 1997051; -- *������ �ȳ�* �����Ϸ��� �ڵ����� ���ڿ��� ó������**!!


alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- �� ���� �� �����ϰ� �����ϱ�!

-- to_char(date) : ��¥ ���� �� �ʿ��� �Ϻο�Ҹ� �����ؼ� ����� �� ����. 
select to_char(sysdate)
from dual;

select sysdate, to_char(sysdate, 'day') from dual; -- ����
select sysdate, to_char(sysdate, 'd') from dual; -- ������ �߿� ��ĥ °(�Ͽ���:1, ������:2, ȭ����:3,....)
select sysdate, to_char(sysdate, 'dd') from dual; -- �Ѵ� �� ��ĥ
select sysdate, to_char(sysdate, 'ddd') from dual; -- �ϳ� �� ��ĥ
select sysdate, to_char(sysdate, 'yyyymm') from dual; -- 200404
select sysdate, to_char(sysdate, 'mmdd') from dual; -- 0420
select sysdate, to_char(sysdate, 'ss') from dual;
select sysdate, to_char(sysdate, 'sssss') from dual; -- �������� �� �ʰ� �귶����

-- 2050�� �ĸ����� �����ΰ� (������ ������)

select 'vins', to_char(to_date('2004-11-29', 'yyyy-mm-dd'), 'day')
from dual;

select 'ũ��������', to_char(to_date('2022-12-24', 'yyyy-mm-dd'), 'day')
from dual;

-- to_char(number) : ���� ǥ������ ���� ex) õ�ڸ� ��ǥ, ���̳ʽ� �� ǥ�� ex) 1,000, -123, 123-, <123>
select 12345, to_char(12345) from dual;
select 12345, to_char(12345, '999,999') from dual; -- 12345 -> 12,345
select 12345, to_char(12345, '000,000') from dual; -- 012,345 �� ���ڸ� �� 0���� ä��
select 12345, to_char(-12345, '999,999') from dual; -- -12345
select 12345, to_char(-12345, '999,999mi') from dual; --  -�� �ڿ� ����
select 12345, to_char(-12345, '999,999pr') from dual; --  ���п��� - ǥ�����
select 12345, to_char(-12345, '000,000') from dual; -- ���п��� - ǥ�����
select 12345, to_char(1234567, '999,999') from dual; -- *�����߻�* #���� ����
select 12345, to_char(1234567, '999,999,999') from dual; -- *�ڸ��� �÷��༭ # ���� ��ġ��*
