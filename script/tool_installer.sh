#!/bin/bash
source $(dirname $0)/tool_installer_functions.sh

echo "Installing tools/dependencies"

install_ruby
install_homebrew "git" "wget" "tree" "ack" "tmux" "node" "phantomjs" "hub" "tig"
install_npm_global "grunt-cli" "coffee-script" "mongodb"

echo "Tool installation complete!"
