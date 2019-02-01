# =================================================================
# mlton.mk
# used to manage mlTon projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined

MLTON = mlton
MLTOPT = -verbose 1  -cc-opt -O2
MLTDIR = mltml
MLTEXE = $(MLTDIR)/$(EXE)
MLTMLB = $(PROJECT).mlb

mltexe: mltdir $(MLTDIR)/$(EXE)
mltdir: $(MLTDIR)
$(MLTDIR):
	mkdir -p $@
.PHONY: mltexe mltdir

$(MLTEXE): $(MLTMLB) $(MAIN) $(DEPS)
	$(MLTON) -output $@ $(MLTOPT) $<

cleanmlt:
	rm -fv $(MLTEXE)

.PHONY: cleanmlt

testmlt: mltexe
	$(MLTEXE) $(TEST_ARGS)

.PHONY: testmlt



