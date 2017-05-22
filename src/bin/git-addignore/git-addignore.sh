#!/bin/sh

set -e

echo() {
  printf '%s\n' "$*"
}

trap -- 'rm -f .gitignore{new} .gitignore{tmp}' EXIT KILL INT

touch .gitignore
rm -f .gitignore{tmp}

(cat <.gitignore; for f do echo "$f"; done) \
| sort -u \
>.gitignore{tmp}

rm -f .gitignore{new}

((grep '^/'      | sort -u) <.gitignore{tmp}
 (grep '^[^!*/]' | sort -u) <.gitignore{tmp}
 (grep '^\*'     | sort -u) <.gitignore{tmp}
 (grep '^!'      | sort -u) <.gitignore{tmp}) \
>.gitignore{new}

chmod 600 .gitignore{new}

cmp -s .gitignore .gitignore{new} || mv -f .gitignore{new} .gitignore
