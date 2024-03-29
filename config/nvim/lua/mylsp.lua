-- Native LSP Support Configuration
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').gopls.setup {
	print('Go LSP Setting up'),
	capabilities = capabilities,
	on_attach = function() 
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
		vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, {buffer=0})
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
		vim.keymap.set('n', '<leader>dl','<cmd>Telescope diagnostics<cr>') 
		vim.keymap.set('n', '<leader>dj',vim.diagnostic.goto_next, {buffer=0}) 
		vim.keymap.set('n', '<leader>dk',vim.diagnostic.goto_next, {buffer=0}) 
	end
}


-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)
-- Set up nvim-cmp.  
  vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" } 

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
	   
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })



  -- Debugging using vim dap
 vim.keymap.set("n", "<F5>", ":lua require('dap').step_out()<CR>")
 vim.keymap.set("n", "<F7>", ":lua require('dap').step_into()<CR>")
 vim.keymap.set("n", "<F8>", ":lua require('dap').step_over()<CR>")
 vim.keymap.set("n", "<F9>", ":lua require('dap').continue()<CR>")
 vim.keymap.set("n", "<leader>sb", ":lua require('dap').toggle_breakpoint()<CR>")
 vim.keymap.set("n", "<leader>sB", ":lua require('dap').set_breakpoint(vim.fn.input('Condition'))<CR>")
 vim.keymap.set("n", "<leader>dr", ":lua require('dap').repl.open()<CR>")
 vim.keymap.set("n", "<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log Point message: '))<CR>")

 require('dap-go').setup() 
 require('dapui').setup()

