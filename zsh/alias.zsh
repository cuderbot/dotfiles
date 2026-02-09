# Change cat for batcat which is better
alias cat=bat
alias l="eza --long --header --all --icons --git"
alias v=nvim
alias nv="nvim ."
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias yl="yarn local"
alias restart-zsh="source ~/.zshrc"
alias npmln="npm run lint"


# Sirve para volver a indexear el spotlight
function refreshSpotlight() {
  sudo mdutil -a -i off
  sudo mdutil -a -i on
  sudo mdutil -E
}
