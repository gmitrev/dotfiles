# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="plazora"

DISABLE_AUTO_UPDATE="true"

# Example aliases
alias zshconfig="vi ~/.zshrc"
alias cdp="cd ~/PMS"
alias pgrestart='sudo /etc/init.d/postgresql restart'
alias cds="cd ~/spain"
alias sssh='ssh ruby@91.230.195.57'

alias vi="vim"
alias tlog='tail -f log/development.log'
alias ssr='ss -npl | grep 3000'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias :q='exit'

export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git bundler gem gmitrev)
plugins=(git archlinux bundler lein lol rails3 gmitrev)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/georgi/bin
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/georgi/bin

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR=vim
export force_s3tc_enable=true
export PATH="$HOME/bin/omnetpp-4.2.2/bin:$PATH"
export PATH="$HOME/bin/android-sdk-linux/tools:$PATH"
export PATH="$HOME/bin/android-sdk-linux/platform-tools:$PATH"
export TCL_LIBRARY=/usr/lib/tcl8.5
export VIMCLOJURE_SERVER_JAR="$HOME/lib/vimclojure/server-2.3.5.jar"
[ -n "$TMUX" ] && export TERM=screen-256color

# xmodmap -e 'remove Lock = Caps_Lock'
# xmodmap -e 'keysym Caps_Lock = Control_L'
# xmodmap -e 'add Control = Control_L'
