alias reload!='. ~/.zshrc'

alias env-set='export $(cat .env | grep -v ^# | xargs)'
alias env-unset='unset $(cat .env | grep -v ^# | sed -E "s/(.*)=.*/\1/" | xargs)'