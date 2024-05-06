--session1
show transaction isolation level;

--session2
show transaction isolation level;

--session1
begin;

--session2
begin;

--session1
update pizzeria set rating = 1 where id = 1;

--session2
update pizzeria set rating = 2 where id = 2;

--session1
update pizzeria set rating = 1 where id = 2;

--session2
update pizzeria set rating = 2 where id = 1;

--session1
commit;

--session2
commit;
