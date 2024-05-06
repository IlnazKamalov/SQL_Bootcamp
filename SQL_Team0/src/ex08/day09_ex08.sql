create or replace function fnc_fibonacci(pstop integer default 10)
	returns table(num1 integer) AS $$
	with recursive fibo(num1, num2) as
	(select 0, 1
	union all
	select num2, num1+num2
	from fibo 
	where num2 < pstop)
	select num1
	from fibo;
$$ language sql;

select * from fnc_fibonacci(20);
