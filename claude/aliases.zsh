alias cc='claude --dangerously-skip-permissions --chrome'
alias ccr='claude --continue --dangerously-skip-permissions --chrome'
alias ccp='claude --permission-mode plan --chrome'

# Review current PR with claude
ccpr() {
  claude "Review the current PR. Run gh pr diff to see changes, then provide a thorough code review with actionable feedback."
}
