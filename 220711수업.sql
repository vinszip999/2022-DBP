--<220711 27��° ����>

-- (����) ������ ��纸�� �޿��� �� ���� �޴� ����̸�, ����޿�, ����̸�, ���޿��� ��ȸ�Ͻÿ�. (self ����)
select s.ename ����̸�, s.sal ����޿�, m.ename ����̸�, m.sal ���޿�
from emp s, emp m -- ���� ���� 
where (s.mgr = m.empno) and -- ���� ����
        (s.sal > m.sal); -- ������ �ذ��ϱ� ���� ����    


-- (����) �޿��� 2300 ���� ���� �޴� ����� �̸�, �޿�, �μ���, �ٹ���, �޿������ ��ȸ�Ͻÿ�. 

select * from tab;

select e.ename, e.sal, d.dname, l.city, s.grade
from emp e, dept d, locations l, salgrade s
where (e.deptno = d.deptno) and -- ���� ���� (����� �Ӽ� : �ܷ�Ű (����� dept))
        (d.loc_code = l.loc_code) and -- ���� ����
        (e.sal between s.losal and s.hisal) and -- ���� ����    
        (e.sal > 2300); -- ������ �ذ��ϱ� ���� ����


-- (����) �μ������� �޿��հ�, �Ҽ��ο����� ��ȸ�Ͻÿ�.
select deptno, sum(sal), count(*) 
from emp
group by deptno
order by deptno;


-- (����) �μ��� �μ������� �޿��հ�, �Ҽ��ο����� ��ȸ�Ͻÿ�. 
-- (��, �Ҽӻ���� ������ ��� �μ����� ���� �� �ֵ��� ��ȸ�Ͻÿ�.)
select d.dname, sum(e.sal), count(ename) -- count(*)�� null���� ���ڷ� ���� ������ ename���� �ٲ���. 
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname
order by 1;
