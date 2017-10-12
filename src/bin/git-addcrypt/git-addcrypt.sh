#!/bin/sh

set -e

echo() {
  printf '%s\n' "$*"
}

trap -- 'rm -f .gitattributes{new} .gitattributes{tmp}' EXIT KILL INT

touch .gitattributes
rm -f .gitattributes{tmp}

(cat <.gitattributes; for f do echo "$f" filter=git-crypt diff=git-crypt; done) \
| sort -u \
>.gitattributes{tmp}

rm -f .gitattributes{new}

((grep '^/'     | sort -u) <.gitattributes{tmp}
 (grep '^[^*/]' | sort -u) <.gitattributes{tmp}
 (grep '^\*'    | sort -u) <.gitattributes{tmp}) \
>.gitattributes{new}

chmod 600 .gitattributes{new}

cmp -s .gitattributes .gitattributes{new} || mv -f .gitattributes{new} .gitattributes
