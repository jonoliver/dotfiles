#!/bin/bash
source $(dirname $0)/tool_installer_functions.sh

echo "Installing tools/dependencies"

install_ruby
install_rubygems "rails" "rspec" "debugger"
install_homebrew "git" "wget" "tree" "ack" "tmux" "node" "phantomjs"
install_npm_global "grunt-cli" "yo" "coffee-script" "mongodb" "mocha" "express"

echo "Tool installation complete!"
