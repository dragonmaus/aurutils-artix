PROGNM = aurutils
PREFIX ?= /usr
SHRDIR ?= $(PREFIX)/share
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
AUR_LIB_DIR ?= $(LIBDIR)/$(PROGNM)

.PHONY: shellcheck install build completion aur

build: aur completion

aur: aur.in
	m4 -DAUR_LIB_DIR='$(AUR_LIB_DIR)' $< >$@

completion:
	@$(MAKE) -C completions bash zsh

shellcheck: aur
	@shellcheck -x -f gcc -e 2094,2035,2086,2016,1071 aur lib/*

install-aur: aur
	@install -Dm755 aur       -t '$(DESTDIR)$(BINDIR)'

install: install-aur
	@install -Dm755 lib/aur-* -t '$(DESTDIR)$(LIBDIR)/$(PROGNM)'
	@install -Dm644 man1/*    -t '$(DESTDIR)$(SHRDIR)/man/man1'
	@install -Dm644 man7/*    -t '$(DESTDIR)$(SHRDIR)/man/man7'
	@install -Dm644 LICENSE   -t '$(DESTDIR)$(SHRDIR)/licenses/$(PROGNM)'
	@$(MAKE) -C completions DESTDIR='$(DESTDIR)' install-bash install-zsh
