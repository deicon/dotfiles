local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier, -- so prettier works only on these filetypes
	b.code_actions.eslint_d,
	b.code_actions.gitsigns,

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
