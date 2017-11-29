#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

xsetroot -solid "#333333" &

# invoke global X session script
#. /etc/X11/Xsession
