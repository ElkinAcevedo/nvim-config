-- Terminal pequeña debajo de la ventana de código (no ocupa el ancho de Claude)
local term = { buf = nil, win = nil }
local HEIGHT = 10

local function toggle_terminal()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    term.win = nil
    return
  end
  -- Si estás en la ventana de Claude u otra terminal, abrir bajo la primera ventana de código
  if vim.bo.buftype == "terminal" then
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == "" then
        vim.api.nvim_set_current_win(win)
        break
      end
    end
  end
  vim.cmd("belowright " .. HEIGHT .. "split")
  term.win = vim.api.nvim_get_current_win()
  -- Reusar la terminal si su shell sigue viva (si hiciste `exit`, se crea una nueva)
  local alive = term.buf and vim.api.nvim_buf_is_valid(term.buf)
    and vim.fn.jobwait({ vim.bo[term.buf].channel }, 0)[1] == -1
  if alive then
    vim.api.nvim_win_set_buf(term.win, term.buf)
  else
    vim.cmd("terminal")
    term.buf = vim.api.nvim_get_current_buf()
    vim.bo[term.buf].buflisted = false
  end
  vim.wo[term.win].winfixheight = true
  vim.cmd("startinsert")
end

-- Ojo: Hyprland usa Alt como mainMod (Alt+T, Alt+J, Alt+flechas, etc. no llegan a nvim)
vim.keymap.set({ "n", "t" }, "<A-o>", toggle_terminal, { desc = "Abrir/cerrar terminal" })

-- Cambiar tamaño de la ventana actual (funciona también dentro de Claude/terminal)
local resize = {
  ["<A-,>"] = "vertical resize -5", -- como < : más angosta
  ["<A-.>"] = "vertical resize +5", -- como > : más ancha
  ["<A-=>"] = "resize +2",          -- más alta
  ["<A-->"] = "resize -2",          -- más baja
}
for key, cmd in pairs(resize) do
  vim.keymap.set({ "n", "t" }, key, "<cmd>" .. cmd .. "<cr>", { desc = cmd })
end

-- Scroll en terminales: sale a modo normal y desplaza (para volver a escribir: i)
vim.keymap.set("t", "<ScrollWheelUp>", "<C-\\><C-n><ScrollWheelUp>", { desc = "Terminal: scroll arriba con mouse" })
vim.keymap.set("t", "<A-u>", "<C-\\><C-n><C-u>", { desc = "Terminal: subir media página" })
