drop table if exists nodes;
create table if not exists nodes( 
  point1 varchar not null,
  point2 varchar not null,
  cost int not null
);

insert into nodes values
		  ('a','b', 10),
		  ('b','a', 10),
		  ('a','d', 20),
		  ('d','a', 20),
		  ('a','c', 15),
		  ('c','a', 15),
		  ('b','d', 25),
		  ('d','b', 25),
		  ('b','c', 35),
		  ('c','b', 35),
		  ('c','d', 30),
		  ('d','c', 30);

with three as (
    select distinct point1
    from nodes
    where point1 != 'a'
), recursive_request as (
    select p1.point1 as r1, p2.point1 as r2, p3.point1 as r3
    from three p1
    cross join three p2
    cross join three p3
    where p1.point1 != p2.point1
      and p1.point1 != p3.point1
      and p2.point1 != p3.point1
), routes as (
    select rr.r1, rr.r2, rr.r3, 'a' as let4, (n1.cost + n2.cost + n3.cost + n4.cost) as route_cost
    from recursive_request rr
    join nodes n1 on n1.point1 = 'a' and n1.point2 = rr.r1
    join nodes n2 on n2.point1 = rr.r1 and n2.point2 = rr.r2
    join nodes n3 on n3.point1 = rr.r2 and n3.point2 = rr.r3
    join nodes n4 on n4.point1 = rr.r3 and n4.point2 = 'a'
)

select routes.route_cost as total_cost, concat('{','a',',', r1, ',', r2, ',', r3, ',', 'a','}') as tour
from routes
where route_cost = (
    select MIN(route_cost)
    from routes
) union
select routes.route_cost as total_cost, concat('{','a',',', r1, ',', r2, ',', r3, ',', 'a','}') as tour
from routes
where route_cost = (
    select MAX(route_cost)
    from routes
)
order by total_cost, tour;
