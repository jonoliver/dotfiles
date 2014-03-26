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
alias con="cd $CONFIG"
alias doc="cd $HOME/Documents"


# Finder
# open finder in current dir
alias o="open ."
# show hidden files in finder
alias sf="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
# hide hidden files in finder
alias hf="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

# Editor
alias subl='$EDITOR'

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

# Coffeescript
#compile coffeescript w/ map
alias c="coffee -cm"
#compile coffeescript w/ map and watch
alias cw="coffee -cmw"

# Web shortcuts
alias gml="open https://mail.google.com"

# functions

# make a directory and cd into it
mkcd() { mkdir -p "$@" && cd "$_"; }

# open file in editor. if file doesnt exist, create it
# TODO: ensure that folder structure gets created automatically if it doesnt exist
# BUG: does not work with Vim
edit() {
  if ! [ -f "$@" ]
    then
      echo "Created $@"
      touch "$@"
  fi
  $($EDITOR $@)
}

# source private files
srcprivate() {
  for f in $CONFIG/*.private.zsh
    do
      . "$f"
    done
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