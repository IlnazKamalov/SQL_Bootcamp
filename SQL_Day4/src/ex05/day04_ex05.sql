create view v_price_with_discount as
select 
	person.name as name,
	menu.pizza_name as pizza_name,
	price as price,
	cast (price - price * 0.1 as integer) as discount_price
from person_order
	join menu on person_order.menu_id = menu.id
	join person on person_order.person_id = person.id
order by name, pizza_name
