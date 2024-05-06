insert into person_visits
values (
        (select max(id) from person_visits) + 1,
        (select id from person where name = 'Dmitriy'),
        (select distinct pizzeria.id from pizzeria
            join menu on pizzeria.id = menu.pizzeria_id
            join mv_dmitriy_visits_and_eats as mv on mv.pizzeria_name != pizzeria.name
        where menu.price < 800 limit 1), '2022-01-08'
		);

refresh materialized view mv_dmitriy_visits_and_eats;
