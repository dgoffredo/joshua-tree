drop view if exists nodes;

create view nodes(node) as
    select child as node from edges
    union
    select parent as node from edges;
