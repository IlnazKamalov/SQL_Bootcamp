--session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin transaction isolation level repeatable read;

--session2
begin transaction isolation level repeatable read;

--session1
select sum(rating) from pizzeria;

--session2
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;

--session1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--session2
select sum(rating) from pizzeria;
