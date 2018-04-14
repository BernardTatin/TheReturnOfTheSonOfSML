# =================================================================
# main.mk
# used to manage  PolyML projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined


MAIN = $(PROJECT).sml
EXE = $(PROJECT).exe
ARCHIVE = $(PROJECT).tar.gz

POLYML = polyc
POLDIR = polyml
POLEXE = $(POLDIR)/$(EXE)

MLTON = mlton
MLTOPT = -verbose 1  -cc-opt -O2
MLTDIR = mltml
MLTEXE = $(MLTDIR)/$(EXE)
MLTMLB = $(PROJECT).mlb

all: polexe mltexe

polexe: poldir $(POLEXE)
poldir: $(POLDIR)
$(POLDIR):
	mkdir -p $@
.PHONY: polexe poldir

$(POLEXE): polyMain.sml $(MAIN) $(DEPS)
	$(POLYML) -o $@ $<

mltexe: mltdir $(MLTDIR)/$(EXE)
mltdir: $(MLTDIR)
$(MLTDIR):
	mkdir -p $@
.PHONY: mltexe mltdir

$(MLTEXE): $(MLTMLB) $(MAIN) $(DEPS)
	$(MLTON) -output $@ $(MLTOPT) $<

smallclean:
	rm -fv $(POLEXE) $(MLTEXE)

clean: smallclean
	rm -fv ../$(ARCHIVE)

archive: smallclean
	cd ..; tar czf $(ARCHIVE) $(PROJECT)

install: $(POLYEXE)
	mkdir -p $(PREFIX)/bin
	cp $< $(PREFIX)/bin

uninstall:
	rm -fv $(PREFIX)/bin/$(EXE)

testpoly: polexe
	$(POLEXE) $(TEST_ARGS)

testmlt: mltexe
	$(MLTEXE) $(TEST_ARGS)

.PHONY: all smallclean clean archive install
.PHONY: testpoly testmlt
