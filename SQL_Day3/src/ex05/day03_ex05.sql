select pizzeria.name as pizzeria_name
from person_visits
	join pizzeria on person_visits.pizzeria_id = pizzeria.id
	join person on person_visits.person_id = person.id
where person.name = 'Andrey'
except
select pizzeria.name as pizzeria_name
from menu
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person_order on person_order.menu_id = menu.id
	join person on person_order.person_id = person.id
where person.name = 'Andrey'
