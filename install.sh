#!/usr/bin/bash
pacman -S --needed - < pkglist.txt

# Download Git submodules
git submodule init
git submodule update

# Set nano as default editor in git
git config --global core.editor "nano"

# Set fish as default shell
chsh -s /usr/bin/fish

# Install yay
makepkg -si --noconfirm -D ./submodules/yay

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

# Generate fastfetch image
mkdir ~/.cache/chafa -p
chafa  $(pwd)/chafa/Arch-Linux-UwU-Linux-2036721-4111737064.png -s 60x60 --polite true > ~/.cache/chafa/icon
