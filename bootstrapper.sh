#!/bin/bash

# Updating package cache
#sudo apt update

# Installing and configuring zsh
#sudo apt install zsh -y

# Getting oh-my-zsh
# It's a shitload of plugins, and obiviously it'll make terminal slow
# So enabling only what I need and not using oh-my-zsh script
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# if some wiered error happens like _vimfile not found or so
# Please delete .zbundle* and 
# run zsh exec

# Installing vim
#sudo apt install vim-gtk -y

# Copying configurations
find $(pwd)/dotfiles -type f -exec ln -sf {} ~/ \;

# Cloning Vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installing all packages

vim -c PluginInstall -c :q -c :q

# Copying caps esc swap script to /usr/local/bin
cp ./services/capsswap /usr/local/bin/
cp ./services/capsswap.service /etc/systemd/system/
# Changing shell to zsh
#sudo chsh -s $(which zsh) $(whoami)

# finising
#echo "please logout your account and login"

