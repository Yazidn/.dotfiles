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

# Keymap
setxkbmap -layout fr,ar -option grp:win_space_toggle &

# Keybindings
xbindkeys &

# Wallpaper
~/.fehbg &

# Execute DWM
panx &

# Compositor
picom &

exec dwm

# Auto restart DWM on quit (Shift + Alt + Q)
# while true; do
#    dwm >/dev/null 2>&1
# done

# Execute Openbox
# exec openbox-session
