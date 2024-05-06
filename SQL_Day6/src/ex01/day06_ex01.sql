insert into person_discounts

select
	row_number() over() as id,
	person_order.person_id,
	menu.pizzeria_id,
	(
		case
			when count(person_order.person_id) = 1 then 10.5
			when count(person_order.person_id) = 2 then 22
			else 30
		end
	) as discount
from person_order
join menu on person_order.menu_id = menu.id
group by person_id, pizzeria_id
