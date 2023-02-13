
# setup config omz 
_setup_omz() {
	# Path to your oh-my-zsh installation.
	export ZSH=$HOME/.oh-my-zsh

	# Current Theme
	ZSH_THEME="lambda-mod"

	# load zsh plugins
	plugins=(aliases git fnm)

	# Run the Oh my zsh
	source $ZSH/oh-my-zsh.sh
}

_setup_alias() {
	# Change cat for batcat which is better
	alias cat=bat
  # Change ls for exa
  alias l="exa --long --header --all --icons --git"
  # add alias for neovim
  alias v=nvim
  alias nv="nvim ."
	alias vim=nvim
	alias vi=nvim
  # Alias for lazygit
  alias lg=lazygit
}


_setup_post_config() {
    # Setting up fnm 
    export PATH="${HOME}/.fnm:$PATH"
    eval "`fnm env`"
    eval "$(fnm env --use-on-cd)"
    # Setting up zoxide
    eval "$(zoxide init zsh)"
}

_setup_env() {
	# undodir for vim/nvim
	UNDODIR_PATH="${HOME}/.config/nvim/undodir"
  PATH=$PATH:"${HOME}/.local/bin"
}

_setup_config() {
	# Setup Environment variables
	_setup_env

  # Setup OMZ
	_setup_omz
  
  # Setup post config stuff
  _setup_post_config

	# Setup all the alias
	_setup_alias
}


_setup_config 

