# =================================================================
# mlton.mk
# used to manage mlTon projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined

MLTON = mlton
MLTOPT = -verbose 1  -cc-opt -O2
MLTDIR = mltml
FP_EXE = $(MLTDIR)/$(EXE)
MLTMLB = $(PROJECT).mlb

exe: dir $(MLTDIR)/$(EXE)
dir: $(MLTDIR)
$(MLTDIR):
	mkdir -p $@

$(FP_EXE): $(MLTMLB) $(MAIN) $(DEPS)
	$(MLTON) -output $@ $(MLTOPT) $<

cleanexe:
	rm -fv $(FP_EXE)


test: exe
	$(FP_EXE) $(TEST_ARGS)

.PHONY: exe dir test cleanexe
