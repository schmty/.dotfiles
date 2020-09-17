alias c="clear"
alias j="autojump"
alias git="hub"
alias n="nvim"
alias v="vim"
alias nrc="nvim ~/.config/nvim/init.vim"
alias e="open -a emacs"
alias brewup="brew update; and brew upgrade"
alias glog="git log --all --decorate --oneline --graph"
alias gforgot="git add . and git commit --amend --no-edit"
alias grecommit="git add . and git commit --amend"
alias goshit="git checkout -- ."
alias cdc="cd && clear"
nvm use 10
status --is-interactive; and pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)
status --is-interactive; and pyenv virtualenv-init - | source

function fish_user_key_bindings
  fish_vi_key_bindings
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end
  bind -M insert fd "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

set fish_key_bindings fish_user_key_bindings
set -gx PATH /Users/jake/.bin $PATH

# Autojump stuff
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Android SDK setup
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
set -x ANDROID_SDK_ROOT /Users/jake/Library/Android/sdk
set -gx PATH $ANDROID_SDK_ROOT /Users/jake/Library/Android/sdk/platform-tools $PATH

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jake/google-cloud-sdk/path.fish.inc' ]; . '/Users/jake/google-cloud-sdk/path.fish.inc'; end
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

set -x GOOGLE_APPLICATION_CREDENTIALS /Users/jake/.config/kwiver/kwiver-app-firebase-adminsdk-ku8hh-68e5c1f1e9.json

# Use the python3 interpreter on your path
set -x CLOUDSDK_PYTHON python3

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
