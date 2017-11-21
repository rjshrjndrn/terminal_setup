#!/usr/bin/bash

# This script is for ubuntu, as I am an avid ubuntu user

# Installing zsh

sudo apt install -y zsh git git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# Installing oh-my-sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# downloading custom plgin
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# over-writtig default zshrc
sed -i '/^plugins=/a  \
    zsh-history-substring-search' ~/.zshrc
echo -e "bindkey '^k' history-substring-search-up \n\
bindkey '^j' history-substring-search-down
" >> ~/.zshrc
echo -e "Success.. Please close and restart the terminal\n\
        else please restart your machine"
