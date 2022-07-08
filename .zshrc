
# setup config omz 
_setup_omz() {
	# Path to your oh-my-zsh installation.
	export ZSH=$HOME/.oh-my-zsh

	# Current Theme
	ZSH_THEME="bureau"

	# Run the Oh my zsh
	source $ZSH/oh-my-zsh.sh
}

_setup_alias() {
	# Change cat for batcat which is better
	alias cat=bat
	alias vim=nvim
	alias vi=nvim
}

_setup_config() {
	# Setup OMZ
	_setup_omz

	# Setup all the alias
	_setup_alias
}

_setup_config 
