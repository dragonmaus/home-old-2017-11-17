set -a

EDITOR=vi
GOPATH=`go env GOPATH`
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PATH=$PATH:$HOME/bin:$HOME/sbin:$HOME/xbin:$GOPATH/bin:$HOME/.local/bin

XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=thinkpad
XKB_DEFAULT_VARIANT=dvorak
XKB_DEFAULT_OPTIONS=ctrl:swapcaps

set +a

case $LOGNAME in
*-)
  LOGNAME=${LOGNAME%-}
  USER=${USER%-}
  exec sway
  ;;
esac
