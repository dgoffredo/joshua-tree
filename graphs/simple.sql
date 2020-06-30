delete from edges;
insert into edges(child, parent)
values
    ('A', 'root')
    ,('A', 'root')
    ,('B', 'root')
    ,('C', 'A')
    ,('C', 'B')
    ,('D', 'C')
    ,('D', 'B')
;
