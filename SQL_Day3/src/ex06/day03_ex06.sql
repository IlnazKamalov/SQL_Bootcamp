select m1.pizza_name,
	p1.name as pizzeria_name1,
	p2.name as pizzeria_name2,
	m1.price
from menu as m1
join menu as m2 on m1.price = m2.price
join pizzeria as p1 on m1.pizzeria_id = p1.id
join pizzeria as p2 on m2.pizzeria_id = p2.id
where m1.id > m2.id and m1.pizza_name = m2.pizza_name
order by pizza_name
