# =================================================================
# main.mk
# used to manage PolyML and mlTon projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined


MAIN = $(PROJECT).sml
EXE = $(PROJECT).exe
ARCHIVE = $(PROJECT).tar.gz

compiler ?= poly

ifeq ($(compiler),poly)
include ../mk/poly.mk
else ifeq ($(compiler),mlton)
include ../mk/mlton.mk 
endif

all: exe

smallclean: cleanexe

clean: smallclean
	rm -fv ../$(ARCHIVE)

archive: smallclean
	cd ..; tar czf $(ARCHIVE) $(PROJECT)

install: $(FP_EXE)
	mkdir -p $(PREFIX)/bin
	cp $< $(PREFIX)/bin

uninstall:
	rm -fv $(PREFIX)/bin/$(EXE)

.PHONY: all smallclean clean archive install
