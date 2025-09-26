# # # # # # # # # # # # # # # # # # # #
# This makefile uses some dummy .success
# files to track when the last successful
# compilation took place. The .cfg files
# are "touched" when one of their
# dependency is updated, so that the
# makefile knows that they need to be
# re-compiled.
# # # # # # # # # # # # # # # # # # # #

all: code test

# The source of the test are the .cfg 
# files in run/ that begins with ex-
# The targets are obtained by replacing
# .cfg by .success.
TEST-SOURCES := $(wildcard run/ex-*.cfg)
TEST-TARGETS := $(patsubst %.cfg,%.success,$(TEST-SOURCES))

code: run/code.success
test: $(TEST-TARGETS)

# This rule implies that the run/code.cfg file requires the .bel files in the code/ folder.

run/code.cfg: code/*/*.bel
	@touch $@

# This rule implies that the run/ex-%.cfg files (with % being replaced by some actual name)
# require the .bel files in the examples/%/ and code/ folders.
# The % is pattern-matched on both sides, while the * is just a wildcard.

run/ex-%.cfg: examples/%/*.bel  code/*.bel
	@touch $@

run/%.success: run/%.cfg
	beluga $<
	@echo "Last successful compilation of $<:" $$(date) > $@

clean:
	rm run/*.success
