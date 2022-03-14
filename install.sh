#!/bin/bash
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
  echo "installing chaotic aur"
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
# while true; do
#     read -p "Install core packages?" yn
#     case $yn in
#         [Yy]* ) installcore; break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
#
# while true; do
#     read -p "Install yay aur helper?" yn
#     case $yn in
#         [Yy]* ) installYay; break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
#
# while true; do
#     read -p "Install chaotic aur?" yn
#     case $yn in
#         [Yy]* ) installChaotic; break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
#
# while true; do
#     read -p "Install bspwm packages?" yn
#     case $yn in
#         [Yy]* )  installBspwm; break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
#
# while true; do
#     read -p "Link dotfiles?" yn
#     case $yn in
#       [Yy]* ) linkDotfiles; break;;
#         [Nn]* ) exit;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
