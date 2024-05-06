select
	(select name from person where id = person_visits.person_id) as person_name,
	(select name from pizzeria where id = person_visits.pizzeria_id) as pizzeria_name
from
	(select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') as person_visits
order by person_name, pizzeria_name desc