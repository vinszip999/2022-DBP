--<220707 26��° ����>

-- (����) ����� �̸��� �� ����� ��� �̸��� ��ȸ�Ͻÿ�. 

-- self ���� : �ڱ� �ڽ��� ���̺�� �����ϴ� ���
select s.ename ����̸�, m.ename ����̸�
from emp s, emp m
where s.mgr = m.empno;

-- ��簡 ���� ������ ��� ����ϼ���. : left outer join (�����ʿ� + ����)
select s.ename ����̸�, m.ename ����̸�
from emp s, emp m
where s.mgr = m.empno(+); -- left outer ����!!

-- ���������� ���� ������ ��� ����ϼ���. : right outer join (���ʿ� + ����)
select s.ename ����̸�, m.ename ����̸�
from emp s, emp m
where s.mgr(+) = m.empno; -- right outer ����!!


-- ���̺� �����
delete from emp
where empno = 9999;


-- (����) ����̸��� 'S'�� ����ִ� ����� �̸�, �޿�, �޿������ ��ȸ�Ͻÿ�. 

-- (��� 1)
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal >= s.losal and e.sal <= s.hisal) and -- ���� ����
        e.ename like '%S%'; -- ������ �ذ��ϱ� ���� ����

-- (��� 2) between �����ڸ� ���
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal between s.losal and s.hisal) and -- ���� ����
        e.ename like '%S%'; -- ������ �ذ��ϱ� ���� ����

-- (��� 3) instr �����ڸ� ���
select e.ename, e.sal, s.grade 
from emp e, salgrade s
where (e.sal between s.losal and s.hisal) and -- ���� ����
        instr(e.ename, 'S', 1, 1) > 0; -- ������ �ذ��ϱ� ���� ����


-- (����) player_t���� ���� �̸��� _ ���ڰ� ���Ե� �����̸�, �����̸��� ��ȸ�Ͻÿ�. 

-- (��� 1) escape ���
select player_name, e_player_name
from player_t
where e_player_name like '%$_%' escape '$'; -- $ ��ȣ�� �ǹ� ����!

-- (��� 2) instr ���
select player_name, e_player_name
from player_t
where instr(e_player_name, '_', 1, 1) > 0;


-- (����) �޿� ����� 4����� ����� �̸�, �޿�, �޿����, �μ����� ��ȸ�Ͻÿ�. 
select e.ename, e.sal, s.grade, d.dname
from emp e, dept d, salgrade s
where (e.deptno = d.deptno) and -- ���� ����1
        (e.sal between s.losal and s.hisal) and -- ���� ����2
        s.grade = 4; -- ������ �ذ��ϱ� ���� ����


-- (����) �Ի����ڰ� 1981�� 11�� 20�� ���� 3�� 17�� 20�� ���Ŀ� �Ի��� ������� �̸�, �Ի���, ����̸�, ����� �Ի����ڸ� ��ȸ�Ͻÿ�. (self ����)
select s.ename ����̸�, s.hiredate �Ի���, m.ename ����̸�, m.hiredate ����Ի���
from emp s, emp m
where (s.mgr = m.empno) and -- ���� ����
        (to_date('1981-11-20:15:17:20', 'yyyy-mm-dd:hh24:mi:ss') <= s.hiredate); -- ������ �ذ��ϱ� ���� ����
