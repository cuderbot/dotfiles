
# setup config omz 
_setup_omz() {
	# Path to your oh-my-zsh installation.
	export ZSH=$HOME/.oh-my-zsh

	# Current Theme
	ZSH_THEME="lambda-mod"

	# load zsh plugins
	plugins=(aliases git fnm yarn npm kubectl)

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
    alias lg=lazygit
    alias yl="yarn local"
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
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin unalias z &>/dev/null || \builtin true
function z() {
    __zoxide_z "$@"
}

\builtin unalias zi &>/dev/null || \builtin true
function zi() {
    __zoxide_zi "$@"
}

if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -i -- ${words[2,-1]})"; then
                result="${__zoxide_z_prefix}${result}"
                # shellcheck disable=SC2296
                compadd -Q "${(q-)result}"
            fi
            \builtin printf '\e[5n'
        fi
        return 0
    }

    \builtin bindkey '\e[0n' 'reset-prompt'
    if [[ "${+functions[compdef]}" -ne 0 ]]; then
        \compdef -d z
        \compdef -d zi
        \compdef __zoxide_z_complete z
    fi
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"
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
}


_setup_config
