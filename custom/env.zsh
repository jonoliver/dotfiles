# Optional prompt settings for custom theme
#THEME_USERNAME=true
#THEME_MACHINENAME=true
#THEME_RUBYVERSION=true
#THEME_DATETIME=true

seteditor(){
  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=$EDITORREMOTE
  else
    export EDITOR=$EDITORLOCAL
  fi
}

setenv(){
  # Preferred theme settings for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    THEME_USERNAME=true
    THEME_MACHINENAME=true
    THEME_RUBYVERSION=false
    THEME_DATETIME=true
  else
    THEME_USERNAME=false
    THEME_MACHINENAME=false
    THEME_RUBYVERSION=false
    THEME_DATETIME=true
  fi
}

defaultenv(){
  EDITORLOCAL='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
  EDITORREMOTE='vim'
  seteditor
  setenv
}

rubyenv(){
  defaultenv

  EDITORLOCAL='vim'
  THEME_RUBYVERSION=true

  seteditor
}

defaultenv