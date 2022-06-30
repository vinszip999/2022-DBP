--<220630 24��° ����>

-- ��������
select * from emp;
select * from dept;


select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;


-- �������� : N���� ���̺��� �����Ϸ��� N-1���� ���������� �ʿ��ϴ�. 
select * from emp;
select * from dept;
select * from locations;


-- ����̸�, �μ��̸�, �����̸��� ��ȸ
select emp.ename, dept.dname, locations.city
from emp, dept, locations -- �Ӽ� 13��
where emp.deptno = dept.deptno and
      dept.loc_code = locations.loc_code;
      
-- alias ����ؼ� �����ϰ� �ٲٱ�
select e.ename, d.dname, l.city
from emp e, dept d, locations l
where e.deptno = d.deptno and
      d.loc_code = l.loc_code;


-- ����) ����(job)�� clerk�� ������� �̸�, �޿�, ����, �μ���(deptno)�� ��ȸ�Ͻÿ�. 
select e.ename, e.sal, e.job, d.dname
from emp e, dept d
where e.deptno = d.deptno and
      e.job = 'CLERK'; -- ������ �ذ��ϱ� ���� �����̱� ������ ���� ������ �ƴ�. (���� �Ŀ��� ���� ������ �ϳ�)
      

-- ����) �μ����� SALES�� �μ��� �Ҽӵ� ����̸�, �޿��� ��ȸ�Ͻÿ�. 
select e.ename, e.sal -- �ߺ��� ���� ���� �ֱ� ������ �� emp, dept���� ������ֱ�!!
from emp e, dept d
where e.deptno = d.deptno and
      d.dname = 'SALES'; -- dname : �μ���

      
-- ����) �μ���ȣ�� 30�� �μ��� �ƴ� ��� �߿��� �޿��� 1500���� ���� �޴� ������� 
--         �̸�, �޿�, �μ���ȣ, �μ���, �ٹ����ø� ��ȸ�Ͻÿ�. 
select e.ename, e.sal, e.deptno, d.dname, l.city
from emp e, dept d, locations l
where e.deptno = d.deptno and
      d.loc_code = l.loc_code and
      e.deptno <> 30 and -- d.deptno�� ������� / !=, ^=
      e.sal > 1500; 
      

-- ����� �޿���� �� ��ް� �����޿��� �ְ�޿��� ��ȸ�Ͻÿ�. 
select * from tab;
select * from salgrade;

select e.ename, e.sal, s.grade, s.losal, s.hisal
from emp e, salgrade s
where e.sal >= s.losal and
      e.sal <= s.hisal;

-- (��� 1)      
select e.ename, e.sal, s.*
from emp e, salgrade s
where e.sal >= s.losal and
      e.sal <= s.hisal;
      
-- (��� 2)      
select e.ename, e.sal, s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
