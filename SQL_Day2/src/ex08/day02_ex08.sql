select person.name
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
where person.gender = 'male' 
	and person.address in ('Moscow', 'Samara')
	and menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
order by name desc
