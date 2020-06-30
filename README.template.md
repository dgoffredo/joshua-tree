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
sqlite> .read depth.sql
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

More
----
### Graphs
GRAPHS_GO_HERE

[1]: https://dgoffredo.github.io/site/break-cycles.html
[2]: https://www.sqlite.org/draft/lang_with.html#hierarchical_query_examples
