require("bufferline").setup{
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = false,
    color_icons = true
  }
}
