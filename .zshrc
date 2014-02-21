# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=5000
SAVEHIST=5000

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload promptinit
promptinit
prompt adam2
export EDITOR="vim"

export PATH="$PATH:$HOME/bin"
# Все в цвете
#eval `dircolors`
#alias ls='ls -la --color=auto'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Python environment
export PYTHONPATH=$PYTHONPATH:~/.local/Python/2.7/site-packages

# JAVA
export JAVA_HOME="/usr/java/default"
case $TERM in
  xterm*|rxvt)
      precmd () { print -Pn "\e]0;%n@%m: %~\a" }
      preexec () { print -Pn "\e]0;%n@%m: $1\a" }
      ;;
  screen)
      precmd () { print -Pn "\033k%~\033\\" }
      preexec () { print -Pn "\033k$1\033\\" }
      ;;
esac
setopt extended_glob
for zshrc_snipplet in ~/.zsh/[0-9][0-9][0-9]*[^~] ; do
  source $zshrc_snipplet
done
cd

