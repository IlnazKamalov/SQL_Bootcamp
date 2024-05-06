with MaleOrders as 
	(select pizzeria.name as pizzeria_name
    from person_order   
		join menu on person_order.menu_id = menu.id
		join person on person_order.person_id = person.id
		join pizzeria on menu.pizzeria_id = pizzeria.id
    where person.gender = 'male'
), FemaleOrders as 
	(select pizzeria.name as pizzeria_name
    from person_order   
		join menu on person_order.menu_id = menu.id
		join person on person_order.person_id = person.id
		join pizzeria on menu.pizzeria_id = pizzeria.id
	where person.gender = 'female')
	
(select * from FemaleOrders except select * from MaleOrders)
union all
(select * from MaleOrders except select * from FemaleOrders)
order by pizzeria_name
