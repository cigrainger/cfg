if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias cat=bat
alias vim=nvim
alias v=nvim
alias tmux='direnv exec / tmux'
alias lg=lazygit
alias md='mkdir -p'

# use exa for ls
alias ls='exa'
alias l='exa -l --git'
alias la='exa -a'
alias lla='exa -la --git'
alias lt='exa --tree -l --git'

# aws-vault
alias avl='aws-vault login'
alias ave='aws-vault exec'

export BAT_THEME="Nord"
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=ykman
export FZF_ALT_C_COMMAND="fd -t d ."
export FZF_ALT_C_OPTS="--preview 'exa --tree -l --git {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND="fd . -t f"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%'"
export EDITOR=nvim

source $HOME/.zsh_functions

. /usr/local/opt/asdf/asdf.sh

eval "$(direnv hook zsh)"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit snippet OMZ::plugins/git

bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=/Users/chris/.cfg/ --work-tree=/Users/chris'
