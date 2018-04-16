# loading all stock functions
autoload -U compaudit compinit

source ~/.oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
source ~/.oh-my-zsh/lib/completion.zsh
source ~/.oh-my-zsh/lib/history.zsh
source ~/.oh-my-zsh/lib/git.zsh
source ~/.oh-my-zsh/lib/theme-and-appearance.zsh
source ~/.oh-my-zsh/themes/eastwood.zsh-theme
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
alias gs='git status'
alias gc='git checkout'
alias gpl='git pull'
alias gp='git push'
#shell alias
alias cl='clear'
alias ssh='ssh -A'
# skiping knowkeys saving
alias nssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'
alias nscp='scp -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'

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
