create index idx_person_name on person(upper(name));

set enable_seqscan = off;

explain analyse
    select id
    from person
    where name = 'ELVIRA'
