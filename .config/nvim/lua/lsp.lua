require'lspconfig'.tsserver.setup {}

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
  end,
})
