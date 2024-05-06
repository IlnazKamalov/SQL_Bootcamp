--session1
begin transaction isolation level read committed;

--session2
begin transaction isolation level read committed;

--session1
select rating from pizzeria where name = 'Pizza Hut';

--session2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

--session1
select rating from pizzeria where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';

--session2
select rating from pizzeria where name = 'Pizza Hut';
