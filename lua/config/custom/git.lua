-- Commit rápido pero revisado: muestra qué cambió, pides el mensaje y confirmas
local function git(args)
  local out = vim.fn.systemlist(vim.list_extend({ "git" }, args))
  return out, vim.v.shell_error
end

local function commit()
  local status, err = git({ "status", "--short" })
  if err ~= 0 then return vim.notify("No es un repositorio git", vim.log.levels.WARN) end
  if #status == 0 then return vim.notify("No hay cambios para commitear") end

  vim.cmd("redraw")
  print("Cambios que se van a incluir (git add -A):\n" .. table.concat(status, "\n"))
  vim.ui.input({ prompt = "Mensaje del commit (vacío = cancelar): " }, function(msg)
    if not msg or vim.trim(msg) == "" then return vim.notify("Commit cancelado") end
    local add_out, add_code = git({ "add", "-A" })
    if add_code ~= 0 then return vim.notify(table.concat(add_out, "\n"), vim.log.levels.ERROR) end
    local out, code = git({ "commit", "-m", msg })
    vim.notify(table.concat(out, "\n"), code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR)
  end)
end

local function push()
  if vim.fn.confirm("¿Hacer git push?", "&Sí\n&No", 2) ~= 1 then return end
  local out, code = git({ "push" })
  vim.notify(table.concat(out, "\n"), code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR)
end

vim.keymap.set("n", "<leader>gc", commit, { desc = "Git commit (revisado)" })
vim.keymap.set("n", "<leader>gp", push, { desc = "Git push (con confirmación)" })
vim.keymap.set("n", "<leader>gs", "<cmd>!git status<cr>", { desc = "Git status" })
