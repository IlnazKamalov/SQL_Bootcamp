select p.name as person_name,
       m.pizza_name as pizza_name,
       pz.name as pizzeria_name
from person_order
join menu m on person_order.menu_id = m.id
join person p on p.id = person_order.person_id
join pizzeria pz on m.pizzeria_id = pz.id
order by person_name, pizza_name, pizzeria_name;