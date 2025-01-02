# Initialize Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

eval "$(starship init zsh)"

# Core plugins with syntax highlighting, autosuggestions, and completions
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# GitHub releases installations
zinit as="command" lucid from="gh-r" for \
    id-as="usage" \
    atpull="%atclone" \
    jdx/usage

# Runtime version manager
zinit as="command" lucid from="gh-r" for \
    id-as="mise" mv="mise* -> mise" \
    atclone="./mise* completion zsh > _mise" \
    atpull="%atclone" \
    pick="mise" \
    atload='eval "$(mise activate zsh)"' \
    jdx/mise

# Fuzzy finder configuration
zinit ice lucid multisrc"shell/{completion,key-bindings}.zsh"
zinit light junegunn/fzf

# Shell history management
zinit load atuinsh/atuin

# Modern alternatives for traditional commands
alias vim='nvim'
alias vi='nvim' 
alias cat='bat'
alias cd='z'
alias df='duf'
alias du='dust'

# Basic file listing with icons and directory grouping
alias ls='eza --icons --color=auto --group-directories-first'

# Detailed list with git status
alias ll='eza -la --icons --group-directories-first --git --time-style=long-iso'

# Show tree view
alias lt='eza --tree --level=2 --icons'

# List by modification time
alias llm='eza -la --icons --sort=modified --time-style=long-iso'

# List only directories
alias ld='eza -D --icons'

# aws-vault management
alias ave='aws-vault exec'
alias avl='aws-vault login'
export AWS_VAULT_PROMPT="ykman"

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Common operations
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'

# Catppuccin color scheme for FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# FZF command configurations
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '.git'"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '.git'"
export FZF_ALT_C_OPTS="--preview 'eza --tree {} | head -200'"

# Vi mode configuration
bindkey -v

# Increase history size
HISTSIZE=50000
SAVEHIST=50000

# Better directory stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Better completion
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# Atuin (shell history) configuration
eval "$(atuin init zsh)"
bindkey '^r' atuin-search
bindkey '^R' atuin-search
bindkey '^[[A' atuin-up-search
bindkey '^[OA' atuin-up-search

# Zellij (terminal multiplexer) wrapper
zj() {
    if [ $# -eq 0 ]; then
        zellij attach -c "$(basename $PWD)"
    else
        zellij "$@"
    fi
}

alias tmux='zj'

function current_dir() {
    local current_dir=$PWD
    if [[ $current_dir == $HOME ]]; then
        current_dir="~"
    else
        current_dir=${current_dir##*/}
    fi
    
    echo $current_dir
}

function change_tab_title() {
    local title=$1
    command nohup zellij action rename-tab $title >/dev/null 2>&1
}

function set_tab_to_working_dir() {
    local result=$?
    local title=$(current_dir)

    change_tab_title $title
}

function set_tab_to_command_line() {
    local cmdline=$1
    change_tab_title $cmdline
}

if [[ -n $ZELLIJ ]]; then
    add-zsh-hook precmd set_tab_to_working_dir
    add-zsh-hook preexec set_tab_to_command_line
fi


# Yazi file manager wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotgit='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# shell gpt
export OPENAI_API_KEY="op://Engineering/OpenAI API Key/api key"
alias sgpt="op run -- sgpt"

# Initialize
eval "$(zoxide init zsh)"

if [[ "$TERM" = "xterm-ghostty" && -z "$ZELLIJ" ]]; then
    zj attach -c default
fi
