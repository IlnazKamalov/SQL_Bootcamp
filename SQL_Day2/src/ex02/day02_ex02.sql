select
	coalesce(person.name, '-') as person_name,
	visit_date as visit_date,
	coalesce(pizzeria.name, '-') as pizzeria_name
from (select *
	from person_visits
	where visit_date between '2022-01-01' and '2022-01-03') as date
full join pizzeria on date.pizzeria_id = pizzeria.id
full join person on date.person_id = person.id
order by 1, 2, 3
