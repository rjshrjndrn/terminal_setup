# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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
function sk() {
    local org=${1:-ekstep}
    eval $(ssh-agent -s) > /dev/null
    find ~/.cred/${org} -maxdepth 1 -type f -iname "*.pem" -exec ssh-add {} &> /dev/null \;
}

sk

function pr() {

    branch=${1:-$(git rev-parse --abbrev-ref HEAD | cut -d ':' -f2 | cut -d '/' -f2)}
    upstream=${2:-$(git remote get-url origin | cut -d ':' -f2 | cut -d '/' -f1)}
    echo $branch $upstream
    hub pull-request -b $upstream:$branch -h $(git rev-parse --abbrev-ref HEAD | cut -d ':' -f2 | cut -d '/' -f2) -f
}
alias m='mkdir'
alias clea='clear'
alias sk=sk
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cx='chmod +x'
alias py='function py(){ touch $1;echo -e "#!/usr/bin/env python3\n" >> $1; };py'
alias p='python3'
alias ovp='sudo openvpn --config ~/.cred/sunbird-staging.ovpn --auth-user-pass ~/.cred/ntp/vpn'
alias ovpd='sudo openvpn --config ~/.cred/sunbird-dev.ovpn --auth-user-pass ~/.cred/ntp/vpn'
alias vn='nvim -u ~/.essential.vim -N'
alias vv='/usr/bin/vim'
alias vim='nvim'
alias v='vim'
alias x='xdg-open'
# function vim(){
#     [[ -f Session.vim ]] && nvim -S || nvim -c Obsession $@
# }
alias nvd='nvim -d'
# Tmux alias
alias t='tmux'
alias ta='tmux attach -t $@'
alias tl='tmux ls'
alias tc="tmux new -s $@"
alias tk='tmux kill-session -t'
# git aliases
alias g='git'
alias gb='git branch'
alias gl='git log'
alias ga='git add'
alias gs='git status -sb'
alias gc='git checkout'
alias gpl='git pull --rebase'
alias gplo='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gpo='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpr='git push rjshrjndrn $(git rev-parse --abbrev-ref HEAD)'
alias gpso='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gpsr='git push --set-upstream rjshrjndrn $(git rev-parse --abbrev-ref HEAD)'
alias grc='git rebase --continue'
alias grs='git rebase --skip'

# hub alias
# Sourcing hub for git
eval "$(hub alias -s)"
alias at='docker run --rm -it -v $(pwd):/work -w /work -urajeshr ansible_ubuntu:16.04 bash'
# simple git todo
gt() {
  git commit --allow-empty -m "TODO: $*"
}

glt() {
  git log --grep=TODO: --oneline
}

#shell alias
alias cl='clear'
alias ssh='ssh -A'
# skiping knownkeys saving
alias nssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'
alias nscp='scp -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking false"'
jt(){
    nvim $(find $1 -type f | fzy)
}
nsr(){
    nssh rajeshr@$1
}
nsu(){
    nssh ubuntu@$1
}
# ansible aliases
alias ap='ansible-playbook'
alias apc="ansible-playbook -i $2 $1 --syntax-check -e 'hosts=dummy'"
alias apn='ansible-playbook -i ntp_preprod_inventory/env/ --vault-password-file=ntp_preprod_inventory/pass_file  -e ansible_ssh_user=rajeshr'

alias c="setxkbmap -option caps:escape"
alias yay="yay --sudoloop"
# Docker
alias d='docker'
alias k='kubectl'
alias kg='kubectl get'
alias ka='kubectl apply -f'
alias kd='kubectl describe'
alias ke='kubectl edit'
alias kl='kubectl logs'
alias kex='kubectl exec'
# Exporting vars
#export GOROOT=~/go
export GOPATH=~/go_code
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin:$GOPATH:$GOBIN

# history substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Auto accept suggestion
bindkey '^n' autosuggest-accept

# Custom applications
# All applications are configured in ~/apps
# and binaries linked to ~/apps/bin

export VISUAL=nvim
export EDITOR=nvim
export PATH=$PATH:~/apps/bin:~/go_code/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ /home/rajeshr/apps/bin/kubectl ]; then source <(kubectl completion zsh); fi
xinput disable 9
source <(stern --completion=zsh)
source <(helm completion zsh)
# [[ $(xmodmap -pk | grep Caps | awk '{ print $1 }') -ne 9 ]] && setxkbmap -option caps:escape
