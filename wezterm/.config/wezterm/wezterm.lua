local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({{family = "Fira Code"}})

return config
