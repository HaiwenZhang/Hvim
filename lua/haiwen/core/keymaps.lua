local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- save file
keymap("n", "zz", ":w<CR>", opts)
keymap("n", "zq", ":x<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", opts) -- increment
keymap("n", "<leader>-", "<C-x>", opts) -- decrement

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tc", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-d>", ":bdelete<CR>", opts)


-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>sf", "<cmd>Telescope file_browser<cr>", opts)

-- Hop --
keymap("n", "f", "<cmd>HopChar1<cr>",opts)
keymap("n", "<leader>hw", "<cmd>HopWord<cr>",opts)
keymap("n", "<leader>hc", "<cmd>HopChar1<cr>",opts)
keymap("n", "<leader>hl", "<cmd>HopLine<cr>",opts)
keymap("n", "<leader>hs", "<cmd>HopPattern<cr>",opts)

-- neogit --
keymap("n", "<leader>g", "<cmd>Neogit<cr>", opts)

-- symbolsoutline --
keymap("n", "<leader>fs", "<cmd>SymbolsOutlineOpen<cr>", opts)

-- toggleterm --
keymap("n", "<leader>st", "<md>ToggleTerm<cr>", opts)

-- dap --
keymap("n", "<F5>", "<cmd>lua require'dap'.contine()<cr>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dn", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<leader>dR", "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>dp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)


-- nvim-gdb --
keymap("n", "<leader>dg", "<cmd>GdbStart gdbr<cr>", opts)
keymap("n", "<leader>dd", "<cmd>lua StartGdbSession()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua CreateWatch()<cr>", opts)
keymap("n", "<leader>dbt", "<cmd>GdbLopenBacktrace<cr>", opts)
keymap("n", "<leader>dbp", "<cmd>GdbLopenBreakpoints<cr>", opts)
