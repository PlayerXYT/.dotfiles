# Install more code packages
sudo pacman -S git bash-completion neovim neofetch --noconfirm
sudo pacman -S --asdeps go --noconfirm
# Bootstrap yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
# Add "community" and "multilib" (must be done manually)
sudo nvim /etc/pacman.conf
# Remove orphans
yay -Rs $(yay -Qqdt)
# Update repos and packages
yay -Syyu --noconfirm
