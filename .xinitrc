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

xbindkeys
xinput disable 9
#setxkbmap -layout no
#setxkbmap -layout no -option compose:lctrl
#setxkbmap -layout no -option ctrl:nocaps
#setxkbmap -layout no -option shift:both_capslock
xss-lock -- i3lock -i ~/Pictures/arch-linux-wallpaper.png &
autocutsel -fork &
autocutsel -selection PRIMARY -fork -buttonup &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

xcape -t 150

export EDITOR=/usr/bin/vim
export BROWSER=/home/andreas/.bin/firefox-nightly
export TERMINAL=/usr/bin/alacritty
export XDG_DATA_DIRS=/home/andreas/.local/share:/usr/local/share:/usr/share
export XDG_CONFIG_HOME=/home/andreas/.config
export SSH_AUTH_SOCK

exec i3
