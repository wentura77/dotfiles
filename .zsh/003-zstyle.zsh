# zstyle
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wentura/.zshrc'

# Автодополнение удобнее всего в «режиме меню» — когда 
# по вариантам можно перемещаться при помощи стрелок 
# (и выбирать нужный вариант Enter'ом). Включается он так:
zstyle ':completion:*' menu yes  select
# Автодополнение номеров процессов (например, для команды kill) 
# по умолчанию показывает список принадлежащих вам процессов. 
# Можно вместо этого показывать список всех процессов:
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# End of lines added by compinstall
zstyle ':completion:*' menu yes select
