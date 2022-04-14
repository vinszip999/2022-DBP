--<220414 12��° ����>

-- ����) �μ���ȣ�� 10, 30�� �μ��� �μ���ȣ, �޿� ���� ��ȸ�Ͻÿ�. 
select deptno, count(*), sum(sal)
from emp
--where deptno = 10 or deptno = 30
where deptno in (10, 30)
group by deptno
order by 1;
    

-- ����) �Ŵ����� ���������� ���ڸ� ����Ͻÿ�. 
-- (��, ���������� 2�� �̻��� �ִ� �Ŵ����� ���������� ���� ������� ����Ͻÿ�.)
select mgr �Ŵ���, count(*) ����������
from emp
where mgr is not null
group by mgr
having count(*) >= 2
--order by count(*) desc;
--order by 2 desc;
order by ���������� desc;


-- ����) �޿��� 2000 �̻�, 5000 ������ ������� ������ ��ձ޿��� �޿������� ���Ͻÿ�. 
-- ���� ������ �޿� ���� 6000 �̻� �޿����� ���� ������ ����Ͻÿ�. 
select job, count(*), trunc(avg(sal)), sum(sal)
from emp
--where sal >= 2000 and sal <= 5000
where sal between 2000 and 5000 -- where sal between a and b
group by job
having sum(sal) >= 6000
--order by 4 desc;
--order by count(*) desc;
order by sum(sal) desc;


-- dual ���̺�
desc dual;
select * from dual;


-- ��¥ ����
select sysdate from dual;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
commit -- ���̺� ���� ����


-- 1. ��¥ + ����

-- 100�� ���ϱ�
select sysdate ���ó�¥, (sysdate + 100) ����
from dual;

-- ������ ���ϱ�
select sysdate ���ó�¥, (sysdate + 1) ����
from dual;

-- ���� �ð��� �������� �� �ð� �ڰ� �������� ��ȸ�Ͻÿ�. 
select sysdate, sysdate + 1/24
from dual;

-- ���� �ð��� �������� 70�� �ڰ� �������� ��ȸ�Ͻÿ�. 
select sysdate, sysdate + (70/(24*60))
from dual;

-- ���� �ð��� �������� 5�� �ڰ� �������� ��ȸ�Ͻÿ�. 
select sysdate, sysdate + (5/(24*60*60))
from dual;


-- 2. add_months(��¥, ������)
select sysdate, add_months(sysdate, 10)
from dual;


-- 3. ��¥ - ��¥
select ename, hiredate, trunc(sysdate - hiredate)
from emp

-- �¾ �� ���� �������� Ȯ���ϱ�
to_date('2004-11-20', 'yyyy-mm-dd') -- to_date : string Ÿ���� date Ÿ������ �ٲ��ִ� �Լ�

select '������', trunc(sysdate - to_date('2004-11-20', 'yyyy-mm-dd'))
from dual;


-- 4. �� ��¥ ���̿� �� ������ ���������� ��ȸ�Ͻÿ�. 
select ename, hiredate, trunc(months_between(sysdate, hiredate))
from emp;

-- �¾ �� �� ������ �������� Ȯ���ϱ�
select '������', trunc(months_between(sysdate, to_date('2004-11-29', 'yyyy-mm-dd')))
from dual;


-- 5. �̹����� ������ ��
select last_day(sysdate) from emp;

-- �¾ ���� ������ �� ���ϱ�
select last_day(to_date('2004-11-29', 'yyyy-mm-dd')) from emp;
