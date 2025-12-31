local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- ========== General ==========
-- WezTerm auto-reloads this file when you save it.

-- ========== Shell ==========
config.default_prog = { "/bin/zsh", "-l" }

-- ========== Window ==========
config.window_background_opacity = 0.95
config.window_decorations = "TITLE|RESIZE"

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- ========== Font ==========
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 16.0

-- ========== Cursor ==========
-- Equivalent to Block + blinking = On
config.default_cursor_style = "BlinkingBlock"

-- ========== Keys ==========
config.keys = {
  { key = "Enter", mods = "SHIFT", action = wezterm.action { SendString = "\x1b\r" } },
}

-- ========== Scrolling ==========
config.scrollback_lines = 10000
-- WezTerm doesn't have exact 'multiplier = 3' like Alacritty, so this is ignored.

-- ========== Colors ==========
-- Catppuccin Mocha-like from your Alacritty config

config.colors = {
  foreground = "#cdd6f4",
  background = "#1e1e2e",

  cursor_bg = "#f5e0dc",
  cursor_fg = "#1e1e2e",
  cursor_border = "#f5e0dc",

  selection_fg = "#1e1e2e",
  selection_bg = "#f5e0dc",

  -- Normal colors
  ansi = {
    "#45475a", -- black
    "#f38ba8", -- red
    "#a6e3a1", -- green
    "#f9e2af", -- yellow
    "#89b4fa", -- blue
    "#f5c2e7", -- magenta
    "#94e2d5", -- cyan
    "#bac2de", -- white
  },

  -- Bright colors
  brights = {
    "#585b70", -- black
    "#f38ba8", -- red
    "#a6e3a1", -- green
    "#f9e2af", -- yellow
    "#89b4fa", -- blue
    "#f5c2e7", -- magenta
    "#94e2d5", -- cyan
    "#a6adc8", -- white
  },

  -- WezTerm doesn't have distinct search/hints/footer colors
  -- like Alacritty, but we leave base colors matching.
}

return config
