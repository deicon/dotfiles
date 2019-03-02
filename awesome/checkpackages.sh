#!/bin/bash
pkg() {
   pkginst="$(apt list --installed | wc -l)"
   countgupd="$(apt list --upgradable | wc -l)"
   pkgupd=$((countgupd - 1))
   echo -e "Pkgs: ✔ $pkginst | ↺ $pkgupd "
}
pkg
