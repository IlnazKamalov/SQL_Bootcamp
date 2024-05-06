--session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';

--session2
select * from pizzeria where name = 'Pizza Hut';

--session1
commit;

--session2
select * from pizzeria where name = 'Pizza Hut';