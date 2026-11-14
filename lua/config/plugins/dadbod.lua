return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod",                     lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
    -- Credenciales en lua/config/secrets.lua (ignorado por git)
    local ok, secrets = pcall(require, "config.secrets")
    vim.g.dbs = ok and secrets.dbs or {}
  end,
}
