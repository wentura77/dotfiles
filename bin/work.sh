#!/bin/bash
mkdir /home/wentura/Рабочий\ стол/obmen/
lastlogin=$(cat ~/login.txt)
userlogin=$(zenity --entry --text='Введите Ваш логин:' --entry-text=$lastlogin --title='ВНИМАНИЕ')
echo $userlogin > ~/login.txt
userpass=$(zenity --entry --text='Введите Ваш пароль:' --hide-text --title='ВНИМАНИЕ')
serverip=$(zenity --list --radiolist --title "ВНИМАНИЕ" --text "<b>Выберите рабочий сервер</b>\n\t тыркните точку и нажмите ОК" --column "" --column "" --column "список серверов" TRUE "89.1.41.222" "office" FALSE "89.1.41.91" "analit" FALSE "89.1.41.86" "model" FALSE "89.1.41.87" "Buhgalter" --height 250 --hide-column 2)
if [[ "$serverip" == "89.1.41.86" ]]; then
        xfreerdp -u $userlogin -p $userpass --ignore-certificate -a 32 -g 1400x1055 --plugin rdpsnd --plugin drdynvc --data audin -- --no-tls $serverip
else
        zenity --question --text=${userlogin}',запускаем в полном экране?' --title='РЕЖИМ РАБОТЫ ТЕРМИНАЛА'
        if [ $? -eq 0 ]; then
                xfreerdp -f -u $userlogin -p $userpass --ignore-certificate -a 16 --plugin rdpdr --data disk:user:/home/user/Рабочий\ стол/obmen/ --plugin rdpsnd --plugin drdynvc --data audin -- --no-tls $serverip
        else
                X_RES=$(xrandr | sed -n 's/.\{0,\}current \([0-9]\{1,\}\) x [0-9]\{1,\}.\{0,\}/\1/g;p;q')
                Y_RES=$(xrandr | sed -n 's/.\{0,\}current [0-9]\{1,\} x \([0-9]\{1,\}\).\{0,\}/\1/g;p;q')
                let "X_RES -= 10"
                let "Y_RES -= 30"
                xfreerdp -u $userlogin -p $userpass --ignore-certificate -a 32 -g ${X_RES}x${Y_RES} --plugin rdpdr --data disk:user:/home/user/Рабочий\ стол/obmen/ --plugin rdpsnd --plugin drdynvc --data audin -- --no-tls $serverip
        fi
fi
