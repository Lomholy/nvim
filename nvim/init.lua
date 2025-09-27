print('Hello world')



require "opts"
require "launch"


spec("plugins.colorscheme")
spec("plugins.treesitter")
spec("plugins.telescope")
spec("plugins.fugitive")
spec("plugins.harpoon")
spec("plugins.undotree")
spec("plugins.lsp-zero")
spec("plugins.autopairs")
spec("plugins.luasnip")
spec("plugins.vimtex")


--require("luasnip.loaders.from_vscode").lazy_load()

require "plugins.lazy"
spec("plugins.mason")
require "keymaps"

-- Filetype detection for .instr and .comp
vim.cmd [[
  augroup mccode_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.instr set filetype=mccode
    autocmd BufRead,BufNewFile *.comp set filetype=mccode
  augroup END
]]

-- Optional: Explicitly source the syntax file (usually not needed if filetype is set)
vim.cmd [[
  autocmd FileType mccode source ~/.config/nvim/syntax/mccode.vim
]]

vim.api.nvim_create_augroup('VimtexAutoView', {})
vim.api.nvim_create_autocmd('User', {
  group = 'VimtexAutoView',
  pattern = 'VimtexEventCompileSuccess',
  command = 'VimtexView',
})

