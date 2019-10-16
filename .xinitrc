#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/firefox-nightly
export TERMINAL=/usr/bin/st
xbindkeys
xinput disable 9
setxkbmap -layout no -option compose:lctrl
setxkbmap -layout no -option ctrl:nocaps
xss-lock -- i3lock -k -B 5 --insidecolor=ffffffbf &
autocutsel -fork &
autocutsel -selection PRIMARY -fork -buttonup &
exec i3
