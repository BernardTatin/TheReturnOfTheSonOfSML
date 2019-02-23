# =================================================================
# main.mk
# used to manage PolyML and mlTon projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined


MAIN = $(PROJECT).sml
EXE = $(PROJECT).exe
ARCHIVE = $(PROJECT).tar.gz

PREFIX ?= ~
compiler ?= poly

ifeq ($(compiler),poly)
include ../mk/poly.mk
else ifeq ($(compiler),mlton)
include ../mk/mlton.mk
endif

all: exe

help:
	@echo "make [compiler=poly|mlton] [PREFIX=prefix_dir] [target ...]"
	@echo "    default compiler: poly"
	@echo "    default installation PREFIX: ~"
	@echo "    default target: all"
	@echo "    targets:"
	@echo "        all: compile all"
	@echo "        clean: clean all compilation results and archive"
	@echo "        test: execute tests, i.e. run the application with testing arguments '$(TEST_ARGS)'"
	@echo "        install: install binary in $(PREFIX)/bin"
	@echo "        uninstall: remove binary in $(PREFIX)/bin"
	@echo "        archive: create the ../$(ARCHIVE) with sources files"
	@echo ""
	@echo "example: make clean test"

smallclean: cleanexe

clean: smallclean
	rm -fv ../$(ARCHIVE)

archive:
	@rm -fv ../$(ARCHIVE)
	cd ..; tar czf $(ARCHIVE) --exclude-from=mk/tar.exclude $(PROJECT) lib mk LICENSE

install: $(FP_EXE)
	mkdir -p $(PREFIX)/bin
	cp $< $(PREFIX)/bin

uninstall:
	rm -fv $(PREFIX)/bin/$(EXE)

.PHONY: all smallclean clean archive install
