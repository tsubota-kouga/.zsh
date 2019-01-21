#zsh

#色を使えるようにする
autoload -Uz colors
colors

# キーバインドをviにする
bindkey -v

#ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000


#プロンプト
#1行表示
#PROMPT="%~ %# "
#2行表示
PROMPT=$"%B%{$fg[green]%}[%n@%m]%{${fg[blue]}%} %~%b
%# "


#単語の区切りを指定する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


#補完
#補完機能有効
autoload -Uz compinit
compinit

#補完で大文字も小文字もマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                            /usr/sbin /usr/bin /sbin /bin
#psコマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#tabで補完を表示させた後、続けてtabを押すと候補からパスを選択できるようになる
zstyle ':completion:*:default' menu select=1

#vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg()
{
    LANG=en.US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


#オプション
#日本語名ファイルを表示可能にする
setopt print_eight_bit

#beepを無効にする
setopt no_beep

#フローコントロールを無効にする
setopt no_flow_control

#C-dでzshを終了させない
# setopt ignore_eof

#'#'以降をコメントとする
setopt interactive_comments

#ディレクトリ名だけでcdできる
setopt auto_cd

#cdしたら自動でpushdする
setopt auto_pushd

#同時に起動したzshの間でヒストリーを共有する
setopt share_history

#同じコマンドをヒストリーに残さない
setopt hist_ignore_all_dups

#スペースから始まるコマンドはヒストリには残さない
setopt hist_ignore_space

#ヒストリーに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#高機能なワイルドカードを使用する
setopt extended_glob

#コマンドミスを修正
setopt correct

#キーバインド
#C-rで履歴検索するときに*でワイルドカードを使用できるようにする
bindkey '^R' history-incremental-pattern-search-backward
bindkey ';5C' forward-word
bindkey ';5D' backward-word


#エイリアス設定
alias la='ls -a'
alias ll='ls -l'
alias l='ls'
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U pip"

alias mkdir='mkdir -p'

function mkdircd(){ mkdir -p $@ && cd $_ }

function mvcd(){ mv $@ && cd $_ }

function iphone(){ sudo idevicepair pair }

#sudoの後にコマンドのエイリアス展開を有効にする
alias sudo='sudo '

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# alias apt=apt-fast
alias update='apt update && apt upgrade'
#グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g M='| more'
alias -g S='| sort'

#Cで標準出力をクリップボードにコピーする
if which pbcopy>/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >dev/null 2>&1 ; then
    #Cygwin
    alias -g C='| putclip'
fi

#python3
alias -s py=ipython

#cython c-compilation
function runcy()
{
    run_name=${1:2:r}
    cython ${1:2} --embed
    gcc -O2 $run_name.c -o $run_name $(python-config --cflags --ldflags) && shift && ./$run_name $@
    rm $run_name.c
}
alias -s pyx=runcy

#shell
alias -s sh=bash

#html
alias -s html=firefox

# lua
alias -s lua=luajit

#写真を見る
alias -s {png,jpg,bmp,PNG,JPG,BMP}=eog

#pdf
alias -s pdf=evince

#blender
alias -s blend=blender

#gimp
alias -s xcf=gimp

#圧縮ファイルを展開
function extract()
{
    case $1 in
        *.tar.gz|*.tgz) tar xzvf ${1:2};;
        *.tar.xz) tar Jxvf ${1:2};;
        *.zip) unzip ${1:2};;
        *.lzh) lha e ${1:2};;
        *.tar.bz2|*.tbz) tar xjvf ${1:2};;
        *.tar.Z) tar zxvf ${1:2};;
        *.gz) gzip -d ${1:2};;
        *.bz2) bzip -d ${1:2};;
        *.Z) uncompress ${1:2};;
        *.tar) tar xvf ${1:2};;
        *.arj) unarj ${1:2};;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

#c/cpp
#g++
alias g++='g++ -std=c++17'
function runcpp()
{
    run_name=${1:2:r}
    g++ -O3 ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s cpp=runcpp

#gcc
alias gcc='gcc -std=c11'
function runc()
{
    run_name=${1:2:r}
    gcc -O2 ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s c=runc

#nvcc
alias nvcc='nvcc -std=c++14'
function runcu()
{
    run_name=${1:2:r}
    nvcc ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s cu=runcu

#java
function runjava()
{
    run_name=${1:2:r}
    javac -O ${1:2} && shift && java $run_name $@
}
alias -s java=runjava

#lua
function runlua()
{
    run_name=${1:2}
    shift
    luajit $run_name $@
}

#cobol
function runcobol()
{
    run_name=${1:2:r}
    cobc -O2 -x ${1:2} && shift && ./$run_name $@
}
alias -s cbl=runcobol

#nim
function runnim()
{
    nim c -r ${1:2}
}
alias -s nim=runnim

function runjs()
{
    run_name=${1:2}
    shift
    node $run_name $@
}
alias -s js=runjs

function runts()
{
    run_name=${1:2:r}
    tsc $run_name.ts && shift && node $run_name.js $@
}
alias -s ts=runts

function runcs()
{
    run_name=${1:2}
    mcs $run_name.cs && shift && ./$run_name.exe $@
}
alias -s cs=runcs

function runqml()
{
    qmlscene ${1:2}
}
alias -s qml=runqml

function runrust()
{
    run_name=${1:2:r}
    rustc $run_name.rs && shift && ./$run_name $@
}
alias -s rs=runrust

alias ipython='ipython --no-banner'
#OS別の設定
case ${OSTYPE} in
    darwin*)
        # Mac
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        # Linux
        alias ls='ls -F --color=auto'
        ;;
esac

