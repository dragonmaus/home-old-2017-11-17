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

master_key=`head -1 <"$HOME"/.secret/master_key`
eval `keychain --agents gpg,ssh --eval --quiet "$master_key" id_rsa`

case $LOGNAME in
*-)
  LOGNAME=${LOGNAME%-}
  USER=${USER%-}
  exec sway
  ;;
esac
