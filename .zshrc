
# zmodload zsh/zprof && zprof
# export LANG=C

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async"

zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/enhancd", use:"init.sh"

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"

# export NVM_LAZY_LOAD=true
# zplug "lukechilds/zsh-nvm"

autoload -Uz colors
colors

bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000


PROMPT=$"%B%{$fg[green]%}[%n@%m]%{${fg[blue]}%} %~%b
%# "


# define sep of words
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


# these are invoked in zplug-init
# autoload -Uz compinit
# compinit

# use ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                            /usr/sbin /usr/bin /sbin /bin
# completion of process name by using ps's output
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# push tab and complete
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

setopt print_eight_bit  # enable 8bits file name
setopt no_beep
setopt no_flow_control
setopt interactive_comments  # start comments with #
setopt auto_cd
setopt auto_pushd
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob  # use extended wild cards
setopt correct  # correct command typo
bindkey '^R' history-incremental-pattern-search-backward  # C-r
bindkey ';5C' forward-word
bindkey ';5D' backward-word

alias la='ls -a'
alias ll='ls -l'
alias l='ls'
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | grep -v '@' | cut -d = -f 1 | xargs -p pip install -U pip"

alias pc-suspend='systemctl suspend'
alias gdb='gdb -silent'
alias mkdir='mkdir -p'
function mkdircd(){ mkdir -p $@ && cd $_ }
function mvcd(){ mv $@ && cd $_ }

function iphone(){ sudo idevicepair pair }
alias reverse-tethering="$HOME/Downloads/gnirehtet-rust-linux64/gnirehtet autorun"
alias filer=nemo

alias sudo='sudo '  # enable alias expand after sudo

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias update='apt update && apt upgrade'
# global alias
alias -g L='| less'
alias -g G='| grep --color'
alias -g M='| more'
alias -g S='| sort'
alias -g F='$(fzf)'

# clip board
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
alias -s py=python
alias ipython='ipython --no-banner'

#cython c-compilation
function runcy() {
    run_name=${1:2:r}
    cython ${1:2} --embed
    gcc -O2 $run_name.c -o $run_name $(python-config --cflags --ldflags) && shift && ./$run_name $@
    rm $run_name.c
}
alias -s pyx=runcy

alias -s sh=bash

alias -s html=firefox

alias -s {png,jpg,bmp,PNG,JPG,BMP,ico}=feh

alias -s pdf=evince

alias -s blend=blender

alias -s xcf=gimp

alias -s wav=aplay

alias -s pl=perl

function extract() {
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
        *.zx) unzx ${1:2};;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

alias g++='g++ -std=c++17'
function runcpp() {
    run_name=${1:2:r}
    g++ -O3 ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s cpp=runcpp

alias gcc='gcc -std=c11'
function runc() {
    run_name=${1:2:r}
    gcc -O2 ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s c=runc

alias nvcc='nvcc -std=c++14'
function runcu() {
    run_name=${1:2:r}
    nvcc ${1:2} -o $run_name && shift && ./$run_name $@
}
alias -s cu=runcu

function runjava() {
    run_name=${1:2:r}
    javac -O ${1:2} && shift && java $run_name $@
}
alias -s java=runjava

function runkotlin() {
    run_name=${1:2:r}
    kotlinc ${1:2} -include-runtime -d $run_name.jar && kotlin $run_name.jar
}
alias -s kt=runkotlin

alias -s lua=luajit

function runlua() {
    run_name=${1:2}
    shift
    luajit $run_name $@
}

function runcobol() {
    run_name=${1:2:r}
    cobc -O2 -x ${1:2} && shift && ./$run_name $@
}
alias -s cbl=runcobol

function runnim() {
    nim c -r ${1:2}
}
alias -s nim=runnim

function runjs() {
    run_name=${1:2}
    shift
    node $run_name $@
}
alias -s js=runjs

function runts() {
    run_name=${1:2:r}
    tsc $run_name.ts && shift && node $run_name.js $@
}
alias -s ts=runts

function runcs() {
    run_name=${1:2}
    mcs $run_name && shift && ./$run_name.exe $@
}
alias -s cs=runcs

function runqml() {
    qmlscene ${1:2}
}
alias -s qml=runqml

function runrust() {
    run_name=${1:2:r}
    rustc $run_name.rs && shift && ./$run_name $@
}
alias -s rs=runrust

function runlatex() {
    run_name=${1:2:r}
    platex $run_name.latex
    platex $run_name.latex  # for \tableofcontents
    dvipdfmx $run_name.dvi
    rm ${run_name}.aux ${run_name}.log ${run_name}.dvi ${run_name}.nav \
        ${run_name}.out ${run_name}.toc ${run_name}.snm
}
alias -s latex=runlatex

function runlibre() {
    libreoffice ${1:2}
}
alias -s {odp,odp,docs,xls,xlsx,pptx}=runlibre


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

export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

if [ ~/.zcompdump -nt ~/.zcompdump.zwc ]; then
   zcompile ~/.zcompdump
fi

if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
   zcompile ~/.zcompdump
fi

if [ ~/.zprofile -nt ~/.zprofile.zwc ]; then
   zcompile ~/.zcompdump
fi

if [ ~/.zsh_history -nt ~/.zsh_history.zwc ]; then
   zcompile ~/.zcompdump
fi

# Install plugins which is not installed
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

zplug load

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi

