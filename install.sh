#!/bin/bash
home_files=( .bashrc .zshrc )
echo $home_files
config_files=( nvim sxhkd bspwm alacritty starship rofi polybar )
echo "----- Installing Dotfiles -----"
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.zshrc ~/ 
ln -s ~/dotfiles/.gitconfig ~/

#create the .env_variables file
if test -f ~/.env_variables; then
  echo "env_variables file exists"
else touch ~/.env_variables && echo "creating .env_variables file"
fi
#create the .config folder if it doesn't exist
if test ~/.config/; then
  echo "config folder exists"
else mkdir ~/.config/ && echo "creating config folder"
fi

#create symlinks for each file in the .config folder
for i in "${config_files[@]}"
do
  echo "$i"
  ln -s ~/dotfiles/.config/"$i" ~/.config
done

#Install zsh dependencies

#oh my zsh
if test -f ~/.oh-my-zsh/oh-my-zsh.sh; then
  echo "oh my zsh is installed."
else git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh  
fi

#zsh-autosuggestions
if test -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/; then
  echo "zsh-autosuggestions is installed"
else git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "Installing zsh-autosuggestions" 
fi
#zsh-completions
if test -d ~/.oh-my-zsh/custom/plugins/zsh-completions; then
  echo "zsh-completions is installed"
else   git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && echo "Installing zsh completions"
