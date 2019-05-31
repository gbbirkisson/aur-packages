PACKAGE?=not_defined
WDIR:=${PWD}/${PACKAGE}

_test:
	@cd ${WDIR} &>/dev/null || (echo "Package \"${PACKAGE}\" not found" && exit 1)

validate: _test
	@cd ${WDIR} && namcap -i PKGBUILD && updpkgsums

create: validate
	@cd ${WDIR} && rm -f *.xz && makepkg --printsrcinfo > .SRCINFO && makepkg -f

install: create
	@cd ${WDIR} && sudo pacman -U enonic-cli*.xz

uninstall:
	@sudo pacman -R ${PACKAGE}