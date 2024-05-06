select 
	p.name,
	count(pizzeria_id) as count_of_orders,
	round(avg(m.price), 2) as average_price,
	max(m.price) as max_price,
	min(m.price) as min_price
from person_order po
	join menu m on m.id = po.menu_id
	join pizzeria p on p.id = m.pizzeria_id
group by name
order by name
