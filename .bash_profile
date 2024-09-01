if [ -f ~/.bashrc ]; then 
    . ~/.bashrc
fi

PATH="$PATH:$HOME/.local/bin"

alias m='micro'
alias ref='grep --exclude-dir={build,.*} -rnIE'

export EDITOR=micro
export VCPKG_ROOT=$HOME/vcpkg

lf() {
    local tmp="$(mktemp)"
    command lf -command "map <c-w> \$echo \$PWD > $tmp; lf -remote \"send \$id quit\"" "$@"
    cd "$(cat "$tmp")" || return
    rm -f "$tmp"
}

if [ -n "$WSL_DISTRO_NAME" ]
then
    # appendWindowsPath=false and bringing the essentials
    ln -sf "/mnt/c/Windows/System32/wsl.exe" "$HOME/.local/bin/wsl"
    ln -sf "/mnt/c/Windows/explorer.exe"     "$HOME/.local/bin/explorer"
    ln -sf "/mnt/c/Program Files/Microsoft VS Code/bin/code" "$HOME/.local/bin/"
    PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'
fi
