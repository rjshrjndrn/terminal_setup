#!/bin/bash

# Updating package cache
sudo apt update

# Installing and configuring zsh
sudo apt install zsh -y

# Getting oh-my-zsh
# It's a shitload of plugins, and obiviously it'll make terminal slow
# So enabling only what I need and not using oh-my-zsh script
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Copying configurations
cp dotfiles/.zshrc ~/

# if some wiered error happens like _vimfile not found or so
# Please delete .zbundle* and 
# run zsh exec

# Installing vim
sudo apt install vim -y

# Copying Vim configurations
cp dotfiles/.vimrc ~/

# Cloning Vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installing all packages
vim -c PluginInstall -c q: -c q:

# Changing shell to zsh
chsh -s $(which zsh)
