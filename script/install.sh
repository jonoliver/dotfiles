#!/bin/bash
#cd ~
mkdir $HOME/dotfiles #replace with git clone

# Create symbolic links
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc	
ln -s $HOME/dotfiles/config/ssh $HOME/.ssh/config 

