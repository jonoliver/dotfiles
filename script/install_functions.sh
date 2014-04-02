#!/bin/bash

install_ruby(){
  echo "Installing RVM..."
  mkdir -p ~/.rvm/src && cd ~/.rvm/src && rm -rf ./rvm && \
  git clone --depth 1 git://github.com/wayneeseguin/rvm.git && \
  cd rvm && ./install

  rubyversion='2.1.1'
  echo "Installing Ruby $rubyversion ..."
  rvm install "$rubyversion"
  rvm --default "$rubyversion"
}

install_rubygems(){
  echo 'Installing ruby gems...'

  for pkg in $@; do
    gem install --no-ri --no-rdoc $pkg
  done
}

install_homebrew(){
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

  # Make sure we’re using the latest Homebrew
  brew update

  # Upgrade any already-installed formulae
  brew upgrade

  echo 'Installing homebrew packages'

  for pkg in $@; do
    brew install $pkg
  done  

  brew tap homebrew/versions

  # Remove outdated versions from the cellar
  brew cleanup 
}

install_npm_global(){
  echo "Installing global npm packages..."

  for pkg in $@; do
    npm install -g $pkg
  done
}

install_ssh(){
  compile-ssh-config
}