#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec /usr/bin/xmonad

# Запуск трея
#exec /usr/bin/stalonetray &
exec trayer --edge top --align center --SetDockType true --SetPartialStrut true --expand true --width 18 --height 16 --transparent true --tint 0x000000 &

# Натройка курсора
xsetroot -cursor_name left_ptr -solid '#090909' &

# Запуск коньков (показ системной информации на экран
#/usr/bin/conky &

# Настройка фона
feh --bg-scale Изображения/Фон/simplyx.02.png

# Настройка цветов и др. настроек X
xrdb .Xresources

xmodmap .Xmodmap
# Аплет подключения к сети NetworkManager
#exec ck-launch-session /usr/bin/nm-applet &

# Аплет показа раскладки
exec /usr/bin/xxkb &

# Tiling WM 
exec /usr/bin/xmonad

