.read depths.sql
.read ancestors.sql
.read nodes.sql

drop view if exists diamonds;

create view diamonds(descendent, ancestor1, ancestor2, ancestor_max_depth) as
    select
        nodes.node as descendent,
        ancestors1.ancestor as ancestor1,
        ancestors2.ancestor as ancestor2,
        depths1.max_depth as ancestors_max_depth -- depths2 would work, too
    from nodes
        inner join ancestors ancestors1 on nodes.node = ancestors1.descendent
        inner join ancestors ancestors2 on nodes.node = ancestors2.descendent
        inner join depths depths1 on depths1.node = ancestors1.ancestor
        inner join depths depths2 on depths2.node = ancestors2.ancestor
    -- "<" seems strange here. The reason for it is that I want _distinct_
    -- ancestors, but additionally I want to avoid the degeneracy between
    -- (a, b) and (b, a), so I just pick (a, b), i.e. a < b
    where ancestors1.ancestor < ancestors2.ancestor
      and depths1.max_depth = depths2.max_depth;
