#!/bin/sh

PINENTRY_GUI=/usr/bin/pinentry-gtk-2
PINENTRY_TTY=/usr/bin/pinentry-tty

if test x"$DISPLAY" = x || test -t 0; then
  exec "$PINENTRY_TTY" ${1+"$@"}
else
  exec "$PINENTRY_GUI" ${1+"$@"}
fi
