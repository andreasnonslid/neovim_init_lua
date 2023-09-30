local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat',
    },
  }
)

require('leap').add_default_mappings()

-- Remap hjkl to arrow keys
local map = vim.api.nvim_set_keymap
-- normal mode
map('n', 'j', '<Left>', { noremap = true })
map('n', 'k', '<Down>', { noremap = true })
map('n', 'i', '<Up>', { noremap = true })
map('n', 'l', '<Right>', { noremap = true })
map('n', 'h', 'i', { noremap = true })
-- visual mode
map('v', 'j', '<Left>', { noremap = true })
map('v', 'k', '<Down>', { noremap = true })
map('v', 'i', '<Up>', { noremap = true })
map('v', 'l', '<Right>', { noremap = true })
map('v', 'h', 'I', { noremap = true })
