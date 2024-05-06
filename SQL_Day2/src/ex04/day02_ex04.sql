select pizzas.pizza_name,
	   pizzeria.name as pizzeria_name, price
from
	(select * from menu
		where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza') as pizzas
full join pizzeria on pizzas.pizzeria_id = pizzeria.id where pizzas.pizza_name is not null
order by pizza_name, pizzeria_name
