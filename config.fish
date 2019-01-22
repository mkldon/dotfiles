set PATH /usr/local/Cellar/postgresql@9.6/9.6.10/bin $PATH
set PATH /usr/local/opt/python/libexec/bin $PATH
set PATH /Users/mike/Library/Python/2.7/bin $PATH
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

alias k kubectl
alias g git
alias z zeus

bind \e. 'history-token-search-backward'
