#!/bin/sh

cd "$HOME"/Pictures/Wallpapers

current=`readlink Current.jpg`
random=$current

while test x"$random" = x"$current"; do
  random=`ls -F | grep -v '@$' | shuf | head -1`
done

ln -fs "$random" Current.jpg
