# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="plazora"

DISABLE_AUTO_UPDATE="true"

alias vi="vim"
alias tlog='tail -f log/development.log'
alias ssr='ss -npl | grep 3000'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias :q='exit'

alias crb='cd ~/code/rb'
alias crkt='cd ~/code/rkt'
alias cclj='cd ~/code/clj'

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
unset RUBY_HEAP_MIN_SLOTS

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git archlinux lein lol rails3 gmitrev bundler zeus zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/georgi/bin
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/georgi/bin

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR=vim
export force_s3tc_enable=true
export TCL_LIBRARY=/usr/lib/tcl8.5
[ -n "$TMUX" ] && export TERM=screen-256color-bce

# TMUXINATOR
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FINALLY
# Enable for better looking java apps
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=javax.swing.plaf.nimbus.NimbusLookAndFeel'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Add cabal binaries to path
export PATH="$HOME/.cabal/bin:$PATH"

# source ~/.bin/tmuxinator.zsh

# OPAM configuration
. /home/georgi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS
source /usr/share/doc/pkgfile/command-not-found.zsh
