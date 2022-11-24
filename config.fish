set PATH /opt/homebrew/bin $PATH
set PATH /opt/homebrew/opt/postgresql@13/bin $PATH
set PATH /usr/local/opt/python/libexec/bin $PATH
set PATH /Users/mike/Library/Python/2.7/bin $PATH
set PATH /usr/local/opt/imagemagick@6/bin $PATH
set PATH ~/yandex-cloud/bin $PATH
set PATH /Users/mike/Library/Python/3.7/bin $PATH
set PATH ~/go/bin $PATH
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -x EDITOR vim
set -x GOROOT "$(brew --prefix go@1.19)/libexec"

alias g git
alias gs "git status"
alias gcm "git checkout master"

alias be "bundle exec"
alias z zeus

alias k kubectl
alias kgp "kubectl get pods"

alias mfg "make fast-generate"

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

function ksw
  kubectx $argv[1] && kubens $argv[2]
end


bind \e. 'history-token-search-backward'

set -g fish_user_paths "/usr/local/opt/postgresql@9.6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libressl/bin" $fish_user_paths

# nodenv

set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
