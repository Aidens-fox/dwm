require("full-border"):setup{
type = ui.Border.PLAIN,
}
local gruvbox_theme = require("yatline-gruvbox"):setup("dark")
require("yatline"):setup {
    theme = gruvbox_theme,
    section_separator = { open = "", close = "" },
    part_separator    = { open = "", close = "" },
    inverse_separator = { open = "", close = "" },
}
