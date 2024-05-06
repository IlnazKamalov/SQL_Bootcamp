select person.name,menu.pizza_name, menu.price,
	trim_scale(menu.price - (menu.price * person_discounts.discount/100)) as discount_price, pizzeria.name as pizzeria_name
      from person_order
		inner join menu on menu.id = person_order.menu_id
        inner join person on person.id = person_order.person_id
        inner join person_discounts on person.id = person_discounts.person_id and person_discounts.pizzeria_id = menu.pizzeria_id
        inner join pizzeria on menu.pizzeria_id = pizzeria.id
      order by name, pizza_name
