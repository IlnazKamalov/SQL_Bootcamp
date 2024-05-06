----session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin;

--session2
begin;

--session1
select * from pizzeria where name = 'Pizza Hut';

--session2
select * from pizzeria where name = 'Pizza Hut';

--session1
update pizzeria set rating = 4 where name = 'Pizza Hut';

--session2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';

--session1
commit;

--session2
commit;

--session1
select * from pizzeria where name = 'Pizza Hut';

--session2
select * from pizzeria where name = 'Pizza Hut';
