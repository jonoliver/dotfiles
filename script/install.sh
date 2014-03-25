#!/bin/bash
#cd ~
DOTFILES=$HOME/dotfiles
mkdir $DOTFILES #replace with git clone

# Create symbolic links
ln -s $DOTFILES/zshrc $HOME/.zshrc	
ln -s $DOTFILES/config/ssh $HOME/.ssh/config 

# Make bin files executable
chmod +x $DOTFILES/bin

#brew install tmux