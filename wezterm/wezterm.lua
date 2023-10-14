local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In never version of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.80
config.macos_window_background_blur = 25
config.color_scheme = 'Google Dark (Gogh)'
config.enable_tab_bar = false

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
