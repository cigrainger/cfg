# Better history. See https://www.soberkoder.com/better-zsh-history/.
HISTFILE=~/.zsh_history
SAVEHIST=100000
HISTSIZE=100000
HISTTIMEFORMAT="[%F %T] "
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

if type nvim &>/dev/null; then
    alias vim=nvim
    alias v=nvim
    export EDITOR=nvim
else
    export EDITOR=vim
fi

if type exa &>/dev/null; then
    # use exa for ls
    alias ls='exa'
    alias l='exa -l --git'
    alias la='exa -a'
    alias lla='exa -la --git'
    alias lt='exa --tree -l --git'
fi

if type bat &>/dev/null; then
    alias cat=bat
    export BAT_THEME="Nord"
fi

if type aws-vault &>/dev/null; then
    alias avl='aws-vault login'
    alias ave='aws-vault exec'
    export AWS_VAULT_KEYCHAIN_NAME=login
    if type ykman &>/dev/null; then
        export AWS_VAULT_PROMPT=ykman
    fi
fi

if type fzf &>/dev/null; then
    export FZF_ALT_C_COMMAND="fd -t d ."
    export FZF_ALT_C_OPTS="--preview 'exa --tree -l --git {} | head -200'"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_COMMAND="fd . -t f"
    export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%'"
fi


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

alias tmux='direnv exec / tmux -f ~/.config/tmux/tmux.conf'
alias md='mkdir -p'
source $HOME/.zsh_functions
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
bindkey -v
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chris/.asdf/installs/python/miniconda3-latest/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chris/.asdf/installs/python/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/Users/chris/.asdf/installs/python/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chris/.asdf/installs/python/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -f "$HOME/.asdf/asdf.sh" ]; then
    . $HOME/.asdf/asdf.sh
elif [ -f "/opt/homebrew/opt/asdf/asdf.sh" ]; then
    . /opt/homebrew/opt/asdf/asdf.sh
fi

