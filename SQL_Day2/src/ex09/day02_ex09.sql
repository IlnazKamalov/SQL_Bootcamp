select person.name
from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
where person.gender = 'female'
  and menu.pizza_name in ('pepperoni pizza', 'cheese pizza')
group by person.name
having count(menu.pizza_name) = 2
