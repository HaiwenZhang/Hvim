---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.noice = {
  n = {
    ["<leader>snl"] = {
      function()
        require("noice").cmd "last"
      end,
      "Noice Last Message",
    },
    ["<leader>snh"] = {
      function()
        require("noice").cmd "history"
      end,
      "Noice History",
    },
    ["<leader>sna"] = {
      function()
        require("noice").cmd "all"
      end,
      "Noice All",
    },
    ["<leader>snd"] = {
      function()
        require("noice").cmd "dismiss"
      end,
      "Dismiss All",
    },
  },
  c = {
    ["<S-Enter>"] = {
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      "Redirect Cmdline",
    },
  },
}
-- more keybinds!

return M
