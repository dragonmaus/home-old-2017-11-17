#!/bin/sh

dir=`dirname "$0"`
cd "$dir"

for d in */*; do
  if test -d $d; then
    printf '\e[1;31m%s\e[m/\e[1;32m%s\e[m\n' ${d%%/*} ${d##*/} && (command cd $d && exec git pull)
  fi
done
