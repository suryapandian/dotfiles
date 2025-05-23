alias pl="cd /Users/suryapandian/repo/pl"
alias life="cd /Users/suryapandian/repo/pl/magic"
alias cat='bat -n --plain --theme=Nord --paging=never'

#rust
alias cf='clear && cargo fmt'
alias cb='clear && cargo fmt && cargo fix --allow-dirty && cargo build --workspace --all-targets'
alias cc='cargo fmt && check --all-targets --all-features --workspace'
alias ct='cargo test'
alias cr='cargo run'
alias cw='cargo watch'
alias ci='clear && cargo fmt && cargo clippy --all-targets --workspace  -- -D warnings'
alias releaser='clear && /Users/suryapandian/repo/tl/releaser/target/debug/releaser'
alias clipper='/Users/suryapandian/repo/tl/rust-clipper/target/debug/clipper'
alias lspods='/Users/suryapandian/repo/tl/lspods/target/debug/lspods'
alias gitopspull='for d in $(fd . --type d --max-depth 1); do
 cd $d
 git checkout master
 git pull
 cd ..
done'
alias rr='open -na "RustRover.app" --args "$@"'
alias sans='cd /Users/suryapandian/repo/pl/ससकतम'

ulimit -n 24000
export RUST_BACKTRACE=0

#git
alias gp='git pull'
alias gm='git merge'
alias gpu='git push'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -s -m'
alias gcam='git add . && git commit -s -am'
alias gsc='git switch -c'
alias gpun='git push --set-upstream origin'
alias gprune='git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d'
alias gpr='gh pr create --fill'
alias gpre='gh pr comment --body "/pretag"'

alias cctxt='kubectl config view --minify'

export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_KUBECTL_SHOW=true

alias s='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
