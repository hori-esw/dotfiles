# いつもの
set -o vi
alias "ll=ls -laF" "lt=ls -ltarF" "ld=ls -ld" 'view=vim -R'

# clipboard使う
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

PATH=$PATH:~/.composer/vendor/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
