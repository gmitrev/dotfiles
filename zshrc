ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda-gitster"

DISABLE_AUTO_UPDATE="true"

HISTFILESIZE=1000000
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# Disable confirmation when using rm -f
setopt rmstarsilent

alias vi="nvim"
alias vim="nvim"
alias ogvim="vim"

alias tlog='tail -f log/development.log'
alias ssr='ss -npl | grep 3000'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias :q='exit'
alias f='ag -Q --path-to-ignore ~/.ignore'
alias cl='git clean -f doc/changelog'

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
unset RUBY_HEAP_MIN_SLOTS

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(rails git gmitrev bundler zsh-syntax-highlighting mix zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh
export THOR_SILENCE_DEPRECATION=1

export EDITOR=vim
[ -n "$TMUX" ] && export TERM=screen-256color-bce

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# CHRUBY
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
#
# chruby ruby-3.1.3

# ASDF
# export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# autoload -Uz compinit && compinit

# set -o vi
export EVENT_NOEPOLL=1
export BROWSER=open

alias gap='git add -p'
alias gca='git commit --amend'
alias gco='git branch | fzf | xargs git checkout'
alias gco--='git checkout --'
alias gco-='git checkout -'
alias gcob='git checkout -b'
alias gpf='git push --force-with-lease'
alias gpo='git push origin'
alias gbclean='git branch | fzf -m | xargs git branch -d'

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

# source <(kubectl completion zsh)

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

alias gres='git fetch origin && git checkout master && git reset --hard origin/master; git checkout staging && git reset --hard origin/staging; git checkout production && git reset --hard origin/production; git checkout master'
alias gres2='git fetch origin && git checkout main && git reset --hard origin/main; git checkout staging && git reset --hard origin/staging; git checkout main'

# https://stackoverflow.com/questions/10887560/zsh-for-loop-array-variable-issue
set -o shwordsplit

export PATH="/Users/georgi/bin/:$PATH"
export PATH="/Users/georgi/.local/bin/:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH=$(pyenv root)/shims:$PATH

fpath=(/usr/local/share/zsh-completions $fpath)

alias tmuxa='tmux attach -t $(tmux ls -F "#S" | fzf)'

# source <(hcloud completion zsh)

alias murder='ps aux | grep puma | cut -c 18-23 | xargs kill -9'
alias s='murder; rs'
alias ss='murder; bin/rails s -p 3456'
alias killvite='ps aux | grep bin/vite | cut -c 18-23 | xargs kill -9'
alias v='killvite; yarn install && rm -rf node_modules/.vite && bin/vite dev'
alias skiq='redis-cli flushall && be sidekiq'

export DISABLE_SPRING=1

# source /Users/gmitrev/Library/Preferences/org.dystroy.broot/launcher/bash/br

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

passgen() {
  pass generate $1/georgi@mitrev.net 20 ${@:2:999}
}

alias rdbm='rails db:migrate'
alias brdbm='bundle install && rails db:migrate'

alias sdeploy='ssh -t gw-a "export DEPLOY_USER=$(whoami);./Simplero/script/deploy-from-bastion.sh $*"'

# fuck that
export HOMEBREW_NO_AUTO_UPDATE=1

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi


# https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Nicer "enter" handling in pagers
stty sane

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval $(ssh-agent)
ssh-add --apple-use-keychain

eval "$(mise activate zsh)"
