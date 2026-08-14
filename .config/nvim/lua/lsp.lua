require'lspconfig'.tsserver.setup {}
require'lspconfig'.gopls.setup {}

local lsputil = require'lspconfig.util'

require'lspconfig'.sorbet.setup {
  -- Default cmd; overridden per-project by on_new_config below.
  cmd = { 'srb', 'tc', '--lsp' },
  root_dir = lsputil.root_pattern('sorbet/config'),
  on_new_config = function(config, root_dir)
    -- Prefer the project-local bin/srb wrapper when it exists.
    local local_srb = root_dir .. '/bin/srb'
    if vim.fn.executable(local_srb) == 1 then
      config.cmd = { local_srb, 'tc', '--lsp' }
    end
  end,
}

-- Use LSP go-to-definition on Ctrl+] when an LSP is attached,
-- falling back to the default tag jump otherwise.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, { buffer = args.buf })

    -- backport lsp mappings from nvim 0.10.0 {
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local mappings = {
      { modes = { 'n', 'x' }, lhs = 'gra', method = 'textDocument/codeAction', action = vim.lsp.buf.code_action },
      { modes = { 'n' }, lhs = 'gri', method = 'textDocument/implementation', action = vim.lsp.buf.implementation },
      { modes = { 'n' }, lhs = 'grn', method = 'textDocument/rename', action = vim.lsp.buf.rename },
      { modes = { 'n' }, lhs = 'grr', method = 'textDocument/references', action = vim.lsp.buf.references },
      { modes = { 'n' }, lhs = 'grt', method = 'textDocument/typeDefinition', action = vim.lsp.buf.type_definition },
    }

    for _, mapping in ipairs(mappings) do
      if client and client.supports_method(mapping.method) then
        for _, mode in ipairs(mapping.modes) do
          if vim.tbl_isempty(vim.fn.maparg(mapping.lhs, mode, false, true)) then
            vim.keymap.set(mode, mapping.lhs, mapping.action, { buffer = args.buf })
          end
        end
      end
    end
    -- } end backport lsp mappings from nvim 0.10.0
  end,
})
