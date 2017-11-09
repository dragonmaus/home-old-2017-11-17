#!/bin/sh

cat << END
# This is a shell archive.  Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".  Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
END

for f do
  echo "#	$f"
done

echo "#"

mkdirs() (
  test x"$1" = x. && exit
  test x"$1" = x/ && exit
  d=`dirname "$1"`
  mkdirs "$d"
  echo "mkdir '$1' >/dev/null 2>&1"
)

for f do
  echo "echo x - $f"
  d=`dirname "$f"`
  mkdirs "$d"
  echo "sed 's/^X//' >$f << 'END-of-$f'"
  sed 's/^/X/' <"$f"
  echo "END-of-$f"
done

echo "exit"
echo
