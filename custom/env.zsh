# Environment configuration
# Contains PATH, default EDITOR

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/.rvm/bin:$DOTFILES/bin"
# export MANPATH="/usr/local/man:$MANPATH"

EDITORLOCAL='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
EDITORREMOTE='vim'

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=$EDITORREMOTE
else
  export EDITOR=$EDITORLOCAL
fi
  