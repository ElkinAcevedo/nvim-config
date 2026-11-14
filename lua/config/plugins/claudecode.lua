return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      provider = "native", -- sin snacks.nvim, usa :terminal
      split_side = "right",
      split_width_percentage = 0.35,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>",                  desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",             desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",         desc = "Resume sesión" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>",       desc = "Continuar última" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",             desc = "Agregar buffer actual" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Enviar selección" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",        desc = "Aceptar diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",          desc = "Rechazar diff" },
  },
}
