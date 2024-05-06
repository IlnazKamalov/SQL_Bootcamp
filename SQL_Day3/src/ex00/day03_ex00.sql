select menu.pizza_name as pizza_name,
	menu.price, pizzeria.name as pizzeria_name,
	person_visits.visit_date
from person_visits
join menu on person_visits.pizzeria_id = menu.pizzeria_id
join person on person_visits.person_id = person.id
join pizzeria on person_visits.pizzeria_id = pizzeria.id
where person.name = 'Kate' and price between 800 and 1000
order by pizza_name, price, pizzeria_name
