# .bashrc

# Source global definitions,
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set user specific environment.
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Set the Go environment if Go is installed.
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    PATH="$PATH:$GOPATH/bin"
fi

export PATH

# Set the PNPM environment if PNPM is installed.
if [ -d "$HOME/.local/share/pnpm" ]; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

# Execute user specific aliases and functions.
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Ask before removing or moving files.
alias rm='rm -i'
alias mv='mv -i'

# If using WSL, emit the working directory when the bash prompt is displayed.
if command -v wslpath > /dev/null; then
    PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND ; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'
fi

