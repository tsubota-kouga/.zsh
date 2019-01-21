# export LANG=en_US
export LANG=ja_JP.UTF-8

#anaconda3
export PATH="$HOME/anaconda3/bin/:$PATH"

#AndroidStudio
export PATH="/usr/local/android-Files/android-studio/bin/:$PATH"
export ANDROID_HOME="/usr/local/AndroidStudio/:$ANDROID_HOME"
alias androidstudio='studio.sh'

#cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

# config
XDG_CONFIG_HOME="$HOME/.config:$XDG_CONFIG_HOME"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# cython
export CPATH="/usr/include/python3.6/:$CPATH"

# java
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"

# qt
export LIBRARY_PATH="$HOME/Qt/gcc_64/bin:$LIBRARY_PATH"
export LIBRARY_PATH="$HOME/Qt/gcc_64/lib:$LIBRARY_PATH"
export LIBRARY_PATH="$HOME/Qt/gcc_64/include:$LIBRARY_PATH"

export CPATH="$HOME/Qt/gcc_64/bin:$CPATH"
export CPATH="$HOME/Qt/gcc_64/lib:$CPATH"
export CPATH="$HOME/Qt/gcc_64/include:$CPATH"

export PATH="$HOME/Qt/gcc_64/bin:$PATH"
export PATH="$HOME/Qt/gcc_64/lib:$PATH"
export PATH="$HOME/Qt/gcc_64/include:$PATH"
export PATH="$HOME/Qt/Tools/QtCreator/bin:$PATH"

export CMAKE_PREFIX_PATH="$HOME/Qt/5.11.1/gcc_64/:$CMAKE_PREFIX_PATH"

export PATH="$HOME/Qt/5.11.1/gcc_64/bin:$PATH"

# to use Japanese in Qt application
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# git clone library
export PATH="/usr/local/include:$PATH"
export CPATH="/usr/local/include:$CPATH"
export LIBRARY_PATH="/usr/local/include:$LIBRARY_PATH"

# nimble
export PATH="$HOME/.nimble/bin/:$PATH"

# node.js
export NODE_PATH='/usr/local/lib/node_modules'

# bazel
export PATH="$HOME/bin:$PATH"
