# graphs/ contains .edges files. From those we generate .sql files (to fill
# the `edges` table) and .dot files (so we can generate .svg files to
# display in the README).
EDGES := $(wildcard graphs/*.edges)
SVGS := $(EDGES:.edges=.svg)
SQLS := $(EDGES:.edges=.sql)

.PHONY: all
all: $(SVGS) $(SQLS) README.md

graphs/%.sql: graphs/%.edges bin/edges2sql
	bin/edges2sql <$< >$@

.PRECIOUS: graphs/%.dot
graphs/%.dot: graphs/%.edges bin/edges2dot
	bin/edges2dot <$< >$@

graphs/%.svg: graphs/%.dot
	dot -Tsvg <$< >$@

README.md: README.template.md $(SVGS) bin/make-readme
	bin/make-readme <$< >$@
