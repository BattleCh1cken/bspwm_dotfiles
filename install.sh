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

echo -n "Choose the option you want\n"
echo -n "0. All of the below\n"
echo -n "1. Install core packages\n"
echo -n "2. Install yay\n"
echo -n "3. Install the Chaotic Aur Repo\n"
echo -n "4. Install the packages needed for Bspwm\n"
echo -n "5. Link the dotfiles\n"
read choice

case "$choice" in
0) echo installCore installYay installChaotic installBspwm linkDotfiles 
  ;;
1) echo installCore
  ;;
2) echo installYay
  ;; 
3) echo installChaotic
  ;;
4) echo installBspwm
  ;;
5) echo linkDotfiles
  ;;
*) echo "Please choose a valid option." 
  ;;
esac


