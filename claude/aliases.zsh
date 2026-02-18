alias cc='claude'
alias ccr='claude --continue'
alias ccp='claude --permission-mode plan'
alias ccd='claude --dangerously-skip-permissions'

# Launch claude in a specific directory
ccw() {
  if [ -n "$1" ]; then
    cd "$1" && claude
  else
    echo "Usage: ccw <directory>"
  fi
}

# Review current PR with claude
ccpr() {
  claude "Review the current PR. Run gh pr diff to see changes, then provide a thorough code review with actionable feedback."
}
