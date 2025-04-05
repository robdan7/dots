#!/usr/bin/bash
sudo pacman -S --needed - < pkglist.txt

# Download Git submodules
git submodule init
git submodule update

# Set nano as default editor in git
git config --global core.editor "nano"

# Set fish as default shell
chsh -s /usr/bin/fish

# Install yay
git clone https://aur.archlinux.org/yay-bin.git
makepkg -si --noconfirm -D ./yay-bin
rm -rf yay-bin


# Install yay packages
yay -S --sudoloop --noconfirm --needed - < pkglist.yay.txt

# Install pywal16
pipx install ./submodules/pywal16/.
pipx ensurepath

# Create symlinks
rm -rf ~/.config
mkdir ~/.config
ln -s -r $(pwd)/* ~/.config/
ln -s -r $(pwd)/.Xresources ~/.Xresources

xrdb ~/.Xresources

# Install biscuit theme for fish
fish -c "fisher install projekt0n/biscuit"

./set-wallpaper.sh install
set-wallpaper ~/.config/submodules/walls
