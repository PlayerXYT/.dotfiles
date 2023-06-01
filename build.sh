#!/bin/sh

if grep -q "arch" /etc/os-release; then
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si --noconfirm
	cd ..
	yay -Syyu --noconfirm
	yay -S neovim gimp vlc net-tools xfce4-terminal --noconfirm

elif grep -q "debian" /etc/os-release; then
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install neovim gimp vlc net-tools xfce4-terminal -y
	sudo apt autoremove -y

elif grep -q "fedora" /etc/os-release; then
	sudo dnf update -y
	sudo dnf upgrade -y
	sudo dnf install neovim gimp vlc net-tools xfce4-terminal -y
	sudo dnf autoremove -y
fi

# Move RC files
mv bashrc $HOME/.bashrc
mv -r config $HOME/.config

sudo chsh -s /bin/bash $USER # Some distros feel the need to set zsh by default, or even worse, fish which isn't even POSIX compliant!
