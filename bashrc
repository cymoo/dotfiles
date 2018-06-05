# Set colors for man pages
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
# Set shell options
# ...

# Aliases
alias cp='cp -i'
alias ll='ls -lh'
alias l.='ls -d .*'
alias h='history'
alias cls='clear'
alias grep='grep --color=auto'
alias py='python3'
alias py2='python2'
alias https='http --default-scheme=https'
alias lman='man -M /usr/local/share/lman/share/man'


# Ignore duplicates in command history
export HISTCONTROL=ignoredups
# Set history size to max lines
export HISTSIZE=32768

# Setting editor for some app
export EDITOR=/usr/bin/vim

# Base path
export PATH=/usr/local/bin:/usr/local/lib:/usr/bin:/usr/sbin:/bin:/sbin

# PATH for MySQL
export PATH=/usr/local/mysql/bin:$PATH

# PATH for Mongodb 
export PATH=/usr/local/mongodb/bin:$PATH

# PATH for Redis
export PATH=/usr/local/redis/src:$PATH

# PATH for elasticSearch
export PATH=/usr/local/elsearch/bin:$PATH

# PATH for Python 3.6
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"

# PATH and classpath for Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home"
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME
export PATH="$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH"

# PATH for spark
export PATH=/usr/local/spark/bin:$PATH

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

# MICS


