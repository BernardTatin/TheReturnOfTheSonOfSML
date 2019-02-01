# =================================================================
# main.mk
# used to manage PolyML and mlTon projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined


MAIN = $(PROJECT).sml
EXE = $(PROJECT).exe
ARCHIVE = $(PROJECT).tar.gz

include ../mk/poly.mk 
include ../mk/mlton.mk 

all: polexe mltexe

smallclean: cleanpoly cleanmlt

clean: smallclean
	rm -fv ../$(ARCHIVE)

archive: smallclean
	cd ..; tar czf $(ARCHIVE) $(PROJECT)

install: $(POLYEXE)
	mkdir -p $(PREFIX)/bin
	cp $< $(PREFIX)/bin

uninstall:
	rm -fv $(PREFIX)/bin/$(EXE)

.PHONY: all smallclean clean archive install
.PHONY: testmlt
