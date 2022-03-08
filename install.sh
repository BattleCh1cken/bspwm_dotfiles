#!/bin/bash
home_files=( .bashrc .zshrc .xinitrc .gitconfig )
echo $home_files
config_files=( nvim sxhkd bspwm alacritty starship rofi polybar )
echo "----- Installing Dotfiles -----"

#create the .env_variables file
if test -f ~/.env_variables; then
  echo "env_variables file exists"
else touch ~/.env_variables && echo "creating .env_variables file"
fi

#create the .extra file if it doesn't exist
if test -f ~/.extra/; then
  echo ".extra exists"
else mkdir ~/.extra && echo "creating .extra file"
fi


#create symlinks for each file in the home folder
for i in "{$home_files[@]}"
do
  if test -f ~/$i; then
    echo "---$i already exists or is already linked"
  else ln -s ~/dotfiles/$i ~/ && echo "linking $i"
  fi

#create symlinks for each file in the .config folder
for i in "${config_files[@]}"
do
  if test -d ~/.config/$i;then
    echo "---$i already exists or is already linked---"
  else ln -s ~/dotfiles/.config/"$i" ~/.config
  fi
done
