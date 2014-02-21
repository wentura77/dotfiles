gdictionary () (
# http://code.google.com/p/dict-lookup-chrome-ext/source/browse/trunk/extension/lookup.js
# http://www.google.com/dictionary?langpair=en|ru&q=chemist&hl=ru&aq=f
# http://www.zsh.org/mla/users/2006/msg00063.html 
#
    wget -qO- "http://www.google.com/dictionary?langpair=en|ru&q=$1&hl=ru&aq=f" | grep dct-tt | sed /'class=\"dct-e/d' | sed '/<a\ href/d' | sed 's/<span class="dct-tt">//g' |sed 's/<\/span>//' | sed '/<span /d' | head -n 3
)
translate() {
    wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=${2:-en}|${3:-ru}" | sed -E -n 's/[[:alnum:]": {}]+"translatedText":"([^"]+)".*/\1/p';
    echo ''
    return 0;
}
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
shared_dir() {
    python /usr/lib/python2.7/SimpleHTTPServer.py
}

proxy(){
    export proxy=http://89.1.1.8:3128/
    export http_proxy=$proxy
    export ftp_proxy=$proxy
    export all_proxy=$proxy
}

proxyoff(){
    unset http_proxy
    unset ftp_proxy
    unset proxy
    unset all_proxy
}

torrent(){
    if [ -f $1 ] ; then
        rtorrent ~/Загрузки/**.torrent
    else
        rtorrent $1/**.torrent
    fi
}
vm_forward() {
	    MACHINE=$1
	    SERVICE=$2
	    FROM_PORT=$3
	    TO_PORT=$4

	    VBoxManage setextradata "$MACHINE" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$SERVICE/Protocol" TCP
	    VBoxManage setextradata "$MACHINE" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$SERVICE/GuestPort" $FROM_PORT
	    VBoxManage setextradata "$MACHINE" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$SERVICE/HostPort" $TO_PORT
}

run() {
# Run django application server
# from ./bin directory
         DJANGO=bin/django
             if [ -e $DJANGO ]; then
                  if $DJANGO help 2>&1 | grep -q runserver_plus; then
                      $DJANGO runserver_plus 0.0.0.0:8000
                  else
                      $DJANGO runserver 0.0.0.0:8000
                  fi
              fi
 }

