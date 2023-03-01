local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local mappings = {
  x = { ":bdelete<cr>", "Close" },
  E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
  f = { ":Telescope find_files<cr>", "Telescope Find Files" },
  m = { ":MaximizerToggle<cr>", "Vim-Maximize" },
  e = { ":NvimTreeToggle<cr>", "Nvim Tree Toggle" },
  L = { ":bnext<cr>", "Buffer Next" },
  H = { ":bprevious<cr>", "Buffer Previous" },
  g = {
    name = 'Terminal & Git',
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    l = { toggle_lazygit, "LazyGit" }
  },
  s = {
    name = 'Window Split',
    v = { ":<C-w>v", "Split Window Vertically" },
    h = { ":<C-w>s", "Split Window Horizontally" },
    e = { ":<C-w>=", "Split Window Equal Width" },
    x = { ":close<CR>=", "Close Window"},
  },
  t = {
    name = 'Tab',
    o = { ":tabnew<CR>", "Open New tab" },
    x = { ":tabclose<CR>", "Close Current Tab" },
    n = { ":tabn<CR>", "Go to next tab" },
    p = { ":tabp<CR>", "Go to Previous Tab"},
  },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" }
  },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
