alias c="clear"
alias git="hub"
alias n="nvim"
alias v="vim"
alias nrc="nvim ~/.config/nvim/init.vim"
alias e="open -a emacs"
alias brewup="brew update; and brew upgrade"
nvm use default
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

if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# setup colors
theme_gruvbox 'dark' 'medium'

