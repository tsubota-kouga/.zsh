#anaconda3
export PATH="/home/kouga/anaconda3/bin/:$PATH"

#AndroidStudio
export PATH="/usr/local/android-Files/android-studio/bin/:$PATH"
export ANDROID_HOME="/usr/local/AndroidStudio/:$ANDROID_HOME"
alias androidstudio='studio.sh'

#cuda
PATH="/usr/local/cuda-9.1/bin:$PATH"

# python
XDG_CONFIG_HOME=$XDG_CONFIG_HOME:/home/kouga/.config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# cython
export CPATH="/usr/include/python3.6/:$CPATH"
