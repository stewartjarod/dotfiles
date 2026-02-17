alias reload!='. ~/.zshrc'

alias npx='nocorrect npx'
alias sst='nocorrect sst'

alias env-set='export $(cat .env | grep -v ^# | xargs)'
alias env-unset='unset $(cat .env | grep -v ^# | sed -E "s/(.*)=.*/\1/" | xargs)'

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
