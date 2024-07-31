
# setup config omz 
_setup_omz() {
	# Path to your oh-my-zsh installation.
	export ZSH=$HOME/.oh-my-zsh

	# Current Theme
	ZSH_THEME="lambda-mod"

	# load zsh plugins
	plugins=(aliases git fnm yarn npm kubectl fzf)

	# Run the Oh my zsh
	source $ZSH/oh-my-zsh.sh
}

_setup_alias() {
    source "~/workspace/dotfiles/zsh/alias.sh"
    source "~/workspace/dotfiles/zsh/alias-work.sh"
}

_setup_env() {
	# undodir for vim/nvim
	UNDODIR_PATH="${HOME}/.config/nvim/undodir"
	QMK_HOME="${HOME}"/workspace/qmk_firmware/
    PATH=~/.console-ninja/.bin:$PATH
}

_setup_post_config() {
    # Fix for brew not found, more info: (https://apple.stackexchange.com/questions/148901/why-does-my-brew-installation-not-work)
    eval $(/opt/homebrew/bin/brew shellenv)

    # Setting up fnm 
    eval "$(fnm env --use-on-cd)"

    # Setting up thefuck
    eval $(thefuck --alias)
}

_setup_zoxide() {
    source ~/workspace/dotfiles/zsh/zoxide.zsh
}

_setup_nvim_switcher() {
    alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
    alias nvim-cuder="NVIM_APPNAME=CuderNvim nvim"
    alias nvim-chad="NVIM_APPNAME=NvChad nvim"
    alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

    function nvims() {
        items=("cuder" "LazyVim" "NvChad" "AstroNvim")
        config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
        if [[ -z $config ]]; then
            echo "Nothing selected"
            return 0
        fi
        NVIM_APPNAME=$config nvim $@
    }

    bindkey -s ^a "nvims\n"
}

_setup_fzf() {
    eval "$(fzf --zsh)"
    
    # export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
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

    # Setup zoxide
    _setup_zoxide

    # Setup neovim switcher
    _setup_nvim_switcher

    # Setup fzf
    _setup_fzf
}


_setup_config

