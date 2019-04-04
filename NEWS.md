## 2.4.0

* `aur-build`
  + add `--ignorearch` to `makepkg --noprepare -od` (`--pkgver`)
  + remove `--delta`
* `aur-chroot`
  + add `--host-conf` (experimental)
* `aur-fetch`
  + do not print diffs to `stdout` unless `--verbose` is specified
  + remove support for `tar` archives
  + rename `--log-dir` to `--write-log`
* `aur-repo-filter`
  + remove `expac` dependency
* `aur-repo`
  + add `--pacman-conf`
  + remove `expac` dependency
* `aur.1`
  + add example `aur-gc`, `aur-remove` scripts
* `Makefile`
  + allow overriding `AUR_LIB_DIR` at build time

## 2.3.1 - 2019-02-21

* `aur-build`
  + add `--results`
* `aur-sync`
  + documentation updates (#350, #507)
  + ask for confirmation if `PAGER` is set (#530)
* `aur-repo-filter`
  + documentation updates (#438)

## 2.3.0 - 2019-02-18

* `aur-build`
  + add `--holdver` to makepkg with `--pkgver`
  + exit 2 if `db_path` is not found
* `aur-repo-filter`
  + support versioned packages (#404)
  + remove `--repo` alias to `--database`
* `aur-srcver`
  + remove `--noprepare` from default makepkg options
  + add `--noprepare` option (#523)
* `aur-sync`
  + wrap repo-add `-R` (#521)
  + add `--no-graph` (workaround for #516)
* `aur-vercmp`
  + add `-q`/`--quiet`
  + rename `--equal` to `--current`
* `completions`
  + group options by type (#520)
  + complete `aur-depends` options (#526)
  
## 2.2.1 - 2019-01-25

* `aur-build`
  + add `--holdver` to `makepkg` options if `--pkgver` is enabled
* `aur-repo`
  + do not include `repo:` in error messages
  + `--all` implies `--upgrades`
* `aur-sync`
  + `cd` before invoking `$PAGER` (#518)
* `aur-repo-filter`
  + if `stdin` is connected to a terminal, mention this on `stderr`
* `aur-rpc`
  + if `stdin` is connected to a terminal, mention this on `stderr`
* `aur-vercmp`
  + if `stdin` is connected to a terminal, mention this on `stderr`

## 2.2.0 - 2019-01-22

* `aur`
  + update `CacheDir` instructions in `aur(1)`
* `aur-build`
  + rename `--run-pkgver` to `--pkgver`, remove `LANG=C` from `makepkg -od`
  + remove `~` package backup on `--force` (#444)
  + propagate `--pacman-conf` to `pacman-conf` (local builds)
  + unset `PKGDEST` prior to running `makepkg` (#513)
  + remove `--rmdeps` from default options (#508)
* `aur-fetch`
  + expose AUR URL through `AUR_LOCATION` environment variable
* `aur-pkglist`
  + do not require `-P` for regex match
  + Expose AUR URL through `AUR_LOCATION` environment variable
* `aur-rpc`
  + add `--rpc-ver`, `--rpc-url`
  + Expose AUR URL through `AUR_LOCATION` environment variable
* `aur-search`
  + exit 1 on no results
  + exit 2 on AUR error (e.g. "too many results")
  + Expose AUR URL through `AUR_LOCATION` environment variable
* `aur-sync`
  + add `--pkgver` (`aur-build --pkgver`)
  + remove `--rmdeps` from default options (#508)
* `completion`
  + allow `zsh run-help` to display the correct man page (#506)

## 2.1.0 - 2019-01-16

* `aur-build` 
  + `--build-command` now works correctly
  + add `--run-pkgver` to run `makepkg -od` before `makepkg --pkglist` (relevant to VCS packages)
* `aur-depends`
  + now takes input as arguments, instead from `stdin`
  + add `--table`, `--pkgbase`, `--pkgname` and `--pkgname-all` (defaults to `--pkgname`)
* `aur-search`
  + add `--raw` to display JSON output
* `aur-sync`
  + add `--ignore-file` (same as `aursync --ignore`)
  + check the (`.SRCINFO`) dependency graph before file inspection
* `aur-fetch-git` and `aur-fetch-snapshot` were removed and merged to `aur-fetch`

## 2.0.1 - 2019-01-11

* `aur-build`
  + do not export PKGDEST for non-chroot builds (#498)                               
  + add --build-command (#498)
  + man page updates (#217)
* `aur-sync`
  + add --keep-order for parallel aur-fetch

## 2.0.0 - 2019-01-10

* `aur` *(new)*
  + wrapper for the new `git(1)` based design
* `aur-build`
  + remove `repose` support, see https://bbs.archlinux.org/viewtopic.php?pid=1707649#p1707649
  + abort if updating a signed database without `-s` (#246)
  + add `AUR_REPO`, `AUR_DBROOT` environment variables (#302)
  + add `--makepkg-conf`, `--pacman-conf` (#242)
  + use `pacman-conf` instead of `pacconf`
* `aur-chroot` *(new)*
  + new tool containing the functionality of `aur-build -c`
  + support container builds without using a local repository
  + support multiple repositories
  + preserve `GNUPGHOME` (#427)
  + use `pacman-conf` instead of `pacconf`
* `aur-fetch`
  + use `HEAD@{upstream}` instead of `HEAD` for `git reset` (#349)
  + use `wget` instead of `aria2c` or `curl`
  + support diffs for `tar` snapshots (requires: `diffstat`)
* `aur-graph`
  + rewrite in awk (#361)
  + add support for virtual and versioned dependencies (#10)
* `aur-repo` *(new)*
  + manage local repositories
* `aur-rpc` *(new)*
  + send `GET` requests to `aurweb`
  + use `wget` instead of `aria2c` or `curl`
* `aur-search` 
  + add `License`, `Keyword`, `Depends`, `MakeDepends` and `CheckDepends` fields
  + add `depends`, `makedepends` search (#432)
  + add popularity to `brief` output (#420)
  + colorize if `stdout` is a terminal (#473)
  + use intersection of results for multiple terms (#328)
  + use `aur-rpc` to query `aurweb`
* `aur-sync`
  + add `AUR_PAGER` environment variable (file review, #51)
  + add `--bind-rw` (#428)
  + add `--ignore-arch` (`makepkg -A`, #309)
  + add `--nover-shallow` (only check versions for depends, #374)
  + add `--provides` (virtual dependencies, #452)
  + add `--rebuild`, `--rebuildtree` aliases (#424)
  + rename `--repo` to `--database` (#353)
  + the `--ignore` option now takes a comma-separated list of packages
  + fetch sources in parallel
  + set the default value for `AURDEST` to `$XDG_CACHE_HOME/aurutils/sync`
* `aur-srcver` *(new)*
  + print latest revision of VCS packages
* `aur-vercmp-devel` *(new)*
  + compare latest revision of VCS packages to a local repository
* `officer` *(removed)*
  + removed in favor of `pacman --config`
* `completion`
  + add `bash` completion (requires: `bash-completion`)
  + add `zsh` completion in a later release (#458)
* Fixes for known issues in `1.5.3`.
