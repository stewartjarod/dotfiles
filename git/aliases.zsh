# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

alias gup='git pull upstream master'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit -am'
alias gcam='git commit -a --amend'
alias gad='git add . && git commit -am'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.

function gtag() {
  git fetch --all --tags
  if [ -n $1 ]
  then
    echo "› Creating tag: v$1"
    if git tag -a "v$1" -m "v$1" >/dev/null
    then
      echo "› Pushing Tag to Upstream"
      # git push upstream --tags
    else
      echo "EXITING"
      exit 0
    fi
  else
    echo "Must pass tag"
  fi
}


function tag() {
  if [ -n $1 ]
  then
    current_tag="$(git describe --abbrev=0 --tags)"
    echo "› Current Tag: $current_tag"
    vers=("${(@s/./)current_tag}")
    patch=$vers[3]
    minor=$vers[2]
    major=${vers[1][2,-1]}

    if [ $1 == "p" ]
    then
      echo "› Patching"
      patch=$(($patch + 1))
    elif [ $1 == "min" ]
    then
      echo "› Minor Update"
      minor=$(($minor + 1))
      patch=0
    elif [ $1 == "maj" ]
    then
      echo "› Major Update"
      major=$(($major + 1))
      minor=0
      patch=0
    else
      echo '›› Failed to create tag'
      exit 0
    fi

    echo "› Updating to: v$major.$minor.$patch"
    gtag $major.$minor.$patch
  else
    echo "››› Must pass tag"
  fi
}
