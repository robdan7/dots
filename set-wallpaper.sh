#!/bin/fish

if  test "$argv[1]" = "help"
	printf "\nset-wallpaper.sh by Jack Mechem\nhttps://github.com/JackMechem\n\n\n Usage: set-wallpaper [ Directory/to/wallpaper.jpg | help | install ]\n\n"
	printf "help - Help page\ninstall - Copies the script into /usr/local/bin (requires sudo)\n\n\n"
	exit
end

if test "$argv[1]" = "install"
	sudo cp set-wallpaper.sh /usr/local/bin/set-wallpaper
	exit
end

wal -i $argv[1] -n --cols16 -q -e --recursive

set WALLPAPER (cat $HOME/.cache/wal/wal | string collect)

feh --bg-scale "$WALLPAPER"
