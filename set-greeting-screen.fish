#!/bin/fish

if test "$argv[1]" = "install"
	sudo cp set-greeting-screen.fish /usr/local/bin/set-greeting-screen
	exit
end

set WALLPAPER (cat $HOME/.cache/wal/wal | string collect)
sudo rm -f /etc/lightdm/*.jpg
sudo rm -f /etc/lightdm/*.png
sudo cp $WALLPAPER /etc/lightdm/
sudo fish -c "echo [Greeter]\nbackground=/etc/lightdm/$(basename $WALLPAPER) > /etc/lightdm/slick-greeter.conf"
