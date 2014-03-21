# Environment configuration
# Contains PATH, default EDITOR

export PATH="$PATH/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:$HOME/.rvm/bin:$DOTFILES/bin"
#PATH=$PATH:$HOME/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting | REMOVE THIS!
# export MANPATH="/usr/local/man:$MANPATH"

EDITORLOCAL='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
EDITORREMOTE='vim'

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=$EDITORREMOTE
else
  export EDITOR=$EDITORLOCAL
fi
  