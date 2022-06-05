alias pl="/Users/suryapandian/repo/personal"
alias life="/Users/suryapandian/repo/personal/magic"

#rust
alias cf='cargo fmt'
alias cb=' cargo build --workspace --all-targets'
alias cc='cargo clippy --all-targets --all-features --workspace'
alias ct='cargo test'
alias cr='cargo run'
ulimit -n 24000
export RUST_BACKTRACE=0

#git
alias gp='git pull'
alias gm='git merge'
alias gpu='git push'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gsc='git switch -c'

#k8s
alias k='kubectl'
alias kp='k get pods'
alias cctxt='kubectl config view --minify'

export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_KUBECTL_SHOW=true


alias s='subl .'
