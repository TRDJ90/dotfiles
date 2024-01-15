local wezterm = require 'wezterm'
local action = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In never version of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.80
config.macos_window_background_blur = 25
config.color_scheme = 'Hacktober'

config.enable_tab_bar = false
config.tab_bar_at_bottom = false

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14
config.allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
  {
    key = 'v', mods = 'SUPER', action = action.PasteFrom 'Clipboard'
  },
  {
    key = 'c', mods = 'SUPER', action = action.CopyTo 'ClipboardAndPrimarySelection'
  }
}

return config
