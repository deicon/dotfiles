vim.cmd [[source ~/.config/nvim/init.cim]]

-- Vim hop Motions Plugin
local hop =  require('hop')
hop.setup {
	keys = 'etovxqpdygfblzhckisuran',
	create_hl_autocmd = false
}
local directions = require('hop.hint').HintDirection

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('telescope').setup {

}

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>f/', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- GIT Shortcurts for Telescope
vim.keymap.set('n', '<leader>fgf', telescope.git_files, {})
vim.keymap.set('n', '<leader>fgb', telescope.git_branches, {})
vim.keymap.set('n', '<leader>fgc', telescope.git_commits, {})

vim.keymap.set('n', '<leader>qf', telescope.quickfix, {})
vim.keymap.set('n', '<leader>qfh', telescope.quickfixhistory, {})
vim.keymap.set('n', '<leader>fcb', telescope.current_buffer_fuzzy_find, {})

map("n", "<C-j>", ":cnext<cr>")
map("n", "<C-k>", ":cprev<cr>")



-- LSP Support 
require('dieter')


