local options = {
  ensure_installed = { "lua", "javascript", "json", "php", "css", "html", "rust", "twig", "sql", "bash", "c", "cpp", "markdown", "python", "vim", "vimdoc"},

  highlight = {
    enable = true,
    use_languagetree = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  indent = {
    enable = true,
    disable = { "javascript" },
  },
}

return options
