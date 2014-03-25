#!/bin/bash
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

cd $HOME

# install tools/dependencies
echo "Installing tools/dependencies"
#echo 'Installing homebrew...'
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install brew packages
brew bundle ~/dotfiles/Brewfile

#npm install -g grunt-cli
#npm install -g yo

#npm install coffee-script
#npm install mongodb
#npm install express
#npm install mocha

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

# backup any existing dotfiles folder,.zshrc, etc...
bak dotfiles
bak ~.zshrc
bak ~/.ssh/config

git clone https://github.com/jonoliver/dotfiles.git


# Create symbolic links
ln -s $DOTFILES/zshrc $HOME/.zshrc	
ln -s $DOTFILES/config/ssh $HOME/.ssh/config 

# Make bin files executable
chmod +x $DOTFILES/bin