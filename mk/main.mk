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

all: $(EXE)

$(EXE): $(MAIN) $(DEPS)
	$(POLYML) -o $(EXE) $(MAIN)


smallclean:
	rm -fv $(EXE)

clean: smallclean
	rm -fv ../$(ARCHIVE)

archive: smallclean
	cd ..; tar czf $(ARCHIVE) $(PROJECT)

install: $(EXE)
	mkdir -p $(PREFIX)/bin
	cp $(EXE) $(PREFIX)/bin

uninstall:
	rm -fv $(PREFIX)/bin/$(EXE)

test: $(EXE)
	./$(EXE) $(TEST_ARGS)

.PHONY: all smallclean clean archive install
