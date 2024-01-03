local wezterm = require 'wezterm'
local muxer = wezterm.mux
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
config.inactive_pane_hsb = {
  saturation = 0.75,
  brightness = 0.75,
}

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 15
config.allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace'

config.window_padding = {
  left = 0, 
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'Mode: ' .. name
  end
  window:set_right_status(name or '')
end)

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
  { 
    key = 's', mods = 'SUPER' , action = action.ActivateKeyTable {
      name = 'super_mode',
      one_shot = false,
    }
  },
  {
    key = 'v', mods = 'SUPER', action = action.PasteFrom 'Clipboard'
  },
  {
    key = 'c', mods = 'SUPER', action = action.CopyTo 'ClipboardAndPrimarySelection'
  }
}


config.key_tables = {
  super_mode = {
    { key = 'p', action = action.ActivateKeyTable { name = 'pane_mode',   one_shot = false }},
    { key = 't', action = action.ActivateKeyTable { name = 'tab_mode',    one_shot = false }},
    { key = 'a', action = action.ActivateKeyTable { name = 'layout_mode', one_shot = false }},
    { key = 'd', action = action.ActivateKeyTable { name = 'debug_mode',  one_shot = false }},
    
    -- pane switching
    { key = 'LeftArrow',  action = action.ActivatePaneDirection 'Left', },
    { key = 'RightArrow', action = action.ActivatePaneDirection 'Right'},
    { key = 'UpArrow',    action = action.ActivatePaneDirection 'Up'},    
    { key = 'DownArrow',  action = action.ActivatePaneDirection 'Down'},
    
    { key = 'h', action = action.ActivatePaneDirection 'Left'},
    { key = 'l', action = action.ActivatePaneDirection 'Right'},
    { key = 'k', action = action.ActivatePaneDirection 'Up'},
    { key = 'j', action = action.ActivatePaneDirection 'Down'},
    
    -- tab switchin
    { key = 'LeftArrow',   mods = 'SHIFT', action = action.ActivateTabRelative(-1)},
    { key = 'RightArrow',  mods = 'SHIFT', action = action.ActivateTabRelative(1)},
    
    { key = 'Escape', action = action.ClearKeyTableStack },
    { key = 'Enter',  action = action.ClearKeyTableStack },
  },
  
  debug_mode = {
    { key = 'l', action = action.ShowDebugOverlay},
    { key = 'r', action = action.ReloadConfiguration}, 

    { key = 'Escape', action = action.ClearKeyTableStack },
    { key = 'Enter',  action = action.ClearKeyTableStack },
  },

  pane_mode = {
    { key = 'f', action = action.SplitVertical { domain = 'CurrentPaneDomain' }},
    { key = 'v', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    
    { key = 'LeftArrow',  action = action.ActivatePaneDirection 'Left', },
    { key = 'RightArrow', action = action.ActivatePaneDirection 'Right'},
    { key = 'UpArrow',    action = action.ActivatePaneDirection 'Up'},
    { key = 'DownArrow',  action = action.ActivatePaneDirection 'Down'},
    
    { key = 'h', action = action.ActivatePaneDirection 'Left'},
    { key = 'l', action = action.ActivatePaneDirection 'Right'},
    { key = 'k', action = action.ActivatePaneDirection 'Up'},
    { key = 'j', action = action.ActivatePaneDirection 'Down'},
    
    { key = 'Escape', action = action.ClearKeyTableStack },
    { key = 'Enter',  action = action.ClearKeyTableStack },
  },

  tab_mode = {
    { key = 'n', action = action.SpawnCommandInNewTab},

    { key = 'LeftArrow', action = action.ActivateTabRelative(-1)},
    { key = 'RightArrow', action = action.ActivateTabRelative(1)},
    { key = 'x', action = action.CloseCurrentTab { confirm = true }},

    { key = 'Escape', action = action.ClearKeyTableStack },
    { key = 'Enter',  action = action.ClearKeyTableStack },
  },
}

return config
