local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

icons = require('haiwen.core.icons')

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end

-- Banner
local banner = {
  "                                                 ",
  " ██╗  ██╗ █████╗ ██╗██╗    ██╗███████╗███╗   ██╗ ",
  " ██║  ██║██╔══██╗██║██║    ██║██╔════╝████╗  ██║ ",
  " ███████║███████║██║██║ █╗ ██║█████╗  ██╔██╗ ██║ ",
  " ██╔══██║██╔══██║██║██║███╗██║██╔══╝  ██║╚██╗██║ ",
  " ██║  ██║██║  ██║██║╚███╔███╔╝███████╗██║ ╚████║ ",
  " ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝ ",
  "                                                 ",
  "            ██╗   ██╗██╗███╗   ███╗              ",
  "            ██║   ██║██║████╗ ████║              ",
  "            ██║   ██║██║██╔████╔██║              ",
  "            ╚██╗ ██╔╝██║██║╚██╔╝██║              ",
  "             ╚████╔╝ ██║██║ ╚═╝ ██║              ",
  "              ╚═══╝  ╚═╝╚═╝     ╚═╝              ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button("f", icons.ui.Files .. "  Find file", ":Telescope find_files <CR>"),
  dashboard.button('e', icons.ui.File .. "  New file", ':ene <BAR> startinsert<CR>'),
  dashboard.button('c', icons.ui.Gear .. "  Edit nvim config", ':e $MYVIMRC<CR>'),
  dashboard.button('q', icons.ui.SignOut .. "  Quit", ':qa<CR>'),
  dashboard.button("u", icons.ui.CloudDownload .. "  Update plugins", ":PackerSync<CR>"),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
