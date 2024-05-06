create table person_audit(
	created timestamp with time zone default current_timestamp not null,
	type_event char(1) default 'I' not null ,
	constraint ch_type_event check(type_event in ('I', 'U', 'D')),
	row_id bigint not null,
	name varchar,
	age integer,
	gender varchar,
	address varchar
);
--trigger for function DB
create or replace function fnc_trg_person_insert_audit() returns trigger as $person_audit$
begin
	if (tg_op = 'INSERT') then
		insert into person_audit 
		select current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address;
	end if;
	return null;
end;
$person_audit$ language plpgsql;

--trigger for DB
create trigger trg_person_insert_audit
after insert on person 
for each row
	execute function fnc_trg_person_insert_audit();

--insert
INSERT INTO person(id, name, age, gender, address)
	VALUES (10,'Damir', 22, 'male', 'Irkutsk');

--check
select * from person;
select * from person_audit;
