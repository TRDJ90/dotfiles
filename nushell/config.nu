use std/util "path add"

# Add paths to the Path environment variables
path add ~/tools/zls/zig-out/bin/


# init starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# init zoxide
zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu
