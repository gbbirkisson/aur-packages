<img align="right" width="128" height="128" src="logo.png">
<h1>AUR packages</h1>

These are my personal aur packages.

- [Installing a package](#installing-a-package)
- [Makefile help](#makefile-help)

## Installing a package

```console
$ export PACKAGE=enonic-cli
$ make install
```

## Makefile help

```console
$ make
Makefile targets:
  validate   Validate package
  create     Create package
  install    Install package
  uninstall  Uninstall package
  help       Show help
```