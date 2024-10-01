#!/bin/bash

arch_install() {
	# Install core packages
	sudo pacman -S git bash-completion neovim neofetch tmux --noconfirm
	sudo pacman -S --asdeps go --noconfirm
	# Bootstrap yay
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
	# Add "community" and "multilib" sources
	cp /etc/pacman.conf pacman.conf.bak
	sed -zre "s/#\[(community|multilib)]\n#/[\1]\n/gm" /etc/pacman.conf > pacman.conf.new
	sudo cp pacman.conf.new /etc/pacman.conf
	# Remove orphans (mostly go)
	yay -Rs $(yay -Qqdt)
	# Update repos and packages
	yay -Syyu --noconfirm
}

if grep -q "ID=arch" /etc/os-release; then
	arch_install &
else
	echo -e "Error: Unknown distro. This bashrc depends on neovim, neofetch and tmux\ngit and bash-completion are also reccomended."
fi

cp -s bashrc ~/.bashrc
cp -s tmux.conf ~/.tmux.conf
cp -s config/i3 ~/.config
cp -s config/i3status ~/.config
cp -s config/neofetch ~/.config
cp -s config/nvim ~/.config
