set PATH /usr/local/Cellar/postgresql@9.6/9.6.10/bin $PATH
set PATH /usr/local/opt/python/libexec/bin $PATH
set PATH /Users/mike/Library/Python/2.7/bin $PATH
set PATH /usr/local/opt/imagemagick@6/bin $PATH
set PATH ~/yandex-cloud/bin $PATH
set PATH /Users/mike/Library/Python/3.7/bin $PATH
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -x EDITOR vim

set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

alias g git
alias gs "git status"

alias be "bundle exec"
alias z zeus

alias k kubectl
alias kgp "kubectl get pods"

function kubeconf
  kubectl --context=$argv[1] --namespace=$argv[2] get configmap $argv[2]-config -o yaml > /tmp/kube-config-$argv[1]-$argv[2].yml;
  vim /tmp/kube-config-$argv[1]-$argv[2].yml;
  kubectl --context=$argv[1] --namespace=$argv[2] replace -f /tmp/kube-config-$argv[1]-$argv[2].yml;
end

function kcon
  set -l pod (kubectl --context=$argv[1] --namespace=$argv[2] get pod | grep -e ".*\(web\|deploy\|api\).*Running" | cut -f 1 -d " " | head -n 1)
  kubectl --context=$argv[1] --namespace=$argv[2] exec -it $pod -- bin/rails c 
end

function kk
  kubectx $argv[1] && kubens $argv[2]
end

complete -c kk -a "production staging"

function felix_bump_schema
  git checkout master &&
  git pull &&
  git checkout - &&
  git checkout master db/structure.sql &&
  git add db/structure.sql &&
  git commit -m "update structure.sql" --allow-empty &&
  bundle
  env RAILS_ENV=test rake db:update RAILS_ENV=test &&
  git add -p db/structure.sql &&
  git commit --amend
end

function ksw
  kubectx $argv[1] && kubens $argv[2]
end


bind \e. 'history-token-search-backward'

set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libressl/bin" $fish_user_paths

# nodenv
status --is-interactive; and source (nodenv init -|psub)

set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
