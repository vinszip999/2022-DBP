--<220523 20��° ����>

-- (����) ��������� 15�����̴�. ���� 1�� �̻� �޴� ��������� 10�� �̻� �ִ� ���������� ������� 
--        �� ���̳� �ִ��� ��ȸ�Ͻÿ�. 
select ��������, count(�����ȣ)
from �������
where ���� >= 1�� -- where������ �׷��Լ�(=�����Լ�)�� ����� �� ����. 
group by ��������
having count(*) >= 10 -- having������ �׷��Լ� ��� ���� / count(*)�̳� �����ȣ�� �Ȱ���. 
order by ��������; -- 1


-- (����) ���� ������� �߿��� ���� 1�� �̻� �޴� ��������� 10�� �̻� �ִ� ���������� �������
--        �� ���̳� �ִ��� ��ȸ�Ͻÿ�. 
select ��������, count(*)
from �������
where ���� >= 1�� and ���� = '����'
group by ��������
having count(*) >= 10
order by ��������;


-- (����) K-���� �������� �� ���� ���� ���Ű�� ������ ��ȸ�ϰ�, ���� ���Ű�� ū ���� ���� �������� ��ȸ�Ͻÿ�. 
-- ���� Ǯ��
select team_id, trunc(avg(height))
from player_t
group by team_id
order by 1;

-- ������ Ǯ��
select team_id ��, trunc(avg(height), 1) �������Ű
from player_t
group by team_id -- �ܷ�Ű
order by avg(height) desc; -- 2 desc�� ����


-- (����) K-���� �������� ���Ű�� 180���� ū �������� ���Ű�� ������ ���� ��ȸ�Ͻÿ�. 
-- ���� Ǯ��
select position ������, trunc(avg(height)) ���Ű
from player_t
group by position
having trunc(avg(height)) > 180 -- X(�߸��� Ǯ��) trunc�� select�������� �����ϰ� ���� ���ؼ� ����ϰ�, ������ ���� avg �Լ��� �Ἥ ǥ���ϱ�!!
order by 1;

-- ������ Ǯ��
select position ������, trunc(avg(height), 1) ���Ű
from player_t
group by position
having avg(height) > 180; -- O(�˸��� Ǯ��)


-- (����) �������� DF�� �������� �� ���� �� �� �ִ��� ��ȸ�Ͻÿ�. 
-- ���� Ǯ��
select team_id, count(*) 
from player_t
group by team_id, position 
having position = 'DF'
order by 1;

-- ������ Ǯ��
select team_id, count(*) 
from player_t
where position = 'DF'
group by team_id
order by 1;


-- (����) ���� �̸����� 2�� �̻� ��ϵǾ� �ִ� ���������� �������� �̸��� ���� ��ȸ�Ͻÿ�. 
select player_name, count(*) -- player_name�� not null ������, �� ��Ȯ�ϰ� �ϰ� ������ player_id �Ǵ� player_name���� �־��൵ ��!!!
from player_t 
group by player_name
having count(*) >= 2
order by 1;
