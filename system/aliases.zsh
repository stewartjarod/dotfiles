
if (( $+commands[eza] ))
then
  alias ls="eza"
  alias l="eza -lAh"
  alias ll="eza -lh"
  alias la='eza -A'
fi

alias vim="nvim"
alias sso="aws sso login --sso-session=stewartjarod"

# Pick AWS profile with fzf and login
awsp() {
  export AWS_PROFILE=$(aws configure list-profiles | fzf --prompt="AWS Profile: ")
  [[ -n "$AWS_PROFILE" ]] && aws sso login
}
