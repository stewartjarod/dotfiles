
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

# Get the transcript of a YouTube video
alias yt-merp='f(){ youtube_transcript_api --format text -- "$@" | pbcopy; }; f'

yt_times() {
  youtube_transcript_api "$@" --format json \
  | jq -r '
      .[0]                                        # unwrap outer array
      | sort_by(.start)
      | group_by((.start|floor))
      | .[]
      | ($s := (.[0].start|floor))                # get second value
      | "\(($s/3600|floor|tostring|lpad(2;"0"))):\((($s%3600)/60|floor|tostring|lpad(2;"0"))):\(($s%60|tostring|lpad(2;"0"))): \((map(.text)|join(" ")) )"
    ' \
  | pbcopy
}

alias yt-t='f(){ youtube_transcript_api --format json -- "$@" \
  | jq -r ".[0]      # unwrap outer array
           | sort_by(.start)
           | group_by((.start|floor))
           | .[]
           | \"\((.[0].start|floor)): \((map(.text)|join(\" \")) )\"" \
  | pbcopy; }; f'


function yt() {
  local id="$1"
  if [[ -z "$id" ]]; then
    echo "Usage: yt-t VIDEO_ID"
    return 1
  fi

  {
    echo "VIDEO_ID: $id"
    youtube_transcript_api --format json -- "$id" \
    | jq -r '.[0]
              | sort_by(.start)
              | group_by((.start|floor))
              | .[]
              | "\((.[0].start|floor)): \((map(.text)|join(" ")))"'
  } | pbcopy

  echo "Transcript copied to clipboard!"
}
