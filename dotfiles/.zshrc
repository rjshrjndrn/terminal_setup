
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rajeshr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# loading all stock functions

source ~/.oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
# source ~/.oh-my-zsh/lib/completion.zsh
source ~/.oh-my-zsh/lib/history.zsh
source ~/.oh-my-zsh/lib/git.zsh
source ~/.oh-my-zsh/lib/theme-and-appearance.zsh
source ~/.oh-my-zsh/themes/simple.zsh-theme
source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
source ~/.oh-my-zsh/plugins/z/z.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Aliases
alias sk='find ~/.cred/ekstep -maxdepth 1 -type f -iname "*.pem" -exec ssh-add {} \;'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cx='chmod +x'
alias py='function py(){ touch $1;echo -e "#!/usr/bin/env python3\n" >> $1; };py'
alias p='python3'
alias ovp='sudo openvpn --config ~/.cred/openvpn.ovpn'
alias v='vim -u ~/.essential.vim -N'
alias nv='nvim'
# Tmux alias
alias ta="tmux attach -t"
alias tl='tmux ls'
alias tc='tmux new -s'
alias tk='tmux kill-session -t'
# git aliases
alias g='git'
alias ga='git add'
alias gs='git status'
alias gc='git checkout'
alias gpl='git pull --rebase'
alias gp='git push'
alias gps='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
#shell alias
alias cl='clear'
alias ssh='ssh -A'
# skiping knownkeys saving
alias nssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'
alias nscp='scp -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'
nsu(){
    nssh ubuntu@$1
}
# ansible aliases
alias ap='ansible-playbook'
alias apc='ansible-playbook -c local'

alias c="setxkbmap -option caps:escape"
# Docker
alias d='docker'
# Exporting vars
export GOROOT=~/go
export GOPATH=~/go_code
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH:$GOBIN

# history substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Auto accept suggestion
bindkey '^n' autosuggest-accept

# Custom applications
# All applications are configured in ~/apps
# and binaries linked to ~/apps/bin

export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:~/apps/bin
[[ $(xmodmap -pk | grep Caps | awk '{ print $1 }') -ne 9 ]] && setxkbmap -option caps:escape
