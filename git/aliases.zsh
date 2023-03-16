# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gprune='git pull --prune'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

function gcb() {
  echo $(git branch | grep -E '^\* ' | sed 's/^\* //g')
}
function gpull() {
  git pull --rebase origin $(gcb)
}

alias gpl='git pull --rebase'
alias gp='git push'

alias current_branch="echo $(git branch | grep -E '^\* ' | sed 's/^\* //g')"
alias gcb='current_branch | pbcopy'
alias gpull="git pull --rebase origin $current_branch"
alias gpush='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit -am'
alias gcam='git commit -a --amend'
alias gad='git add . && git commit -am'
alias gco='git checkout'
alias grbm='git fetch --all & git rebase origin/main --no-ff'

alias gdelorigin="git branch -r --merged | grep -v main | sed 's/origin\//:/' | xargs -n 1 git push origin"
alias gdelete="git for-each-ref --format '%(refname:short)' refs/heads | grep -v main | xargs git branch -D"

alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.

function gtag() {
  if [ -n $1 ]
  then
    echo "› Creating tag: v$1"
    if git tag -a "v$1" -m "v$1" >/dev/null
    then
      echo "› Pushing Tag to Upstream"
      git push origin --tags
    else
      echo "EXITING"
      return
    fi
  else
    echo "Must pass tag"
  fi
}


function tag() {
  if [ -n $1 ]
  then
    git fetch --all --tags
    current_tag="$(git describe --abbrev=0 --tags)"
    echo "› Current Tag: $current_tag"
    vers=("${(@s/./)current_tag}")
    patch=$vers[3]
    minor=$vers[2]
    major=${vers[1][2,-1]}

    if [[ "$1" == "p" || "$1" == "patch" ]]
    then
      echo "› Patching"
      patch=$(($patch + 1))
    elif [[ $1 == "m" || $1 == "min" || $1 == "minor" ]]
    then
      echo "› Minor Update"
      minor=$(($minor + 1))
      patch=0
    elif [[ $1 == "M" || $1 == "maj" || $1 == "major" ]]
    then
      echo "› Major Update"
      major=$(($major + 1))
      minor=0
      patch=0
    else
      echo '›› Failed to create tag'
      return
    fi

    echo "› Updating to: v$major.$minor.$patch"
    gtag $major.$minor.$patch
  else
    echo "››› Must pass tag"
  fi
}
