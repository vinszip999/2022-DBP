-- <220425 16��° ����>
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss'; -- �� ���� �� �����ϰ� �����ϱ�! (��¥ format �ٲٱ�)

-- ����) K-������ ��� �������� ���� ������ ���� �������� ��ȸ�Ͻÿ�. 
select player_name, birth, to_char(to_date('2022' || to_char(birth, 'mmdd'), 'yyyymmdd'), 'day')
from player_t
where birth is not null; -- ������ �ִ� ����鸸 ������

-- ������ �Լ� ����
-- 1. nvl(�񱳴��, null�� �� ������) : null ���� �ٸ� ������ �������ִ� �Լ�
select ename, sal, comm, nvl(comm, 0) + 100
from emp;

select ename, sal, comm, sal + comm -- null ���� ���ϸ� ��� ���� null
from emp;

select ename, sal, comm, sal + nvl(comm, 0) -- nvl �Ἥ �ذ�
from emp;

select ename, sal, nvl(comm, -7)
from emp;

-- (����)
select ename, sal, comm
from emp;

select ename, sal, comm, nvl(comm, '������') -- ���� �߻� : ������ Ÿ���� ��ġ �����־�� ��. 
from emp;

select ename, sal, comm, nvl(to_char(comm), '������') -- ���������� ����
from emp;

-- 2. nvl2(�񱳴��, null�� �ƴ� �� ��, null�� �� ��)
select ename, comm, nvl2(comm, 9999, 1111)
from emp;

select ename, comm, nvl2(comm, comm+100, 500)
from emp;

-- 3. nullif(�񱳴��, �񱳰�) : �񱳴�� = �񱳰� �� ��쿡 null
select ename, deptno, comm, nullif(deptno, 30) -- 30�� �μ��� null ó��
from emp;

-- 4. case ǥ���� - switch case��
select ename, deptno, case when deptno = 30 then 'A��'
                           when deptno = 20 then 'B��'
                           when deptno = 40 then 'C��'
                           else 'F��'
                        end
from emp;

-- 5. decode(�񱳴��, ��1, ó��1, ��2, ó��2, ��3, ó��3, ..... ��N, ó��N,   ��Ÿó��) // �տ� ������ �������� ������ ��Ÿó��
select ename, deptno, decode(deptno, 30, 'A��', 20, 'B��', 40, 'C��',   'F��')
from emp;

-- ����) emp ���̺��� [����̸�, �����ȣ, �̸��� A�� ������ 'A��' ������ 'B��']���� ǥ���Ͻÿ�. 


