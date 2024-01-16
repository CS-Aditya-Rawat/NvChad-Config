---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", opts={noremap=true, silent=true}},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", opts={noremap=true, silent=true}},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", opts={noremap=true, silent=true}},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", opts={noremap=true, silent=true}},
    ["<leader>a"] = {"<cmd>AerialToggle!<CR>", opts={noremap=true, silent=true}}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start of continue the debugger",
    }
  }
}

-- more keybinds!

return M
