# loading all stock functions
autoload -U compaudit compinit
# sourcing necessary libs from oh-my-zsh
source ~/.oh-my-zsh/lib/completion.zsh
source ~/.oh-my-zsh/lib/git.zsh
source ~/.oh-my-zsh/lib/history.zsh
source ~/.oh-my-zsh/lib/theme-and-appearance.zsh

# sourcing all plugins
source ~/.sourceable.sh

# Aliases
alias ekaws="cd ~/Documents/projects/ekstep/git/AWS-Setup"
alias ekgit="cd ~/Documents/projects/ekstep/git"
alias ekmon="cd ~/Documents/projects/ekstep/git/Monitoring-Platform"
alias sk='find ~/.cred/ekstep -maxdepth 1 -type f -iname "*.pem" -exec ssh-add {} \;'
alias v='vim'
alias c='cd'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cx='chmod +x'
alias py='function py(){ touch $1;echo -e "#!/usr/bin/env python3\n\n" >> $1; };py'
alias p='python3'
alias ovp='sudo openvpn --config ~/.cred/openvpn.ovpn'
alias vv='vim -u ~/.essential.vim'
# Tmux alias
alias ta="tmux attach -t"
alias tl='tmux ls'
alias tc='tmux new -s'
alias tk='tmux kill-session -t'
# git aliases
alias gs='git status'
alias gc='git checkout'

# Exporting vars
export GOROOT=/home/rajesh/go
export GOPATH=/home/rajesh/go_code
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH:$GOBIN

# history substring search
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# Auto accept suggestion
bindkey '^n' autosuggest-accept

# swapping caps and escape
if [ $(xmodmap -pk | grep Caps | awk '{ print $1 }') -ne 9 ];then xmodmap ~/.Xmodmap; fi
