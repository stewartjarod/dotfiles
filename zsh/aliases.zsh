alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias env-set='export $(cat .env | grep -v ^# | xargs)'
alias env-unset='unset $(cat .env | grep -v ^# | sed -E "s/(.*)=.*/\1/" | xargs)'

alias ls='exa'