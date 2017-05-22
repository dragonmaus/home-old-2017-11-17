set -a

EDITOR=vi
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PATH=$PATH:$HOME/bin:$HOME/sbin:$HOME/xbin:$HOME/.local/bin

XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=thinkpad
XKB_DEFAULT_VARIANT=dvorak
XKB_DEFAULT_OPTIONS=ctrl:swapcaps

set +a

eval `keychain --eval --quiet id_rsa`
