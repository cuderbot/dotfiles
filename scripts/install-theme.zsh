ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
LAMBDA_MOD_URL="https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme"

DESTINATION_PATH="${ZSH_CUSTOM}/themes/lambda-mod.zsh-theme"

curl -g ${LAMBDA_MOD_URL} -o ${DESTINATION_PATH} 
