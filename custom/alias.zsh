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
# search processes
alias psg='ps -ef | grep'
# display history
alias hi='history'
# search history
alias hg='history | grep'

# quick cd
# change to dotfiles directory
alias dot="cd $DOTFILES"
alias cust="cd $ZSH_CUSTOM"
alias doc="cd $HOME/Documents"

# Finder
# open files or directories
o(){ open ${1:-.} }
# show hidden files in finder
alias sf="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
# hide hidden files in finder
alias hf="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

alias zshrc="edit $DOTFILES/zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias c="clear"
alias l='ls -lAh'
alias lg='l | grep'

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
# Push to origin
alias gpo='git push origin'
alias gpu='git push -u'
# Fetch
alias gf='git fetch'
# Fetch and merge upstream master
alias gum='git fetch upstream && git merge upstream/master'
# Fetch and merge upstream master
alias gom='git fetch origin && git merge origin /master'
# Show diff of a commit
alias gs='git show'
# Show diff of a commit (filenames only)
alias gsn='git show --name-only'
alias gdc='git diff --cached'
alias st='tig status'
alias i='tig'
alias gpf='git push --force-with-lease'
alias gbg='git branch | grep'
alias remotereset='git fetch origin $(git rev-parse --abbrev-ref HEAD) && git reset --hard "origin/$(git rev-parse --abbrev-ref HEAD)"'
alias forcechange='(SHA="$(git rev-parse HEAD)" && git reset HEAD~ --hard && git cherry-pick $SHA)'
alias rr='remotereset'
alias nom='npm'

# Tree
#always use color
alias tree='tree -C'
alias t='tree'
# show hidden files in tree, excluding .git folder
alias ta='tree -aI ".git"'
# show hidden files in tree, including .git folder
alias tag='tree -a'
alias gsta='git stash'
alias ghst="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
# Less
alias le="less"

# Tmux
alias tm="tmux"
alias tmr="tmuxinator"
alias tmk="tmux kill-session -t"
alias tmka="killall tmux"
# copy to clipboard
# alias tmc="tmux showb | pbcopy"

function tmc(){
  COLOR=$(jq '."workbench.colorCustomizations"."titleBar.activeBackground"' -r .vscode/settings.json)
  tmux set-option pane-active-border-bg $COLOR
  tmux set-option pane-border-fg $COLOR
}

# Npm
alias ns="npm start"
alias nt="npm test"
alias ni="npm install"

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
alias ss='bundle exec rails server'
alias rc='rails console'
alias rg='rails generate'

#rake
alias be='bundle exec'
alias rake='noglob rake'
alias dbm='rake db:migrate'
alias dbs='rake db:seed'
alias dbd='rake db:drop'
alias dbc='rake db:create'
alias rsa='bundle exec rake spec:all'
alias rsi='bundle exec rake spec:integration'
alias rst='bundle exec rake teaspoon'

# rspec
alias rsp='bundle exec rspec'
alias rspd='rspec -cfd -t "~js"'
alias rspjs='rspec -c'
alias rspjsd='rspec -cfd'
alias rspw='rspec -c -t wip'
alias rspwd='rspec -cfd -t wip'

# docker
alias dk='docker'
alias dps='docker ps'
alias dim='docker images'
alias ddc='docker-compose'
alias dl='docker logs'
alias dr='docker run'

function dsh(){
  docker exec -it "$@" /bin/bash
}

# Coffeescript
#compile coffeescript w/ map
alias co="coffee -cm"
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
alias hshg="hash | grep"

#find file by name
alias f="find . -name "

#start mysql
alias sql="mysql.server start"
#stop mysql
alias ssql="mysql.server stop"

# Browser shortcuts

# Open github (must set GH_USERNAME variable)
# Accepts argument for project
# alias gh=github
github(){ open "https://github.com/$GH_USERNAME/$@" }
alias quickdev='npx browser-sync start --server --files="*"'
# functions

# google search from command line
# Ex: ggl this is a search, no quotes necessary
function ggl() {
  arg="$@"
  encodedarg=`urlencode $arg`
  open "https://www.google.com/search?hl=en#q=$encodedarg"
}

# WHY DOES OH-MY-ZSH DO THIS?
# Too easy to typo `ggf` when you mean `gf` for git fetch
# unset so I don't accidentally force push when trying to fetch
#https://github.com/ohmyzsh/ohmyzsh/blob/6e9cda3d30d8e73c11e4d32044b7f4c5e06f822d/plugins/git/git.plugin.zsh#L298-L302
function ggf(){
  echo "Did you mean to run gf?" && return 1;
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

function new(){
  mkcd $@ && git init && edit
}

# open editor (accepts dir/file as argument, otherwise opens at current dir)
edit(){ $($EDITOR ${@:-'.'}) }
alias e="edit"

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

trep(){
  while [ "true" ]
    do
      clear && tree "$@"
      sleep 1
    done
}

# find and replace
# Usage: find_replace find_str replace_str dir
find_replace(){
  # mac sed treats -i differently than gnu sed
  if [ `uname` = 'Darwin' ]; then
    grep -r -l "$1" ${3-.} | xargs -t sed -i '' s/$1/$2/g
  else
    grep -r -l "$1" ${3-.} | xargs -t sed -i s/$1/$2/g
  fi
}

# create file and corresponding spec in rails project
edit_with_spec(){
  edits $@
  spec_file=`echo $@ | sed s/app/spec/ | sed s/\.rb/_spec\.rb/`
  edits $spec_file
}
alias ews="edit_with_spec"

# Note taking
NOTEDOC=~/notes
notes(){
  touch $NOTEDOC
  cat -n $NOTEDOC
}
note(){
  echo $@ >> $NOTEDOC
  notes
}
noted(){
  sed -i.bak "$@d" "$NOTEDOC"
  notes
}

loadnvm(){
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

certchain(){
  openssl s_client -showcerts -servername $@ -connect $@:443
}