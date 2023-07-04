-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  return
end

local lsp_signature_status, lsp_signature = pcall(require, 'lsp_signature')
if not lsp_signature_status then
  return
end

-- Import the lsp signature config table in the lsp_signature_table.lua file
local lsp_signature_config = require 'brady.plugins.lsp.lsp_signature_config'

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  lsp_signature.on_attach(lsp_signature_config, bufnr)

  -- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
  keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
  keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
  keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = ' ', Warn = ' ', Hint = 'ﴞ ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- configure python server with plugin
lspconfig['pyright'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
