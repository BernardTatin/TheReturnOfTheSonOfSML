# =================================================================
# poly.mk
# used to manage PolyML projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined

ML = polyc
MLOPT =
ODIR = polyml
FP_EXE = $(ODIR)/$(EXE)

exe: dir $(FP_EXE)

dir: $(ODIR)

$(ODIR):
	mkdir -p $@


$(FP_EXE): polyMain.sml $(MAIN) $(DEPS)
	$(ML) -o $@ $<

test: exe
	$(FP_EXE) $(TEST_ARGS)


cleanexe:
	rm -fv $(FP_EXE)


.PHONY: exe dir test cleanexe
