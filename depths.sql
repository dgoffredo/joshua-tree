drop view if exists depths;

create view depths(node, min_depth, max_depth) as
    with recursive depths(node, depth) as (
        values ('root', 0)
        union
        select edges.child as node, depths.depth + 1 as depth
        from edges inner join depths
            on edges.parent = depths.node)
    select node, min(depth) as min_depth, max(depth) as max_depth
    from depths
    group by node
    order by min_depth;
