with recursive ancestors(descendent, ancestor) as (
    select child as descendent, parent as ancestor
    from edges
    union
    select child as descendent, ancestor
    from edges inner join ancestors
        on edges.parent = ancestors.descendent)
select *
from ancestors;
