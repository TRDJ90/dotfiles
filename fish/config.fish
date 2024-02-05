starship init fish | source
zoxide init fish | source

fish_add_path "opt/homebrew/bin/"

alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gbn="git new branch"

alias ls="ls with exa"

function ga
    git add $argv;
end

function gc
    git commit -m $argv;
end

function gs
    git status $argv;
end

function gbn
    git switch -c $argv;
end

function ls
    eza --icons=always
end
