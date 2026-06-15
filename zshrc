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

alias vi="nvim"
alias vim="nvim"
alias ogvim="vim"

alias tlog='tail -f log/development.log'
alias ssr='ss -npl | grep 3000'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias :q='exit'
alias f='rg --fixed-strings --ignore-file ~/.ignore'   # drop --fixed-strings for regex search
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

alias ls="eza --git"
alias ogls="ls"

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

ns() {
  export NS=$(kubectl get ns -o name | sed "s/namespace\///g" | fzf)
}

alias gres='git fetch origin && git checkout master && git reset --hard origin/master; git checkout staging && git reset --hard origin/staging; git checkout production && git reset --hard origin/production; git checkout master'
alias gres2='git fetch origin && git checkout main && git reset --hard origin/main; git checkout staging && git reset --hard origin/staging; git checkout main'

export PATH="/Users/georgi/bin/:$PATH"
export PATH="/Users/georgi/.local/bin/:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

fpath=(/usr/local/share/zsh-completions $fpath)

alias tmuxa='tmux attach -t $(tmux ls -F "#S" | fzf)'

alias murder='ps aux | grep puma | cut -c 18-23 | xargs kill -9'
alias s='murder; rs'
alias ss='murder; bin/rails s -p 3456'
alias killvite='ps aux | grep bin/vite | cut -c 18-23 | xargs kill -9'
alias v='killvite; yarn install && rm -rf node_modules/.vite && bin/vite dev'
alias skiq='redis-cli flushall && be sidekiq'

export DISABLE_SPRING=1

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

passgen() {
  pass generate $1/georgi@mitrev.net 20 ${@:2:999}
}

# yazi: launch with `y`, cd into the dir you quit from (opener rules live in yazi.toml)
y() {
  local tmp; tmp="$(mktemp -t yazi-cwd.XXXXXX)"; local cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

alias rdbm='rails db:migrate'
alias brdbm='bundle install && rails db:migrate'

# fuck that
export HOMEBREW_NO_AUTO_UPDATE=1


# https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Nicer "enter" handling in pagers
stty sane

# Reuse a single ssh-agent across shells instead of spawning a new one each time
SSH_ENV="$HOME/.ssh/agent-env"
[ -f "$SSH_ENV" ] && source "$SSH_ENV" >/dev/null
ssh-add -l &>/dev/null
if [ $? -eq 2 ]; then
  # No usable agent reachable — start one and remember it for future shells
  (umask 077; ssh-agent -s > "$SSH_ENV")
  source "$SSH_ENV" >/dev/null
fi
# Load keys whose passphrases are already in the macOS keychain (idempotent)
ssh-add --apple-load-keychain &>/dev/null

eval "$(mise activate zsh)"
