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
