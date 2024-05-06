select
	po.name,
    coalesce(po.count, 0) + coalesce(pv.count, 0) as total_count
from
    (
        select
            p.name,
            count(p.id) as count,
            'visit' as action_type
        from person_visits pv
        join pizzeria p on pv.pizzeria_id = p.id
        group by name
    ) as po
	full join
    (
        select
            p.name as name,
            count(p.id) as count,
            'order' as action_type
        from person_order po
        join menu m on po.menu_id = m.id
        join pizzeria p on m.pizzeria_id = p.id
        group by name
    ) as pv
    on po.name = pv.name
order by total_count desc, name
