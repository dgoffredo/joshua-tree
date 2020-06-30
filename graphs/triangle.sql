delete from edges;
insert into edges(child, parent)
values
    ('A', 'root')
    ,('A', 'root')
    ,('B', 'root')
    ,('A', 'B')
;
