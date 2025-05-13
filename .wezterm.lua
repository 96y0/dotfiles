local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    tabs_enabled = true,
    theme = 'Catppuccin Mocha',
    icons_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
    component_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
    tab_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tabline_x = { ' ' },
    tabline_y = { 'datetime' },
    tabline_z = { 'domain' }
  },
  extensions = {},
})

-- config.line_height = 1
config.font_size = 10.5
config.font = wezterm.font 'JetBrainsMonoNF'
config.font = wezterm.font_with_fallback { 'JetBrainsMonoNF', 'Fira Code' }
config.window_background_opacity = 0.85
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.color_scheme = 'Catppuccin Mocha'
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

local act = wezterm.action

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {

  -- Pane --
  { key = 'r', mods = 'LEADER',
    action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, },
  },

  { key = 't', mods = 'LEADER',
    action = act.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 1000, },
  },

  { key = 'v', mods = 'LEADER', action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = 's', mods = 'LEADER', action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },


  -- Tab --
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },

  { key = 'h', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'l', mods = 'LEADER', action = act.ActivateTabRelative(1) },

  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'DefaultDomain' },
  { key = 'x', mods = 'LEADER', action = wezterm.action_callback(function(win, pane)
    local tab, window = pane:move_to_new_window()
  end)
}
}

config.key_tables = {

  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },

  activate_pane = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },
  },
}


return config
