<!-- Do not edit README.md directly. Edit README.template.md and run make. -->
joshua-tree
===========
<img width="400" src="joshua-tree.jpg"/>

Why
---
I [enjoy][1] graph problems, even though I'm not good at them.

What
----
These are sqlite3 scripts that perform various operations on an
`edges(child, parent)` table.

The [SQLite documentation on hierarchical queries][2] is informative.

How
---
```
sqlite> .mode columns
sqlite> .headers on
sqlite> .read table.sql
sqlite> .read graphs/simple.sql
sqlite> .read depths.sql
sqlite> select * from depths;
node        min_depth   max_depth 
----------  ----------  ----------
root        0           0         
A           1           1         
B           1           1         
C           2           2         
D           2           3         
sqlite> 
```

You might want to automate the running of the first three commands.
```console
$ sqlite3 -cmd '.mode columns' -cmd '.headers on' -cmd '.read table.sql'
sqlite>
```

For convenience, `init.sql` can be used with `sqlite3`'s `-init` flag.
```console
$ sqlite3 -init init.sql
sqlite>
```

Here's the punchline:
```console
$ sqlite3 -init init.sql 
-- Loading resources from init.sql
SQLite version 3.31.1 2020-01-27 19:55:54
Enter ".help" for usage hints.
sqlite> .read diamonds.sql
sqlite> .read graphs/figure-eight.sql
sqlite> select * from diamonds;
descendent  ancestor1   ancestor2   ancestor_max_depth
----------  ----------  ----------  ------------------
E           A           B           1                 
G           A           B           1                 
G           C           D           2                 
G           E           F           3                 
sqlite>
```

More
----
### Graphs
GRAPHS_GO_HERE

[1]: https://dgoffredo.github.io/site/break-cycles.html
[2]: https://www.sqlite.org/draft/lang_with.html#hierarchical_query_examples
