# Aliases
alias dt='cd /Users/cymoo/Desktop'
alias dl='cd /Users/cymoo/Downloads'
alias dc='cd /Users/cymoo/Documents'
alias ws='cd /Users/cymoo/Documents/repo'

# Show / hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# CLI color
CLICOLOR=1
export TERM=xterm-color

# Elasticsearch host
eh="106.14.172.210:9200"

# Useful shortcuts 
alias aliyun="ssh cymoo@106.14.172.210"

# Load .bashrc
if [ -f $HOME/.bashrc ]
then source $HOME/.bashrc
fi
