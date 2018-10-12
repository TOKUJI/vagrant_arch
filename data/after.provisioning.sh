#! /bin/sh +x

# Font install
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri --noconfirm
pikaur --noconfirm -S ttf-myrica --noconfirm

# Git configuration
git config --global user.email "14055040+TOKUJI@users.noreply.github.com"
git config --global user.name "TOKUJI"

# IME support

