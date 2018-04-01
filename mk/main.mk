# =================================================================
# main.mk
# used to manage projects
# =================================================================

# here, we must have PROJECT and DEPS already defined

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

test: $(EXE)
	./$(EXE) $(TEST_ARGS)

.PHONY: all smallclean clean archive
