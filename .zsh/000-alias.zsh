alias cdnetworkdownload='cd /Network/Downloads'
alias cdvolumes='cd /Volumes'
# Алиасы
if [ -f /usr/bin/grc ]; then
  alias ping="grc --colour=auto ping"
  alias traceroute="grc --colour=auto traceroute"
  alias make="grc --colour=auto make"
  alias diff="grc --colour=auto diff"
  alias cvs="grc --colour=auto cvs"
  alias netstat="grc --colour=auto netstat"
fi
alias p5="ps -eo pcpu,user,pid,cmd | sort -r | head -6"
alias ssh-idp="ssh -X went-idp-ub"
alias ssh-srv="ssh -X went-srv-fd"
if [ -f /usr/bin/pydf ]; then 
    alias df="pydf"
fi
#alias df=pydf
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# git aliases
# alias gitst='git status'
# alias gitpull='git pull'
# alias gitpush='git push'
# alias gitl='git log'
# alias gita='git add'
# alias gitp='git add --patch'
# alias gitci='git commit'
# alias gitcim='gitci -m'
# alias gitco='git checkout'
# alias gitb='git checkout -b'
# alias gitdi='git diff'
# alias gitdic='gitdi --cached'
# alias gitpushall='git push && git push --tags'
# alias gitco='git checkout'
# alias gitcob='git checkout -b'
# alias gitb='git branch'
# alias gitm='git merge'
# alias gitmv='git mv'
