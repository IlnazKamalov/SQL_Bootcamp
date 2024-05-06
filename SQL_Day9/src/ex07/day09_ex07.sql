create or replace function func_minimum(variadic arr numeric[]) returns numeric as $$
	begin
    	return (select min(i) from unnest(arr) as i);
	end;
$$ language plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
