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
    source ~/workspace/dotfiles/zsh/alias.zsh
    source ~/workspace/dotfiles/zsh/alias-git.zsh
    source ~/workspace/dotfiles/zsh/alias-work.zsh
    source ~/workspace/dotfiles/zsh/alias-pnpm.zsh
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

_setup_zoxide() {
    source ~/workspace/dotfiles/zsh/zoxide.zsh
    export _ZO_DATA_DIR="/Users/javier/.zoxide/"
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

_setup_aws_cluster_switcher() {
    function clusters() {
        declare -rA aws_clusters=(["dev"]="nwp-desa-cluster" ["qa"]="nwm-test-cluster" ["prod"]="nwm-prod-cluster" ["trans"]="mmb-test-cluster")
        items=("dev" "qa" "prod" "trans")
        selected=$(printf "%s\n" "${items[@]}" | fzf --prompt="Cluster Options  " --height=~50% --layout=reverse --border --exit-0)
        if [[ -z $selected ]]; then
            echo "Selecciona un cluster"
            return 0
        fi
        
        echo "aws eks update-kubeconfig --name ${aws_clusters[$selected]} --region us-east-1 && kgpa"
        eval "aws eks update-kubeconfig --name ${aws_clusters[$selected]} --region us-east-1 && kgpa"
    }

    bindkey -s ^a "clusters\n"
}


_setup_fzf() {
    eval "$(fzf --zsh)"
    source /Users/javier/.fzf/shell/key-bindings.zsh
    source /Users/javier/.fzf/shell/completion.zsh
    
    # export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
}

_setup_pnpm() {
    export PNPM_HOME="/Users/javier/Library/pnpm"
    case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
}

_setup_opencode() {
    export EDITOR="code --wait"
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

    # Setup aws eks cluster switcher
    _setup_aws_cluster_switcher
    
    # Setup fzf
    _setup_fzf

    # Setup pnpm
    _setup_pnpm

    _setup_opencode
}


_setup_config


# pnpm
export PNPM_HOME="/Users/javier/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. "$HOME/.local/bin/env"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# opencode
export PATH=/Users/javier/.opencode/bin:$PATH


# Added by Antigravity CLI installer
export PATH="/Users/javier/.local/bin:$PATH"
