--session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin transaction isolation level repeatable read;

--session2
begin transaction isolation level repeatable read;

--session1
select rating from pizzeria where name = 'Pizza Hut';

--session2
select rating from pizzeria where name = 'Pizza Hut';

--session1
update pizzeria set rating = 4 where name = 'Pizza Hut';

--session2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';

--session1
commit;

--session2
commit;

--session1
select rating from pizzeria where name = 'Pizza Hut';

--session2
select rating from pizzeria where name = 'Pizza Hut';
