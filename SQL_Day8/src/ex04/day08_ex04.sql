--session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin transaction isolation level serializable;

--session2
begin transaction isolation level serializable;

--session1
select rating from pizzeria where name = 'Pizza Hut';

--session2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;

--session1
select rating from pizzeria where name = 'Pizza Hut';
commit;
select rating from pizzeria where name = 'Pizza Hut';

--session2
select rating from pizzeria where name = 'Pizza Hut';
