#!/usr/bin/env zsh

# Update Homebrew itself and all formulae
brew update && brew upgrade

# Get list of installed formulae and casks
FORMULAS=($(brew list --formula))
CASKS=($(brew list --cask))

# Reinstall all formulas
if [[ ${#FORMULAS[@]} -gt 0 ]]; then
  echo "Reinstalling formulas..."
  for formula in $FORMULAS; do
    echo "Reinstalling $formula..."
    brew reinstall "$formula" || echo "Failed to reinstall $formula"
  done
else
  echo "No formulas installed."
fi

# Reinstall all casks
if [[ ${#CASKS[@]} -gt 0 ]]; then
  echo "Reinstalling casks..."
  for cask in $CASKS; do
    echo "Reinstalling $cask..."
    brew reinstall --cask "$cask" || echo "Failed to reinstall $cask"
  done
else
  echo "No casks installed."
fi

echo "Homebrew (re)installation complete."

