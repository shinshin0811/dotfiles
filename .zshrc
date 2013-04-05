function print_known_hosts (){
  if [ -f $HOME/.ssh/known_hosts ]; then
    cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
  fi  
}
_cache_hosts=($( print_known_hosts ))

autoload -U compinit && compinit
compinit

export LANG=ja_JP.UTF-8
## 重複パスを登録しない
typeset -U path cdpath fpath manpath
## pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
bindkey -v
setopt auto_pushd

PROMPT="%m:%n%% "
RPROMPT=" [%~] "
SPROMPT="correct: %R -> %r ? "

setopt correct
setopt list_packed
#alias vim='env TERM=xterm-256color vim'
alias lla='ls -la'
