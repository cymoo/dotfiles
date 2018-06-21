### SET COLORS FOR MAN PAGES ###

man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

### SET SHELL OPTIONS ###

# vim key-bindings
set -o vi
set -o noclobber

### ALIASES ###

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lh'
alias l.='ls -d .*'
alias h='history'
alias cls='clear'
alias grep='grep --color=auto'
alias py='python3'
alias py2='python2'
# for httpie
alias https='http --default-scheme=https'
# sorry, I cann't think of a better name
alias sb='source ~/.bashrc'
alias sbp='source ~/.bash_profile'
alias sz='source ~/.zshrc'
# give me a nice, distinguishable make output
# alias make='clear && make'
alias psg='ps -ef | grep'

### GIT COMMANDS ###
# ...

### ENVIRON  ###

# ignore duplicates in command history
export HISTCONTROL=ignoredups
# set history size to max lines
export HISTSIZE=32768
export HISTFILESIZE=2000000
# setting editor for some app
export EDITOR=/usr/bin/vim
# base path
export PATH=/usr/local/bin:/usr/local/lib:/usr/bin:/usr/sbin:/bin:/sbin
# path for MySQL
export PATH=/usr/local/mysql/bin:$PATH
# path for Mongodb 
export PATH=/usr/local/mongodb/bin:$PATH
# path for Redis
export PATH=/usr/local/redis/src:$PATH
# path for elasticSearch
export PATH=/usr/local/elsearch/bin:$PATH
# path for spark
export PATH=/usr/local/spark/bin:$PATH

### FUNCTIONS ###

# useful unarchiver!
function extract () {
    if [ -f $1 ] ; then
            case $1 in
                    *.tar.bz2)        tar xjf $1                ;;
                    *.tar.gz)         tar xzf $1                ;;
                    *.tar.xz)         tar xJf $1                ;;
                    *.bz2)            bunzip2 $1                ;;
                    *.rar)            rar x $1                  ;;
                    *.gz)             gunzip $1                 ;;
                    *.tar)            tar xf $1                 ;;
                    *.tbz2)           tar xjf $1                ;;
                    *.tgz)            tar xzf $1                ;;
                    *.zip)            unzip $1                  ;;
                    *.Z)              uncompress $1             ;;
                    *.7z)             7z x $1                   ;;
                    *)                echo "'$1' cannot be extracted via extract()" ;;
            esac
    else
            echo "'$1' is not a valid file"
    fi
}

# n cd ..
function up()
{
    for i in `seq 1 $1`;
    do
        cd ../
    done;
}

### BASH SPECIFIC ###

if [[ -n "${BASH_VERSION}" ]]; then
    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    shopt -s histappend

    # safe delete
    alias rm='timeout 3 rm -Iv --one-file-system'

    # Enable programmable completion features
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    export PS1="\u \w >> "
fi

### ZSH SPECIFIC ###

if [[ -n "${ZSH_VERSION}" ]]; then
    :
fi

### OS SPECIFIC ###

_os="$(uname -s)"
case "$_os" in
    Darwin)
        # linux manual
        alias lman='man -M /usr/local/share/lman/share/man'
        # MacVim
        alias m='mvim'
        # PATH for Python 3.6
        export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"
        # PATH and classpath for Java
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home"
        export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME
        export PATH="$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH"
        # Real GCC
        alias jcc='gcc-8'
        # GNU coreutils (those that come with MacOS were outdated)
        # If want to replace the MacOS's coreutils, uncomment it
        # export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
        export PATH="$(brew --prefix coreutils)/bin:$PATH"
        # GNU binutils
        export PATH="$(brew --prefix binutils)/bin:$PATH"
        # GNU man page
        MANPATH="$(brew --prefix coreutils)/share/man:$MANPATH"
        ;;
    Linux)
        # User specific environment and startup programs
        export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
        # JDK
        export JAVA_HOME=/usr/local/jdk
        export PATH="$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH"
        export CLASSPATH=.:$JAVA_HOME:$JAVA_HOME/lib
        # Node
        export PATH="/usr/local/node/bin:$PATH"
        # Python3
        export PATH="/usr/local/python3/bin:$PATH"
        ;;
    FreeBSD)
        # ...
        ;;
        *)
        # ...
        ;;
esac
