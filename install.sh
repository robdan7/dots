#pacman -S fisher cmake nano git polybar thunar rofi alacritty fastfetch python-pipx chafa --noconfirm
pacman -S --needed - < pkglist.txt

cd ./yay
makepkg -si--noconfirm
cd ..
yay -S librewolf-bin nwg-look ttf-jetbrains-mono-nerd --sudoloop --noconfirm

cd ./pywal16
pipx install .
pipx ensurepath
ln -s -r ./* ~/.config
ln -s -r ./.xinitrc ~/.xinitrc
ln -s -r ./.Xresources ~/.Xresources 

# Install biscuit theme for fish
fisher install projekt0n/biscuit

# Generate fastfetch image
mkdir ~/.cache/chafa -p
chafa  ./chafa/Arch-Linux-UwU-Linux-2036721-4111737064.png -s 60x60 --polite true > ~/.cache/chafa/icon

# Set nano as default editor in git
git config --global core.editor "nano"
