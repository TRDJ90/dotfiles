fish_add_path "opt/homebrew/bin/"

alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gbn="git new branch"


function ga 
    git add $argv;
end

function gc
    git commit -m $argv;
end

function gs
    git status $argv;
end

starship init fish | source
zoxide init fish | source
