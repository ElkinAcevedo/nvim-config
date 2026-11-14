return {
  "coder/claudecode.nvim",
  opts = {
    -- Claude Code usa por defecto "pantalla alternativa" (fullscreen), que no deja
    -- historial en el buffer de nvim y por eso no se podía hacer scroll.
    -- Con esto escribe en línea y el scroll normal de nvim funciona.
    env = { CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN = "1" },
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
