with MaleVisits as 
	(select pizzeria.name as pizzeria_name
    from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
    where person.gender = 'male'
), FemaleVisits as 
	(select pizzeria.name as pizzeria_name
    from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
	where person.gender = 'female')
	
(select * from FemaleVisits except all select * from MaleVisits)
union all
(select * from MaleVisits except all select * from FemaleVisits)
order by pizzeria_name
