vim.keymap.set('n', '<leader>w', ':w<CR>');

vim.keymap.set("n", "<leader>co", "<cmd>w<CR><cmd>!gcc -fopenmp -lm % -o %:r && ./%:r<CR>",
  { desc = "Compile to enable openmp & Run" })

vim.keymap.set("n", "<leader>ci", "<cmd>w<CR><cmd>!mpicc % -o %:r && ./%:r<CR>",
  { desc = "Compile to enable openmp & Run" })

vim.keymap.set("n", "<leader>zo", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  vim.cmd("botright split | terminal python3 " .. file)
end, { desc = "Run Python file" })

vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  local out = vim.fn.expand("%:r")
  vim.cmd("botright split | terminal gcc " .. file .. " -o " .. out .. " && ./" .. out)
end, { desc = "Compile & Run (terminal)" })


vim.keymap.set("n", "<leader>hs", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  vim.cmd("botright split | terminal runghc -s" .. file)
end, { desc = "Run Haskell file" })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
