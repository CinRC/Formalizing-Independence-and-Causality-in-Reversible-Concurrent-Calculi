# Compiling all means compiling all the cfg files in the run/ folder.

all: run/*.cfg

# Rules for the code & the tests.

code: run/code.cfg
test: run/ex-*.cfg

# This rule means that the run/code.cfg file requires the .bel files in the code/ folder
# and is compiled using beluga.

run/code.cfg: code/*.bel
	beluga $@

# This rule means that the run/ex-%.cfg files (with % being replaced by some actual name)
# require the .bel files in the examples/%/ and code/ folders and are compiled using beluga.
# The % is pattern-matched on both sides, while the * is just a wildcard.

run/ex-%.cfg: examples/%/*.bel code/*.bel
	beluga $@
