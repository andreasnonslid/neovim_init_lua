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

-- Define a function to simplify key mapping
local function map(mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  vim.api.nvim_set_keymap(mode, key, result, opts)
end

-- Remap movement keys
local movement_mappings = {
  n = { j = '<Left>', k = '<Down>', i = '<Up>', l = '<Right>', h = 'i' },
  v = { j = '<Left>', k = '<Down>', i = '<Up>', l = '<Right>', h = 'I' },
}

for mode, mappings in pairs(movement_mappings) do
  for key, result in pairs(mappings) do
      map(mode, key, result)
  end
end

-- Remap Shift + movement keys
local shift_movement_mappings = {
  n = { J = '<S-Left>', K = '<S-Down>', I = '<S-Up>', L = '<S-Right>', H = 'I' },
  v = { J = '<S-Left>', K = '<S-Down>', I = '<S-Up>', L = '<S-Right>', H = '^' },
}

for mode, mappings in pairs(shift_movement_mappings) do
  for key, result in pairs(mappings) do
      map(mode, key, result)
  end
end
