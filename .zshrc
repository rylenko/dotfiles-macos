# Add binaries to path.
export PATH="$PATH:$(go env GOPATH)/bin"

# Disable less history file.
export LESSHISTFILE=-

# Set zsh directory
export ZSH="$HOME/.oh-my-zsh"

# Set editor to open from other applications
export EDITOR='nvim'

# Use x86-64 in docker containers
export DOCKER_DEFAULT_PLATFORM="linux/amd64"

# To sign git commits via GPG
export GPG_TTY=$(tty) 

# Remove "%" from first line after new shell open
unsetopt PROMPT_SP

# Configure theme and prompt
ZSH_THEME="jbergantine"
PROMPT='%~$(git_prompt_info)'

# Set plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-completions
)

# Load zsh
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# Set custom aliases
alias \
	cgr="git config user.name rylenko && git config user.email rylenko@tuta.io && git config user.signingkey 0C8755F6E37D3493 && git config commit.gpgsign true && git config core.sshCommand \"ssh -i ~/.ssh/daily\"" \
	cp="cp -iv" \
	ff="fastfetch" \
	rm="rm -iv" \
	mkdir="mkdir -p" \
	v="nvim" \
	o="oathtool --base32 --totp"
