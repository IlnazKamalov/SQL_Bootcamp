select pizzeria.name as pizzeria_name
from person_visits
	join person on person_visits.person_id = person.id
	join menu on person_visits.pizzeria_id = menu.pizzeria_id
	join pizzeria on menu.pizzeria_id = pizzeria.id
where person.name = 'Dmitriy' and visit_date = '2022-01-08' and price < 800
