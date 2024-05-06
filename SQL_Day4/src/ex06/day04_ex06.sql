create materialized view mv_dmitriy_visits_and_eats as
select pizzeria.name as pizzeria_name
from person_visits
	join pizzeria on person_visits.pizzeria_id = pizzeria.id
	join menu on person_visits.pizzeria_id = menu.pizzeria_id
	join person on person_visits.person_id = person.id
where person.name = 'Dmitriy' and visit_date = '2022-01-08' and price < 800
order by pizzeria_name
