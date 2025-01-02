eval "$(/opt/homebrew/bin/brew shellenv)"

ulimit -n 10240  # Increase file descriptor limit

export VISUAL=nvim
export EDITOR="$VISUAL"
export ERL_AFLAGS="-kernel shell_history_enabled"
export FUNCNEST=100
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
