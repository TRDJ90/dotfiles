fish_add_path "opt/homebrew/bin/"

alias ga="git add"
function ga 
    git add $argv;
end


starship init fish | source
zoxide init fish | source
