#!/bin/bash
home_files=( .bashrc .zshrc .xinitrc .gitconfig .aliases .tmux.conf .p10k.zsh)
config_files=( nvim sxhkd bspwm alacritty starship rofi polybar neofetch ranger kitty picom dunst)
echo "----- Installing Dotfiles -----"
i

#create the .extra file if it doesn't exist
if test -f ~/.extra/; then
  echo ".extra exists"
else touch ~/.extra && echo "creating .extra file"
fi


#create symlinks for each file in the home folder
for i in "${home_files[@]}"
do
  if test -f ~/$i; then
    echo "$i already exists or is already linked"
  else ln -s ~/dotfiles/$i ~/ && echo "linking $i"
  fi
done

#create symlinks for each file in the .config folder
for i in "${config_files[@]}"
do
  if test -d ~/.config/$i;then
    echo "$i already exists or is already linked"
  else ln -s ~/dotfiles/.config/"$i" ~/.config/ && echo "linking $i"
  fi
done
