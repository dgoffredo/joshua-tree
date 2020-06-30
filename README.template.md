<!-- Do not edit README.md directly. Edit README.template.md and run make. -->
joshua-tree
===========
<img height="300" src="joshua-tree.jpg"/><img width="400" src="joshua-tree.jpg"/>

Why
---
I [enjoy][1] graph problems, even though I'm not good at them.

What
----
These are sqlite3 scripts that perform various operations on an
`edges(child, parent)` table.

How
---
```
sqlite> .mode columns
sqlite> .headers on
sqlite> .read table.sql
sqlite> .read graphs/simple.sql
sqlite> .read max-depth.sql
node        max_depth 
----------  ----------
root        0         
A           1         
B           1         
C           2         
D           3 
```

More
----
### Graphs
GRAPHS_GO_HERE

[1]: https://dgoffredo.github.io/site/break-cycles.html
