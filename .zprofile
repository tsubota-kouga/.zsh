#zsh

#GUI:ja CUI:en
case $TERM in
    linux)  LANG=C ;
            setfont Lat15-Terminus12x6;;

    *)      LANG=ja_JP.UTF-8;;
esac



export PATH="$HOME/.cargo/bin:$PATH"
