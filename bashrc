### ALIASES ###

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lh'
alias l.='ls -d .*'
alias h='history'
alias grep='grep --color=auto'
alias py='python3'
alias py2='python2'
alias https='http --default-scheme=https'
alias sb='source ~/.bashrc'
alias sbp='source ~/.bash_profile'
alias sz='source ~/.zshrc'
alias psg='ps -ef | grep'

### VARIABLES && ENVIRON  ###

HISTCONTROL=ignoredups
HISTSIZE=32768
HISTFILESIZE=2000000

export EDITOR=/usr/local/bin/vim
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

### FUNCTIONS ###

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

os="$(uname -s)"
case "$os" in
    Darwin)
        # linux manual
        alias lman='man -M /usr/local/share/lman/share/man'
        # MacVim
        alias m='mvim'
        export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
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
        # ...
        ;;
    FreeBSD)
        # ...
        ;;
        *)
        # ...
        ;;
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
