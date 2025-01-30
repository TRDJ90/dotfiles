starship init fish | source
zoxide init fish | source

fish_add_path opt/homebrew/bin/
fish_add_path ~/tools/zls/zig-out/bin
fish_add_path ~/tools/omnisharp
fish_add_path ~/tools/zigup/zig-out/bin
fish_add_path ~/tools/bin
fish_add_path ~/tools/wgsl-analyzer/target/release
fish_add_path /Users/thubie/VulkanSDK/1.3.296.0/macOS/bin
fish_add_path /opt/homebrew/opt/llvm/bin

set -Ux VULKAN_SDK /Users/thubie/VulkanSDK/1.3.296.0/macOS
set -Ux DYLD_LIBRARY_PATH /Users/thubie/VulkanSDK/1.3.296.0/macOS/lib
set -Ux VK_ICD_FILENAMES /Users/thubie/VulkanSDK/1.3.296.0/macOS/share/vulkan/icd.d/MoltenVK_icd.json
set -Ux VK_LAYER_PATH /Users/thubie/VulkanSDK/1.3.296.0/macOS/share/vulkan/explicit_layer.d
set -Ux VK_ADD_LAYER_PATH /Users/thubie/VulkanSDK/1.3.296.0/macOS/share/vulkan/explicit_layer.d/

#set -Ux VK_LOADER_DEBUG driver

alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gbn="git new branch"

alias ls="ls with exa"

function ga
    git add $argv
end

function gc
    git commit -m $argv
end

function gs
    git status $argv
end

function gbn
    git switch -c $argv
end

function ls
    eza --icons=always
end

source ~/projects/emsdk/emsdk_env.fish

clear
