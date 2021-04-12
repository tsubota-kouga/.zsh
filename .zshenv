
# export LANG=en_US
export LANG=ja_JP.UTF-8

#anaconda3
export PATH="$HOME/anaconda3/bin/:$PATH"

#AndroidStudio
export ANDROID_HOME="$HOME/Android/Sdk/:$ANDROID_HOME"
export ANDROID_HOME="/usr/lib/android-sdk/:$ANDROID_HOME"
export PATH="$HOME/Android/Sdk/:$PATH"
export PATH="/usr/lib/android-sdk/:$PATH"

# config
XDG_CONFIG_HOME="$HOME/.config:$XDG_CONFIG_HOME"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export LD_LIBRARY_PATH="$PYENV_ROOT/versions/3.8-dev/lib:$LD_LIBRARY_PATH"

# cython
export CPATH="/usr/include/python3.6/:$CPATH"

# java
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# javafx
export PATH_TO_FX="/usr/share/openjfx/lib"

# to use Japanese in Qt application
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# git clone library
export PATH="/usr/local/include:$PATH"
export CPATH="/usr/local/include:$CPATH"

# nimble
export PATH="$HOME/.nimble/bin/:$PATH"

# node.js
export NODE_PATH='/usr/local/lib/node_modules'

# bazel
export PATH="$HOME/bin:$PATH"

# enhancd
export ENHANCD_FILTER=fzf:peco

# fonts
export PATH="$HOMR/.fonts:$PATH"

# rbenvj
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#stack
export PATH="$HOME/.local/bin:$PATH"

# dart
export PATH="$HOME/snap/flutter/common/flutter/bin:$PATH"
export PATH="$HOME/snap/flutter/common/flutter/.pub-cache/bin:$PATH"

# golang
export GOENV_ROOT="$HOME/.goenv"
export GOENV_GOPATH_PREFIX="$HOME/.go"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin/$PATH"

# nvm
# export NVM_DIR="$HOME/.nvm"
# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# cuda
export PATH="/usr/local/cuda/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

