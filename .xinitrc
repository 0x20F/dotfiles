#!/bin/sh

#: ix-config
#: to: $HOME


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




# Speed up key presses and response
xset r rate 200 25 &

# Lower the resolution ( better battery, performace on a 4k panel )
# The system will run mostly on the mesa GPU instead of the dedicated one so it's better
xrandr --output eDP-1 --mode 2560x1600

# Keyboard layout
setxkbmap se

# Scaling
export GDK_SCALE="1"
export GDK_DPI_SCALE="0.65"

exec bspwm
