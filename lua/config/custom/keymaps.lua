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

-- Navegación entre ventanas con Alt+h/j/k/l (funciona también desde terminales, p.ej. Claude Code)
for _, dir in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("t", "<A-" .. dir .. ">", "<C-\\><C-n><C-w>" .. dir, { desc = "Ir a ventana " .. dir })
  vim.keymap.set("n", "<A-" .. dir .. ">", "<C-w>" .. dir, { desc = "Ir a ventana " .. dir })
end

-- Salir del modo terminal a modo normal (para hacer scroll, copiar, usar <leader>...)
vim.keymap.set("t", "<A-n>", "<C-\\><C-n>", { desc = "Terminal: modo normal" })

-- Al volver a una ventana de terminal, entrar directo a escribir
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "term://*",
  callback = function() vim.cmd("startinsert") end,
})
