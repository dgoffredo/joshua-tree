delete from edges;
insert into edges(child, parent)
values
    ('A', 'root')
    ,('A', 'root')
    ,('B', 'root')
    ,('C', 'A')
    ,('E', 'B')
    ,('D', 'B')
    ,('E', 'C')
    ,('F', 'D')
    ,('G', 'E')
    ,('G', 'F')
;
