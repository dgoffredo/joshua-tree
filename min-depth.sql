with recursive node_depth(node, depth) as (
    values ('root', 0)
    union
    select edges.child as node, node_depth.depth + 1 as depth
    from edges inner join node_depth
        on edges.parent = node_depth.node)
select node, min(depth) as min_depth -- or use max() for maximum depth
from node_depth
group by node
order by min_depth;
