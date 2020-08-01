#! /bin/sh +x

# Install a package manger
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri --noconfirm
cd ..
rm -fr pikaur

# Install a font set.
pikaur --noconfirm -S ttf-myrica --noconfirm


# Git configuration
git config --global user.email "14055040+TOKUJI@users.noreply.github.com"
git config --global user.name "TOKUJI"

# IME support
# Set fcitx to start automatically
cp /etc/xdg/autostart/fcitx-autostart.desktop ./.config/autostart/
