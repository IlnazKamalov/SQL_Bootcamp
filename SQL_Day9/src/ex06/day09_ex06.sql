create or replace function fnc_person_visits_and_eats_on_date(
	in pperson varchar default 'Dmitriy',
	in pprice numeric default 500,
	in pdate date default '2022-01-08')
	returns table (name varchar) as $$
	begin
		return query
			select pizzeria.name
		from menu m
			join person_visits pv on m.pizzeria_id = pv.pizzeria_id
			join pizzeria on pizzeria.id = m.pizzeria_id
			join person p on p.id = pv.person_id
		where visit_date = pdate and p.name = pperson and m.price < pprice;
	end;
	$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
