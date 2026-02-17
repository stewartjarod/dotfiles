alias reload!='. ~/.zshrc'

alias env-set='set -a && source .env && set +a'
alias env-unset='unset $(grep -v ^# .env | sed -E "s/(.*)=.*/\1/" | xargs)'

[[ -f /opt/homebrew/share/google-cloud-sdk/path.zsh.inc ]] && source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
[[ -f /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc ]] && source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
