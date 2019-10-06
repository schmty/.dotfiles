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
nvm use 10.16.1
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

# Colors:
set fish_color_normal EBDBB2 # the default color
set fish_color_command D3869B # the color for commands
set fish_color_quote FABD2F # the color for quoted blocks of text
set fish_color_redirection 83A598 # the color for IO redirections
set fish_color_end D65D0E # the color for process separators like ';' and '&'
set fish_color_error FB4934 --background=F92672 # the color used to highlight potential errors
set fish_color_param B8BB26 # the color for regular command parameters
set fish_color_comment 928374 # the color used for code comments
set fish_color_match 8EC07C # the color used to highlight matching parenthesis
set fish_color_search_match --background=49483E # the color used to highlight history search matches
set fish_color_operator 8EC07C # the color for parameter expansion operators like '*' and '~'
set fish_color_escape 66D9EF # the color used to highlight character escapes like '\n' and '\x70'
set fish_color_cwd 66D9EF # the color used for the current working directory in the default prompt

# Additionally, the following variables are available to change the highlighting in the completion pager:
set fish_pager_color_prefix F8F8F2 # the color of the prefix string, i.e. the string that is to be completed
set fish_pager_color_completion 75715E # the color of the completion itself
set fish_pager_color_description 49483E # the color of the completion description
set fish_pager_color_progress F8F8F2 # the color of the progress bar at the bottom left corner
set fish_pager_color_secondary F8F8F2 # the background color of the every second completion

