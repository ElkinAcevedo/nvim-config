return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    ts.install({
      "bash", "c", "html", "javascript", "json", "lua",
      "markdown", "markdown_inline", "python", "query",
      "toml", "typescript", "vim", "vimdoc", "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        if pcall(vim.treesitter.start, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
