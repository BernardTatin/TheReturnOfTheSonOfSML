# =================================================================
# poly.mk
# used to manage PolyML projects
# Distributed under terms of the MIT license.
# =================================================================

# here, we must have PROJECT, DEPS and TEST_ARGS already defined

POLYML = polyc
POLDIR = polyml
POLEXE = $(POLDIR)/$(EXE)

polexe: poldir $(POLEXE)
poldir: $(POLDIR)
$(POLDIR):
	mkdir -p $@

.PHONY: polexe poldir

$(POLEXE): polyMain.sml $(MAIN) $(DEPS)
	$(POLYML) -o $@ $<

testpoly: polexe
	$(POLEXE) $(TEST_ARGS)

.PHONY: testpoly	

cleanpoly:
	rm -fv $(POLEXE)

.PHONY: cleanpoly

