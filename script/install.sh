#!/bin/bash
source $(dirname $0)/install_functions.sh

echo "Installing tools/dependencies"
install_ruby
install_rubygems "rails"
# see Brewfile for brew packages to be installed
install_homebrew
install_npm_global "grunt-cli" "yo" "coffee-script" "mongodb" "mocha" "express"

install_zsh
install_dotfiles

#change shell to zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "Installation complete! Restart your terminal."