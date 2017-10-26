#!/bin/sh

grpfile=$HOME/etc/pacman/groups
pkgfile=$HOME/etc/pacman/packages

groups=`cat "$grpfile"`
grouped=`pacaur -Qgq $groups | sort -u`

pacaur -Qeq | sort -u >"$pkgfile"{new}
fsync "$pkgfile"{new}
if cmp -s "$pkgfile"{new} "$pkgfile"; then
  rm -f "$pkgfile"{new}
else
  mv -f "$pkgfile"{new} "$pkgfile"
fi

pacaur -D --asexplicit $grouped >/dev/null 2>&1
