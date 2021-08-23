PACKAGE?=not_defined
WDIR:=${PWD}/${PACKAGE}

.DEFAULT_GOAL:=help
.PHONY: _test validate create install uninstall help

_test:
	@cd ${WDIR} &>/dev/null || (echo "Package \"${PACKAGE}\" not found! Set PACKAGE env var!" && exit 1)

validate: _test ## Validate package
	@cd ${WDIR} && namcap -i PKGBUILD && updpkgsums

create: validate ## Create package
	@cd ${WDIR} && rm -f *.xz && makepkg --printsrcinfo > .SRCINFO && makepkg -f

install: create ## Install package
	@cd ${WDIR} && sudo pacman -U ${PACKAGE}*.xz

uninstall: _test ## Uninstall package
	@sudo pacman -R ${PACKAGE}

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'