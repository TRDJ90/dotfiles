starship init fish | source
zoxide init fish | source

fish_add_path opt/homebrew/bin/
fish_add_path ~/tools/zls/zig-out/bin
fish_add_path ~/tools/zigup/zig-out/bin
fish_add_path ~/tools/bin
fish_add_path ~/tools/wgsl-analyzer/target/release
fish_add_path ~/VulkanSDK/1.3.283.0/macOS/bin


set -Ux VULKAN_SDK ~/VulkanSDK/1.3.283.0/macOS
#set -Ux DYLD_LIBRARY_PATH ~/VulkanSDK/1.3.280.0/macOS/lib
set -Ux VK_ICD_FILENAMES ~/VulkanSDK/1.3.280.0/macOS/share/vulkan/icd.d/MoltenVK_icd.json
set -Ux VK_LAYER_PATH ~/VulkanSDK/1.3.280.0/macOS/share/vulkan/explicit_layer.d

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

source ~/team-null-null.env
