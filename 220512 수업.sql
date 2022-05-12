--<220512 17��° ����>

-- ����) emp ���̺��� [����̸�, �����ȣ, �̸��� A�� ������ 'A��' ������ 'B��']���� ǥ���Ͻÿ�. 

-- ��� 1) case�� (like ������ ���)
select ename, empno, case when ename like '%A%' then 'A��'
                          else 'B��'
                     end
from emp;

-- ��� 2) case�� (instr() �Լ� ���)
select ename, empno, case when instr(ename, 'A') > 0 then 'A��'
                          else 'B��'
                     end
from emp;
 
-- ��� 3) decode ���
select ename, empno, decode(instr(ename, 'A', 1, 1), 0, 'B��', 'A��') -- ������ġ 1, A�� ó�� ������ ��
from emp;



-- ����) emp ���̺��� [����̸�, �޿�, �޿��� 2700���� ũ�ų� ������ 'A��', 2700 �̸��� 'B��']���� ��ȸ�Ͻÿ�. 

-- ��� 1) case ���
select ename, sal, case when sal >= 2700 then 'A��'
                        else 'B��'
                   end
from emp;

-- ��� 2) decode & trunc() ���
select ename, sal, decode(trunc(sal/2700), 0, 'B��', 'A��') -- ������ �ݴ�� �༭ 0�� �� 'B��' �������� 'A��'���� �ֱ�
from emp;

-- ��� 3) decode & sign() ���
select ename, sal, decode(sign(sal-2700), -1, 'B��', 'A��') -- sign �Լ� : ����� 1, ������ -1, 0�̸� 0
from emp;

-- �׷��Լ�(=�����Լ�)
select lower(ename) from emp; -- *������ �Լ�* / lower : �ҹ��ڷ� �ٲٴ� �Լ� (*������ �Լ��̴�!!*)
select max(ename) from emp;  -- *�׷��Լ�*

-- ** �׷�(����)�Լ��� Ư¡
-- ���� Ʃ���� ��� ó����. ������ ������ ������ table ��ü�� �ϳ��� �ָӴ�(=����)�� ��� ó����. 
select min(ename), sum(sal), min(hiredate)
from emp;
