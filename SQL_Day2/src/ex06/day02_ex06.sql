select menu.pizza_name, pizzeria.name as pizzeria_name
from person_order
	full join menu on person_order.menu_id = menu.id
	full join pizzeria on menu.pizzeria_id = pizzeria.id
	full join person on person_order.person_id = person.id
where person.name = 'Anna' or person.name = 'Denis'
order by pizza_name, pizzeria_name
