# .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Append the user's local environment to the PATH.
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Append the user's Go environment to the PATH.
APPEND="$HOME/go/bin"
if [ -d $APPEND ]; then
    export GOPATH="$HOME/go"
    PATH="$PATH:$APPEND"
fi

# Append the user's Rust environment to the PATH.
APPEND="$HOME/.cargo/bin"
if [ -d $APPEND ]; then
    PATH="$PATH:$APPEND"
fi

# Append the user's JS environment to the PATH.
APPEND="$HOME/.local/share/pnpm"
if [ -d $APPEND ]; then
    export PNPM_HOME=$APPEND
    PATH="$PATH:$APPEND"
fi

export PATH

# Run the configuration scripts in `bashrc.d`.
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

