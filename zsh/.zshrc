
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
    alias l="exa --long --header --all --icons --git"
    alias v=nvim
    alias nv="nvim ."
	alias vim=nvim
	alias vi=nvim
}

_setup_env() {
	# undodir for vim/nvim
	UNDODIR_PATH="${HOME}/.config/nvim/undodir"
	QMK_HOME="${HOME}"/workspace/qmk_firmware/
}

_setup_post_config() {
    # Fix for brew not found, more info: (https://apple.stackexchange.com/questions/148901/why-does-my-brew-installation-not-work)
    eval $(/opt/homebrew/bin/brew shellenv)

    # Setting up fnm 
    eval "$(fnm env --use-on-cd)"
}

_setup_config() {
    # Setup post config stuff
    _setup_post_config
    # Setup OMZ
	_setup_omz

	# Setup all the alias
	_setup_alias

	# Setup Environment variables
	_setup_env
}


_setup_config 
