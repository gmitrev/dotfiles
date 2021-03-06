ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda-gister"

DISABLE_AUTO_UPDATE="true"

alias vi="vim"
alias tlog='tail -f log/development.log'
alias ssr='ss -npl | grep 3000'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias :q='exit'
alias f='ag -Q'

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
unset RUBY_HEAP_MIN_SLOTS

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(rails git archlinux lein rails3 gmitrev bundler zeus zsh-syntax-highlighting mix)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
[ -n "$TMUX" ] && export TERM=screen-256color-bce

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# set -o vi
export EVENT_NOEPOLL=1
export BROWSER=firefox

alias gap='git add -p'
alias gca='git commit --amend'
alias gco='git branch | fzf | xargs git checkout'
alias gco--='git checkout --'
alias gcob='git checkout -b'
alias gpf='git push --force-with-lease'
alias gpo='git push origin'

alias tailf='tail -f'
alias mux='tmuxinator'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

source <(kubectl completion zsh)

# kubectl fun
alias kuberun='kubectl -n ${NS:-monolith} exec -ti $(kubepods | fzf | sed "s/pod\///g")'
alias kubepods='kubectl get pods -n ${NS:-monolith} -o name'
alias kubeall='kubectl get all -n ${NS:-monolith} -o name'
alias kubeget='kubectl -n ${NS:-monolith} get'
alias kubelogs='kubeall | fzf | xargs kubectl -n ${NS:-monolith} logs --tail=500 --timestamps -f -c main'
alias kubedesc='kubeall | fzf | xargs kubectl -n ${NS:-monolith} describe'
alias kubedit='kubeall | fzf | xargs kubectl -n ${NS:-monolith} edit'
alias kubessh='kuberun bash'
alias k='kubectl -n ${NS:-monolith}'
alias kc='kubectl config get-contexts -o=name | fzf | xargs kubectl config use-context'
alias drun='docker run --rm -it --entrypoint /bin/bash'

ns() {
  export NS=$(kubectl get ns -o name | sed "s/namespace\///g" | fzf)
}

# alias gres='git fetch origin && git checkout master && git reset --hard origin/master && git checkout staging && git reset --hard origin/staging && git checkout production && git reset --hard origin/production && git checkout master'
alias gres='git fetch origin && git checkout master && git reset --hard origin/master; git checkout staging && git reset --hard origin/staging; git checkout production && git reset --hard origin/production; git checkout master'
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# https://stackoverflow.com/questions/10887560/zsh-for-loop-array-variable-issue
set -o shwordsplit

chruby ruby-2.7.0

export PATH="/Users/georgi/bin/:$PATH"
