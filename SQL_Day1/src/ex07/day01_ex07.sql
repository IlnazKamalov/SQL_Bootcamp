select order_date,
	concat(name, ' (age:', person.age, ')') as person_information
from person_order
join person on person.id = person_order.person_id
order by order_date, person_information