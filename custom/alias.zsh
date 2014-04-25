# Config files
ALIASFILE=$ZSH_CUSTOM/alias.zsh

# aliases

# reload all config files
alias rl="source $DOTFILES/zshrc"
# display aliases
alias al="alias"
# reload aliases
alias arl="source $ALIASFILE"
# edit aliases
alias aed='$EDITOR $ALIASFILE'
# search aliases for pattern
alias ag='alias | grep'

# quick cd
# change to dotfiles directory
alias dot="cd $DOTFILES"
alias cust="cd $ZSH_CUSTOM"
alias doc="cd $HOME/Documents"


# Finder
# open finder in current dir
alias o="open ."
# show hidden files in finder
alias sf="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
# hide hidden files in finder
alias hf="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

# Editor
alias edit='$EDITOR'

alias zshrc="edit $DOTFILES/zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
# Most aliases are added by the oh-my-zsh git plugin
alias gi='git init'
# Display all tracked files
alias gt='git ls-tree -r master --name-only'
# List git-ignored files
alias gig='git ls-files . --ignored --exclude-standard --others'
# List untracked files
alias gut='git ls-files . --exclude-standard --others'
# Git commit all with message
alias gcam='git commit -vam'
# Push to master
alias gpom='git push origin master'
# Fetch
alias gf='git fetch'
# Fetch and merge upstream
alias gum='git fetch upstream && git merge upstream/master'
# Show diff of a commit
alias gs='git show'
# Show diff of a commit (filenames only)
alias gsn='git show --name-only'

# Tree
alias t='tree'
# show hidden files in tree, excluding .git folder
alias ta='tree -aI ".git"'
# show hidden files in tree, including .git folder
alias tag='tree -a'

# Less
alias le="less"

# Tmux
alias tm="tmux"

# Npm
alias ns="npm start"
alias ni="sudo npm install"

# Ruby
alias gmi="sudo gem install"
alias gmin="sudo gem install --no-ri --no-rdoc"
alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'
alias migr='rake db:migrate db:test:clone'

# RVM
alias rvl='rvm list'
alias rvc='rvm current'
alias rvu='rvm use'
alias rvd='rvm default'
alias rvdu='rvm --default use'

#rails
alias ss='rails server'

# Coffeescript
#compile coffeescript w/ map
alias c="coffee -cm"
#compile coffeescript w/ map and watch
alias cw="coffee -cmw"

# Web shortcuts
alias gml="open https://mail.google.com"

# Encoding
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

# Make all files in dotfiles/bin executable
alias binx="chmod +x $DOTFILES/bin/*"

# SSH
alias compile-ssh-config='echo -n > ~/.ssh/config && cat $DOTFILES/config/*.ssh > ~/.ssh/config'

# System utilities
# display disk usage in human readable format
alias dfh='df -H'
# show history, sorted by usage
alias hu='historyusage'
historyusage(){ history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r }

# search hash
alias hg="hash | grep"

#find file by name
alias f="find . -name "

# Browser shortcuts

# Open github (must set GH_USERNAME variable)
# Accepts argument for project
alias gh=github
github(){ open "https://github.com/$GH_USERNAME/$@" }
# functions

# google search from command line
# Ex: ggl this is a search, no quotes necessary
function ggl() {
  arg="$@"
  encodedarg=`urlencode $arg`
  open "https://www.google.com/search?hl=en#q=$encodedarg"
}

# make a directory and cd into it
mkcd() { mkdir -p "$@" && cd "$_"; }

# open file in editor. if file doesnt exist, create it
# TODO: ensure that folder structure gets created automatically if it doesnt exist
# BUG: does not work with Vim
edits() {
  if ! [ -f "$@" ]
    then
      echo "Created $@"
      touch "$@"
  fi
  $($EDITOR $@)
}

# backup files/folders
bak(){
  i=1
  name="$@.bak"
  while [ -f "$name" ] || [ -d "$name" ]; do
    echo "$name exists"
    name="$@.bak.$i"
    i=$((i+1))
  done
  cp -R "$@" "$name"
}
gdno(){
   git diff "$@" --name-only
}
