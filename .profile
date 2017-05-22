set -a

EDITOR=vi
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PATH=$PATH:$HOME/bin:$HOME/sbin:$HOME/xbin:$HOME/.local/bin

set +a

eval `keychain --eval --quiet id_rsa`
