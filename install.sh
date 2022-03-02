#!/bin/bash
# home_files=(.bashrc .zshrc)
my_array=(foo bar)
echo $home_files
config_files=$(ls ~/dotfiles/.config/)
echo $config_files
echo "----- Installing Dotfiles -----"
cd
ln -s ~/dotfiles/.bashrc .bashrc
ln -s ~/dotfiles/.zshrc .zshrc

#create the .env_variables file
if test -f ~/.env_variables; then
  echo "env_variables file exists"
else touch .env_variables && echo "creating .env_variables file"
fi
#create the .config folder if it doesn't exist
if test ~/.config/; then
  echo "config folder exists"
else mkdir ~/.config/ && echo "creating config folder"
fi

cd ~/.config
#create symlinks for each file in the .config folder
ln -s ~/dotfiles/.config/nvim nvim
dir=$(pwd)
echo $dir
