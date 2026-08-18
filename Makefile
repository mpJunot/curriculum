TYPST ?= typst
SRC   := cv.typ
OUT   := build/cv.pdf

.PHONY: cv watch clean install-hook

## Compiler le CV
cv: $(OUT)

$(OUT): $(SRC)
	@mkdir -p build
	$(TYPST) compile $(SRC) $(OUT)
	@echo "→ $(OUT)"

## Recompiler à chaque sauvegarde
watch:
	@mkdir -p build
	$(TYPST) watch $(SRC) $(OUT)

## Nettoyer
clean:
	rm -rf build

## Refuser un commit si le CV ne compile pas
install-hook:
	@mkdir -p .git/hooks
	@printf '#!/bin/sh\n%s compile %s /dev/null || exit 1\n' "$(TYPST)" "$(SRC)" > .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "hook pre-commit installé"
