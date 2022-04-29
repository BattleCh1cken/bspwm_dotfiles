#!/bin/bash
#Install Aur Helper
installYay() {
	cd ~
	git clone "https://aur.archlinux.org/yay.git"
	cd ~/yay
	makepkg -si --noconfirm

}
installChaotic() {
	sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
	sudo pacman-key --lsign-key FBA220DFC880C036
	sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
	if grep -q chaotic-aur /etc/pacman.conf; then
		echo "chaotic-aur already installed"
	else
		sudo echo "[chaotic-aur]" >>/etc/pacman.conf
		sudo echo " Include = /etc/pacman.d/chaotic-mirrorlist" >>/etc/pacman.conf
	fi
}

installNVChad() {
	if test -d ~/.config/nvim; then
		echo "existing nvim config detected, delete it first"
                echo "linking config"
		ln -s ~/bspwm_dotfiles/config/NvChad/custom ~/.config/nvim/lua/
	else
		{
			git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
			ln -s ~/bspwm_dotfiles/config/NvChad/custom ~/.config/nvim/lua/
			nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
		}
	fi
}
installPackages() {
	yay -S --noconfirm --needed awesome-git kitty rofi picom neovim ripgrep zsh zsh-autosuggestions zsh-syntax-highlighting zoxide starship exa playerctl brightnessctl acpi
}

linkDotfiles() {
	home_files=(.bashrc .zshrc .xinitrc .Xresources .gitconfig .aliases)
	config_files=(nvim awesome starship kitty rofi picom)
	echo "----- Installing Dotfiles -----"
	i

	#create the .extra file if it doesn't exist
	if test -f ~/.extra/; then
		echo ".extra exists"
	else
		touch ~/.extra && echo "creating .extra file"
	fi

	#create symlinks for each file in the home folder
	for i in "${home_files[@]}"; do
		if test -f ~/$i; then
			echo "$i already exists or is already linked"
		else
			ln -s ~/bspwm_dotfiles/$i ~/ && echo "linking $i"
		fi
	done

	#create symlinks for each file in the .config folder
	for i in "${config_files[@]}"; do
		if test -d ~/.config/$i; then
			echo "$i already exists or is already linked"
		else
			ln -s ~/bspwm_dotfiles/config/"$i" ~/.config/ && echo "linking $i"
		fi
	done
	#pull submodules
	cd ~/dotfiles/
	git submodule init
	git submodule update
}

echo -ne "
0. All of the below
1. Install yay
2. Install Chaotic Aur
3. Install NvChad
4. Install Packages
5. Link dotfiles
"
read choice
case "$choice" in
0)
	installYay installChaotic installPackages linkDotfiles
	;;
1)
	installYay
	;;
2)
	installChaotic
	;;
3)
	installNVChad
	;;
4)
	installPackages
	;;
5)
	linkDotfiles
	;;
*)
	echo "Please choose a valid option."
	;;
esac
