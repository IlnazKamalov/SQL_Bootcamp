--session1
begin transaction isolation level read committed;

--session2
begin transaction isolation level read committed;

--session1
select sum(rating) from pizzeria;

--session2
update pizzeria set rating = 1 where name = 'Pizza Hut';
commit;

--session1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--session2
select sum(rating) from pizzeria;
