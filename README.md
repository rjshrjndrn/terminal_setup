# Table of content

## [ChitChat](#story)
## [Setup](#setup)

## Story
I used to be a loyal bash terminal user, till recently in a seminar I found one awesome guy fiddling with an awesome terminal.
Routine tasks, where I have to remember my project dirs or `alias` them, commands, reverse search were like kids play for him.
NO ALIASING ??? WTF!!!
( okay, exaggerated! I know, at-least for folder traversal )
I felt like a weird toddler, who are old enough to have 4 years of experience in linux.
For the first time, I feel embarrassed to say I work in linux for my entire career.

And my inner geek totally lost shit and kicked me. "move your ass and ask him..."

That was it, moment of enlightenment.

That's how I start stumble upon `ZSH`. 

(I know you people are probably laughing at me now, Its okay, if you're using ZSH or fish.)

And I found my better half...

## Setup

### Installation

**Depricated**

`bash bootstrapper.sh`

[ZSH](https://duckduckgo.com/?q=zsh&t=canonical&ia=web) + [Z](https://github.com/rupa/z/blob/master/z.sh) + [Oh-my-ZSH](https://github.com/robbyrussell/oh-my-zsh) + some awesome plugins

I don't use any plugin manager for zsh as I use minimal set of plugins, and oh-my-zsh backs me up most of the times.
You can use [antigen](https://github.com/zsh-users/antigen) or [antibody](https://github.com/getantibody/antibody/)

These are the plugins I use

- golang
- git
- docker
- docker-compose
- docker-machine
- zsh-history-substring-search

So, What does this things do?
Nice question.

You can type any part of the directorypath and you'll most probably there, based on your recent `cd`
```
z set <Enter>

i'll be in /home/rajesh/Documents/projects/dev/terminal_setup
```

and type snippet of a command and press `ctrl+k`

you'll get the latest command history, of that particular command
```
ssh <ctrl-k>
ssh rajesh@10.0.3.2 # some server
```

## Plugins
1. [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) for rich git diff
2. [forgit](https://github.com/wfxr/forgit)


## Autocompletions
kube
ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

font
[Fira code](https://github.com/tonsky/FiraCode/wiki/Linux-instructions)
[aur/nerd-fonts-complete](https://www.nerdfonts.com/)

Shell:
[SpaceShip](https://denysdovhan.com/spaceship-prompt/#oh-my-zsh)
[starship](https://starship.rs)

Git

awesome git config
```
 git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```


> terminal.sexy is a great site for custom themes

> alternatives to alt+tab
    - create keyboard shortcut 
      ```
      /bin/bash -c "wmctrl -a <app> || <app>"
      ```
      This will switch to that app, if exists; else create one
