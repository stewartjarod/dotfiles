alias reload!='. ~/.zshrc'

alias env-set='export $(cat .env | grep -v ^# | xargs)'
alias env-unset='unset $(cat .env | grep -v ^# | sed -E "s/(.*)=.*/\1/" | xargs)'

[[ -f /opt/homebrew/share/google-cloud-sdk/path.zsh.inc ]] && source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
[[ -f /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc ]] && source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
