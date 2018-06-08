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
setopt ignore_eof

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

alias mkdir='mkdir -p'

#sudoの後にコマンドのエイリアス展開を有効にする
alias sudo='sudo '

alias ...='cd ../..'
alias ....='cd ../../..'

#グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g M='| more'

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
    cython $1 --embed
    gcc -O2 $run_name.c -o $run_name $(python-config --cflags --ldflags) && shift && ./$run_name $@
    rm $run_name.c
}
alias -s pyx=runcy

#shell
alias -s sh=bash

#html
alias -s html=firefox

# lua
alias lua='lua5.3'
#写真を見る
alias -s {png, jpg, bmp, PNG, JPG, BMP}=eog

#圧縮ファイルを展開
function extract()
{
    case $1 in
        *.tar.gz|*.tgz  ) tar xzvf $1;;
        *.tar.xz        ) tar Jxvf $1;;
        *.zip           ) unzip $1;;
        *.lzh           ) lha e $1;;
        *.tar.bz2|*.tbz ) tar xjvf $1;;
        *.tar.Z         ) tar zxvf $1;;
        *.gz            ) gzip -d $1;;
        *.bz2           ) bzip -d $1;;
        *.Z             ) uncompress $1;;
        *.tar           ) tar xvf $1;;
        *.arj           ) unarj $1;;
    esac
}
alias -s {gz, tgz, zip, lzh, bz2, tbz, Z, tar, arj, xz}=extract

#c/cpp
#g++
alias g++='g++ -std=c++17'
function runcpp()
    {
        run_name=${1:2:r}
        g++ -O2 $1 -o $run_name && shift && ./$run_name $@
    }
alias -s cpp=runcpp

#gcc
alias gcc='gcc -std=c11'
function runc()
    {
        run_name=${1:2:r}
        gcc -O2 $1 -o $run_name && shift && ./$run_name $@
    }
alias -s c=runc

#nvcc
alias nvcc='nvcc -std=c++14'
function runcu()
    {
        run_name=${1:2:r}
        nvcc -O2 $1 -o $run_name && shift && ./$run_name $@
    }
alias -s cu=runcu

#java
function runjava()
    {
        run_name=${1:2:r}
        javac -O2 $1 -o $run_name && shift && java $run_name $@
    }
alias -s java=runjava

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

