#!/bin/bash

installCore(){
while read p; do
  echo "Installing $p"
  sudo pacman -S $p
done <~/dotfiles/pkgs/core.txt
}

installYay(){
  cd ~
  git clone "https://aur.archlinux.org/yay.git"
  cd ~/yay
  makepkg -si --noconfirm

}
installChaotic(){
  pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
  pacman-key --lsign-key FBA220DFC880C036
  pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  if grep -q chaotic-aur /etc/pacman.conf; then
    echo "chaotic-aur already installed"
  else 
    echo "[chaotic-aur]" >> /etc/pacman.conf
    echo " Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf 
fi
}

installAur(){
while read p; do
  echo "Installing $p"
  yay -S --noconfirm --needed $p
done <~/dotfiles/pkgs/aur.txt
}
installBspwm(){
while read p; do
  echo "Installing $p"
  pacman -S --noconfirm --needed $p
done <~/dotfiles/pkgs/bspwm.txt
}
linkDotfiles(){
sh ~/dotfiles/link.sh
}

# echo -ne "Choose the option you want\n"
# echo -n "0. All of the below\n"
# echo -n "1. Install core packages\n"
# echo -n "2. Install yay\n"
# echo -n "3. Install the Chaotic Aur Repo\n"
# echo -n "4. Install the packages needed for Bspwm\n"
# echo -n "5. Link the dotfiles\n"
# read choice
echo -ne "
0. All of the below
1. Install core packages
2. Install yay
3. Install Chaotic Aur
4. Install packages needed for Bspwm
5. Link dotfiles
"
read choice
case "$choice" in
0) installCore installYay installChaotic installBspwm linkDotfiles 
  ;;
1) installCore
  ;;
2) installYay
  ;; 
3) installChaotic
  ;;
4) installBspwm
  ;;
5) linkDotfiles
  ;;
*) echo "Please choose a valid option." 
  ;;
esac


